#!/bin/bash

# default dir to install = home
INSTALLDIR="$HOME"
echo
echo "Default installation directory is $INSTALLDIR"
echo "a folder named qt_scripts will be created in that location."
echo
read -p "Is this ok for you? (y/n): "
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    read -p "Full path to create \"qt_scripts\" folder? (dont use ~): "
        INSTALLDIR=$REPLY
    echo
fi

# Abort if INSTALLDIR does not exist or has no write permissions
if [ ! -w "$INSTALLDIR" ]; then
    echo "ABORTING: $INSTALLDIR does not exist / no write permissions"
    exit
fi

# Abort if INSTALLDIR/qt_scripts already exists
if [ -d "$INSTALLDIR/qt_scripts" ]; then
    echo "ABORTING: $INSTALLDIR/qt_scripts already exists"
    exit
fi

# INSTALL 
echo "Intalling now on $INSTALLDIR/qt_scripts"
echo
cd $INSTALLDIR
# check cd was successful
if [ ! `pwd` == "$INSTALLDIR" ]; then
    echo "ABORTING: could not cd to $INSTALLDIR"
    exit
fi

mkdir qt_scripts 
git clone https://github.com/jose-mr/qt_scripts.git
echo "export PATH=\$PATH:$INSTALLDIR/qt_scripts/others/" >> .bashrc
echo "export PYTHONPATH=\$PYTHONPATH:$INSTALLDIR/qt_scripts/modules"  >> .bashrc
cd qt_scripts
git checkout bytemarks

echo
echo "Installation complete."
echo "Run \"source ~/.bashrc\" to update \$PATH and \$PYTHONPATH"
echo
