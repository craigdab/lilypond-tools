#!/bin/sh

# Rename files

for f in *; do mv "$f" "$f.tmp"; mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done
rename 's/ //g' *;
rename 's/inbb//' *;
rename 's/inf//' *;
rename 's/1/I/' *;
rename 's/2/II/' *;
rename 's/3/III/' *;
rename 's/4/IV/' *;

# Convert xml to ly

for f in *.musicxml; do /Applications/lilypond-2.25.12/bin/musicxml2ly --nd --npl --no-beaming --language=english $f; done

# Change file extension from .ly to .ily

for file in *.ly; do mv "$file" "${file%.ly}.ily"; done

# Search and replace the content of the files

sed -i "" "s/\\\stemDown//g" *.ily; 
sed -i "" "s/\\\stemUp//g" *.ily; 
sed -i "" "s/\\\numericTimeSignature//g" *.ily; 
sed -i "" "s/\\\key [a-g] \\major//g" *.ily; 
sed -i "" "s/\\\key [a-g] \\minor//g" *.ily; 
sed -i "" "s/\\\key c \\\none//g" *.ily; 

sed -i "" "s/-\\\f/\\\f/g" *.ily; 
sed -i "" "s/-\\\p/\\\p/g" *.ily; 
sed -i "" "s/-\\\m/\\\m/g" *.ily; 

sed -i "" "s;\\\time 2\\/4;;g" *.ily; 
sed -i "" "s;\\\time 3\\/4;;g" *.ily; 
sed -i "" "s;\\\time 4\\/4;;g" *.ily; 
sed -i "" "s;\\\time 5\\/4;;g" *.ily; 
sed -i "" "s;\\\time 6\\/4;;g" *.ily; 
sed -i "" "s;\\\time 7\\/4;;g" *.ily; 
sed -i "" "s;\\\time 3\\/8;;g" *.ily; 
sed -i "" "s;\\\time 4\\/8;;g" *.ily; 
sed -i "" "s;\\\time 5\\/8;;g" *.ily; 
sed -i "" "s;\\\time 6\\/8;;g" *.ily; 
sed -i "" "s;\\\time 7\\/8;;g" *.ily; 
sed -i "" "s;\\\time 8\\/8;;g" *.ily; 
sed -i "" "s;\\\time 9\\/8;;g" *.ily; 
sed -i "" "s;\\\time 12\\/8;;g" *.ily; 
sed -i "" "s;\\\time 2\\/2;;g" *.ily; 
sed -i "" "s;\\\time 3\\/2;;g" *.ily; 
sed -i "" "s;\\\time 4\\/2;;g" *.ily; 

sed -i "" "s;\\\bar \"\\|.\";;g" *.ily; 
sed -i "" "s;\\\bar \"\\|\\|\";;g" *.ily; 

sed -i "" "s;\\-\\\\<;\\\\<;g" *.ily; 
sed -i "" "s;\\-\\\\>;\\\\>;g" *.ily; 
sed -i "" "s;\\-\\\\!;\\\\!;g" *.ily; 

sed -i "" "s;\\|;\\|\n\n;g" *.ily; 

sed -i "" "s;\\\once \\\omit TupletBracket;;g" *.ily; 

# delete closing lines
sed -i "" '/^% The score definition$/,$d' *.ily;

# delete opening lines
sed -i "" '/\\relative/,$!d' *.ily;

# delete characters before "\relative"
sed -i "" "s;^.*\\\relative;\\\relative;" *.ily;

# append lines to start of file
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\naltosaxophoneNotes \\= /g" altosaxophone.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbassdrumNotes \\= /g" bassdrum.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbaritonesaxophoneNotes \\= /g" baritonesaxophone.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbassclarinetNotes \\= /g" bassclarinet.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbassoonINotes \\= /g" bassoonI.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbassoonIINotes \\= /g" bassoonII.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nbasstromboneNotes \\= /g" basstrombone.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nclarinetINotes \\= /g" clarinetI.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nclarinetIINotes \\= /g" clarinetII.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nclarinetIIINotes \\= /g" clarinetIII.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\ncontrabassclarinetNotes \\= /g" contrabassclarinet.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\ncontrabassoonNotes \\= /g" contrabassoon.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nenglishhornNotes \\= /g" englishhorn.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\ncoranglaisNotes \\= /g" coranglais.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\neuphoniumNotes \\= /g" euphonium.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nfluteINotes \\= /g" fluteI.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nfluteIINotes \\= /g" fluteII.ily;
sed -i "" "1s/^/\\\version \"2.24.1\"\n\\\language \"english\"\n\nfluteIIINotes \\= /g" fluteIII.ily;

# Reformat

ly reformat -i *.ily

