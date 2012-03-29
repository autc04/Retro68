module Main where

import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Language
import Text.ParserCombinators.Parsec.Token
import System.Directory
import System.FilePath
import Control.Monad(guard)
import Data.List(isSuffixOf)
import qualified System.IO.Error(try)
import System.IO
import qualified Text.PrettyPrint.HughesPJ as PP
import Text.PrettyPrint.HughesPJ((<+>),(<>),($$),($+$))
import Data.Char
import Numeric
import Data.Maybe(isJust)
import Control.Monad.State
import qualified Data.Map as Map
import System.Environment(getArgs)

data Item = CharItem Char
          | IgnoredItem
          | FunctionItem String String [String] [Integer] (Maybe ParameterRegs)
          | PragmaParameterItem String ParameterRegs
          deriving(Show)

type Register = String
data ParameterRegs = ParameterRegs (Maybe Register) [Register]
   deriving(Show)

tp = makeTokenParser javaStyle

item  =   (char '\r' >> return (CharItem '\n'))
      <|> try externApiDeclaration
      <|> try (string "= 0x4E90" >> return IgnoredItem)
      <|> try (string "= 0x4E91" >> return IgnoredItem)
      <|> try pragmaParameter
      <|> fmap CharItem anyChar

balancedText stopAtComma = fmap (foldr ($) "") $
      many (fmap (++) paranthesized <|> fmap (:) (noneOf (if stopAtComma then "()," else "()")))
   where paranthesized = char '(' >> balancedText False >>= \xs -> char ')' >> return ('(' : xs ++ ")")


trim = dropWhile isSpace . reverse . dropWhile isSpace . reverse
cleanup = unwords . words . trim

externApiDeclaration = do  
   reserved tp "EXTERN_API"
   rettype <- fmap trim $ parens tp (balancedText False)
   name <- identifier tp
   arguments <- fmap (map cleanup) $ parens tp (commaSep tp $ balancedText True)
   inlines <- option [] $ do
      inlinekey <- identifier tp
      guard ("WORDINLINE" `isSuffixOf` inlinekey)
      parens tp (commaSep tp hexword)
   semi tp
   return $ FunctionItem rettype name (if arguments == ["void"] then [] else arguments) inlines Nothing

pragmaParameter = do
   reservedOp tp "#"
   reserved tp "pragma"
   reserved tp "parameter"
   retval <- optionMaybe reg
   name <- identifier tp
   args <- parens tp (commaSep tp reg)
   -- args <- option [] $ parens tp (fmap return $ reg)
   -- let args = []
   return $ PragmaParameterItem name (ParameterRegs retval args)

reg = (reserved tp "__A0" >> return "%%a0")
   <|>(reserved tp "__A1" >> return "%%a1")
   <|>(reserved tp "__A2" >> return "%%a2")
   <|>(reserved tp "__D0" >> return "%%d0")
   <|>(reserved tp "__D1" >> return "%%d1")
   

data TypeCategory = ByteType | WordType | LongType | PointerType | VoidType
   deriving(Show, Eq)
classifyType tm t | "Ptr" `isSuffixOf` t = Just PointerType
               | "*" `isSuffixOf` t = Just PointerType
               | "Handle" `isSuffixOf` t = Just PointerType
classifyType tm "unsigned char" = Just ByteType
classifyType tm "signed char" = Just ByteType
classifyType tm "char" = Just ByteType
classifyType tm "short" = Just WordType
classifyType tm "long" = Just LongType
classifyType tm "void" = Just VoidType
classifyType tm t = Map.lookup t tm

hexword = integer tp
outputItem typeMap (CharItem c) = [c]
-- outputItem (FunctionItem rettype name arguments words) = "<fun>"
outputItem typeMap (FunctionItem rettype name arguments words mbParamRegs) = 
   PP.render $
      linkage <+> PP.text rettype <+> PP.text name
         <+> PP.parens (PP.hsep $ PP.punctuate PP.comma $ map PP.text arguments) $$
      if isJust mbCategories && not (null words)
         then
            PP.text "{" $+$ (PP.nest 4 $
               addReturnValue $
               PP.text "__asm__ __volatile__ (" $+$
               PP.nest 4 (
                  PP.nest 4 (PP.vcat asmStatements) $+$
                  showConstraints outs $+$
                  showConstraints ins $+$
                  PP.text ": \"%a0\", \"%a1\", \"%d0\", \"%d1\", \"%d2\""
                  <> (if tooltrap then PP.text ", \"%a5\"" else PP.empty)
               )
               $+$ PP.text ");"
            ) $+$ PP.text "}\n\n"
         else
            PP.semi $+$ 
            PP.text "//" <+> PP.text (show words) $+$
            PP.text "//" <+> PP.text rettype <+> PP.text (show $ (classifyType typeMap) rettype) $+$
            PP.text "//" <+> PP.text (show argumentTypes) <+> PP.text (show $ map (classifyType typeMap) argumentTypes) $+$
            PP.text "\n" -- couldn't convert type
   where
      tooltrap = True -- trapnum >= 0xA800
      linkage | null words = PP.text "extern"
              | otherwise = PP.text "static inline"
      argumentNames = map (trim . reverse . takeWhile isAlphaNum . reverse . trim) arguments
      argumentTypes = map (trim . reverse . dropWhile isAlphaNum . reverse . trim) arguments

      mbCategories = do
         retcat <- classifyType typeMap rettype
         argcats <- mapM (classifyType typeMap) argumentTypes
         return (retcat, argcats)

      Just (returnCategory, argumentCategories) = mbCategories

      returnsValue = returnCategory /= VoidType
      addReturnValue body 
         | returnsValue = (PP.text rettype <+> PP.text "_ret;") $+$
                    body $+$
                    PP.text "return _ret;"
         | otherwise = body
      outs | returnsValue = [PP.text "\"=g\"(_ret)"]
           | otherwise = []
      ins = zipWith inputConstraint argumentCategories argumentNames 
   
      inputConstraint PointerType name = PP.text "\"m\"(*(char*)" <> PP.text name <> PP.text ")"
      inputConstraint VoidType name = error $ "Void Parameter: " ++ name
      inputConstraint _ name = PP.text "\"g\"(" <> PP.text name <> PP.text ")"


      showConstraints constraints = PP.text ":" <+> PP.hsep (PP.punctuate PP.comma $ constraints)
      asmStatements = 
         (if tooltrap then [-- PP.text "\"move.l %%a5, %%a4\\n\"",
                            PP.text "\"move.l 0x904.w, %%a5\\n\""] else []) ++
         subq ++
         pushes ++
         map (\trapnum -> PP.text "\"dc.w" <+> PP.text "0x" <> PP.text (showHex trapnum "") <> PP.text "\\n\\t\"") words
         ++ pop
