IN=$1
OUT=$2

# Make Mac OS X's tr and sed not complain that the files are not UTF-8
export LANG=en

# cp $IN/[A-Z]*.r $OUT/
for file in $(cd $IN; ls [A-Z]*.r); do
	tr '\r' '\n' < $IN/$file > $OUT/$file
done

