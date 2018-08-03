#!/bin/bash

#set base dir where you want the software installed

BASE_DIR=/projects/$USER

#now remove any previous instances of .udocker from these directories
#(don't do this unless you want to get rid of everything previously installed for udocker)

rm -Rf $BASE_DIR/.udocker
rm -Rf $HOME/.udocker

echo "done"
#Now download and install udocker
curl https://raw.githubusercontent.com/indigo-dc/udocker/master/udocker.py > udocker
chmod u+rx ./udocker
./udocker install

#move the .udocker directory from $HOME to $BASE_DIR

mv $HOME/.udocker $BASE_DIR/

#move the udocker executable from $PWD to the $UDOCKER_DIR/bin and add to PATH

#mv $PWD/udocker $BASE_DIR/.udocker/bin/

#Now create a symbolic link in your home directory to the ./udocker directory
cd $HOME
ln -sf $BASE_DIR/.udocker .