--         ++ (if tooltrap then [PP.text "\"move.l %%a4, %%a5\\n\""] else [])

      (subq, pop) = case returnCategory of
            VoidType -> ([], [])
            _ -> (ifpascal [PP.text "\"subq #" <> PP.int size <> PP.text ", %%sp\\n\\t\""],
                  [PP.text "\"move" <> szLetter <+> src <+> PP.text ", %0\\n\\t\""])
         where
            size = case returnCategory of
               PointerType -> 4 ; LongType -> 4 ; WordType -> 2 ; ByteType -> 2 {- keep stack aligned -}
               
            szLetter = PP.text $ case returnCategory of
               PointerType -> ".l" ; LongType -> ".l" ; WordType -> ".w" ; ByteType -> ".b"
            src = case mbParamRegs of
                     Nothing -> PP.text "%%sp@+"
                     Just (ParameterRegs (Just r) _) -> PP.text r
                     Just (ParameterRegs Nothing _) -> error $ "no reg for return value: " ++ name

            ifpascal x = case mbParamRegs of Nothing -> x ; Just _ -> []

      pushes = case mbParamRegs of
                  Nothing -> zipWith (mkPush Nothing) argumentCategories
                  Just (ParameterRegs _ regs) -> zipWith3 mkPush (map Just regs) argumentCategories
         $
               map (\i -> PP.char '%' <> PP.int i) $
               (if returnsValue then [1..] else [0..])

      endtxt = PP.text "\\n\\t\""
      mkPush Nothing PointerType operand = PP.text "\"pea" <+> operand <> endtxt
      mkPush (Just reg) PointerType operand = PP.text "\"lea" <+> operand <> PP.comma <+> PP.text reg <> endtxt
      mkPush mbReg size operand =
         PP.text "\"move" <> PP.text sz <+> operand <> PP.comma <+> dst    <> endtxt
         where
            sz = case size of
               LongType -> ".l" ; WordType -> ".w" ; ByteType -> ".b"
            dst = case mbReg of
               Nothing -> PP.text "%%sp@-"
               Just reg -> PP.text reg

outputItem _ _ = ""

collectPragmas xs = evalState (mapM doit xs) Map.empty
   where
      doit x@(PragmaParameterItem name params) = modify (Map.insert name params) >> return x
      doit (FunctionItem rettype name arguments inlines _) = do
         m <- get
         return $ FunctionItem rettype name arguments inlines (Map.lookup name m)
      doit x = return x

parseTypeMap tm = Map.fromList $ map handleLine $ lines tm
   where
      handleLine tml = case words tml of
         (x : xs) -> (trim $ unwords xs, case x of
                        "B" -> ByteType ; "W" -> WordType ; "L" -> LongType ; "P" -> PointerType)
processFile inputDir outputDir file
   | ".h" `isSuffixOf` file = do
      print $ (outputDir </> takeFileName file)
      -- readFile (inputDir </> file)
      f <- openFile (inputDir </> file) ReadMode
      hSetEncoding f latin1
      txt <- hGetContents f
      let parseResult = parse (many item) file txt
      typeMap <- fmap parseTypeMap $ readFile "../Retro68/types.txt"
      case parseResult of
         Right items -> do
            outf <- openFile (outputDir </> file) WriteMode
            hSetEncoding outf latin1
            when (file == "ConditionalMacros.h") $ do
                hPutStrLn outf $ unlines [
                        "#define TARGET_CPU_68K 1",
                        "#define TYPE_LONGLONG 1",
                        "#define pascal"
                    ]
            hPutStr outf $ concatMap (outputItem typeMap) $ collectPragmas $ items
            hClose outf
         Left err -> putStrLn $ file ++ ": " ++ show err
   | otherwise = do
      putStrLn $ "Unknown: " ++ file

main = do
   [inputDir,outputDir] <- getArgs
   files <- getDirectoryContents inputDir
   System.IO.Error.try (createDirectory outputDir)
   mapM (processFile inputDir outputDir) files
   return ()
