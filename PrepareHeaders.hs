--  Copyright 2012 Wolfgang Thaller.
--
--  This file is part of Retro68.
--
--  Retro68 is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  Retro68 is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with Retro68.  If not, see <http://www.gnu.org/licenses/>.

module Main where

import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Language
import Text.ParserCombinators.Parsec.Token
import System.Directory
import System.FilePath
import Control.Monad(guard)
import Data.List(isSuffixOf)
import qualified Control.Exception
import System.IO
import qualified Text.PrettyPrint.HughesPJ as PP
import Text.PrettyPrint.HughesPJ((<+>),(<>),($$),($+$))
import Data.Char
import Numeric
import Data.Maybe(isJust)
import Control.Monad.State
import qualified Data.Map as Map
import System.Environment(getArgs)

data CallingConvention = Pascal | CCall
                       deriving(Show, Eq)

data Item = CharItem Char
          | IgnoredItem
          | FunctionItem CallingConvention String String [String] [String] [Integer] (Maybe ParameterRegs)
          | PragmaParameterItem String ParameterRegs
          deriving(Show)

type Register = String
data ParameterRegs = ParameterRegs (Maybe Register) [Register]
    deriving(Show)

tp = makeTokenParser javaStyle

item  =   (char '\r' >> return (CharItem '\n'))
      <|> try externApiDeclaration
     -- <|> try (string "= 0x4E90" >> return IgnoredItem)
     -- <|> try (string "= 0x4E91" >> return IgnoredItem)
      <|> try pragmaParameter
      <|> fmap CharItem anyChar

balancedText stopAtComma = fmap (foldr ($) "") $
        many (fmap (++) paranthesized <|> fmap (:) (noneOf (if stopAtComma then "()," else "()")))
    where paranthesized = char '(' >> balancedText False >>= \xs -> char ')' >> return ('(' : xs ++ ")")

isIDChar '_' = True
isIDChar c = isAlphaNum c

trim = dropWhile isSpace . reverse . dropWhile isSpace . reverse
cleanup = unwords . words . trim

returnType = do
    t <- identifier tp
    ptrs <- many (reservedOp tp "*" >> return '*')
    return $ t ++ ptrs

externApiDeclaration = do  
    (cconv, rettype) <- 
            (reserved tp "EXTERN_API" >> (fmap ((,) Pascal) $ fmap trim $ parens tp (balancedText False)))
            <|> (reserved tp "EXTERN_API_C" >> (fmap ((,) CCall) $ fmap trim $ parens tp (balancedText False)))
            <|> (reserved tp "pascal" >> fmap ((,) Pascal) returnType)
    name <- identifier tp
    arguments <- fmap (map cleanup) $ parens tp (commaSep tp $ balancedText True)
    
    let hexwords = commaSep tp hexword
        macroinline = do
            inlinekey <- identifier tp
            guard ("WORDINLINE" `isSuffixOf` inlinekey)
            parens tp hexwords
        plaininline = do
            reservedOp tp "="
            braces tp hexwords
          
    inlines <- macroinline <|> plaininline <|> return []
    
    semi tp
    let arguments' | arguments == ["void"] = []
                   | otherwise = arguments
        argumentNames = map (trim . reverse . takeWhile isIDChar . reverse . trim) arguments'
        argumentTypes = map (trim . reverse . dropWhile isIDChar . reverse . trim) arguments'
    return $ FunctionItem cconv rettype name argumentTypes argumentNames inlines Nothing

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
   

pprParameterRegs (ParameterRegs mbRet args)
    = maybe PP.empty PP.text mbRet
    <+> PP.parens (
            PP.hsep $ PP.punctuate PP.comma $ map PP.text args
        )

hexword = integer tp
outputItem (CharItem c) = [c]
-- outputItem (FunctionItem cconv rettype name argumentTypes argumentNames words) = "<fun>"

outputItem (FunctionItem cconv rettype name argumentTypes argumentNames words mbParamRegs)
    = let
        magic = PP.text "__magic_inline_" <> PP.hcat (PP.punctuate (PP.char '_') (map (PP.text . hexword) words))
        hexword w = replicate (4 - length s) '0' ++ s where s = showHex w ""
        cconvAttr = case (mbParamRegs,cconv) of
            (Just regs, _) -> PP.text "__attribute__((__regparam__(" <> PP.doubleQuotes regstr <> PP.text ")))"
                where regstr = pprParameterRegs regs
            (Nothing, Pascal) | not (null words) -> PP.text "__attribute__((__pascal__))" 
            (Nothing, _) -> PP.empty

        isInline = not (null words)

        magicAttr | isInline = PP.text "__attribute__((__magicinline__))" 
                  | otherwise = PP.empty
        inlineMagic | isInline =  PP.text("__asm__") <> PP.parens ( PP.doubleQuotes magic )
                    | otherwise = PP.empty
    in PP.render $
       PP.text rettype <+> cconvAttr <+> magicAttr <+> PP.text name
            <> PP.parens (PP.hsep $ PP.punctuate PP.comma $ zipWith (\t n -> PP.text t <+> PP.text n) argumentTypes argumentNames)
            <+> inlineMagic
            <> PP.semi <> PP.text "\n"

outputItem _ = ""

collectPragmas xs = evalState (mapM doit xs) Map.empty
    where
        doit x@(PragmaParameterItem name params) = modify (Map.insert name params) >> return x
        doit (FunctionItem cconv rettype name argumentTypes argumentNames inlines _) = do
            m <- get
            return $ FunctionItem cconv rettype name argumentTypes argumentNames inlines (Map.lookup name m)
        doit x = return x

processFile inputDir outputDir file
    | isLower (head file) = putStrLn $ "Skipping " ++ file ++ " (standard library or MPW runtime)"
    | ".h" `isSuffixOf` file = do
        print $ (outputDir </> takeFileName file)
        -- readFile (inputDir </> file)
        f <- openFile (inputDir </> file) ReadMode
        hSetEncoding f latin1
        txt <- hGetContents f
        let parseResult = parse (many item) file txt
        case parseResult of
            Right items -> do
                outf <- openFile (outputDir </> file) WriteMode
                hSetEncoding outf latin1

                let processed = concatMap outputItem $ collectPragmas $ items
                if (file == "ConditionalMacros.h")
                    then do
                        hPutStrLn outf $ unlines [
                                "#define TARGET_CPU_68K 1",
                                "#define TARGET_OS_MAC 1",
                                "#define TARGET_RT_MAC_CFM 0",
                                "#define TARGET_RT_MAC_MACHO 0",

                                "#define TYPE_LONGLONG 1",
                                "#define pascal",
                                "#ifdef __cplusplus",
                                "#define TYPE_BOOL 1",
                                "#endif"
                            ]
                        
                        hPutStr outf $ unlines $
                            map (\line -> if line == "#elif defined(__GNUC__)"
                                    then "#elif 0"
                                    else line) $
                            lines $ processed
                    else
                        hPutStr outf $ processed
                hClose outf
            Left err -> putStrLn $ file ++ ": " ++ show err
    | otherwise = do
        putStrLn $ "Unknown: " ++ file

main = do
    [inputDir,outputDir] <- getArgs
    files <- getDirectoryContents inputDir
    Control.Exception.try (createDirectory outputDir) :: IO (Either Control.Exception.IOException ())
    mapM (processFile inputDir outputDir) files
    return ()
