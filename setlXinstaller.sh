#!/bin/bash
#
# This is a script for installing setlX for UNIX-like OS
# The script is based on the official instruction on how to install setlX
# This script has to be istalled with root rights!
#

# Set paths and version for the download
setlx_version=2-5-1
TmpDir="$HOME/tmp/setlX"
JarDir="/usr/local/setlX/"
LibDir="$HOME/setlXlibrary"


#CHECK IF JAVA IS INSTALLED
if ! ( which java >/dev/null 2>&1 ) ; then
  echo "Java is not installed, please install Java first!"
  exit 1
fi

#CHECK for a temporary folder
if ! ( [ -d "$HOME/tmp" ] ) ; then
  echo "Creating temporary folder\n\n"
  mkdir $HOME/tmp/
  if ! ( [ -d ${TmpDir} ] ) ; then
    mkdir ${TmpDir}
  fi
fi

echo "Downloading setlX binary to $HOME/tmp/setlX\n\n"

#Download setlX binary
wget -O ${TmpDir}/setlX_v${setlx_version}.binary_only.zip "http://download.randoom.org/setlX/pc/setlX_v${setlx_version}.binary_only.zip" 

unzip ${TmpDir}/setlX_v${setlx_version}.binary_only.zip -d ${TmpDir}/

#CHECK for a setlX folder
if ! ( [ -d ${JarDir} ] ) ; then
  echo "Creating setlX folder in /usr/local/setlX\n\n"
  mkdir ${JarDir}
fi

# find all files that match 'setlX*.jar' and copy them to ${JarDir} (default: /usr/local/setlX/)
echo "Copying setlX*.jar files\n\n"
sudo find ${TmpDir}/ -type f -name 'setlX*.jar' -exec cp '{}' ${JarDir} ';'

#CHECK for a setlXlibrary folder
if ! ( [ -d ${LibDir} ] ) ; then
  echo "Creating setlX-library folder\n\n"
  mkdir ${LibDir}
fi

find ${TmpDir}/setlXlibrary -type f -name '*.*' -exec cp '{}' ${LibDir} ';'

#Entering the path of the jar- and library-files
sed -i 's/setlXJarDirectory\=\"\.\"/setlXJarDirectory\=\"\/usr\/local\/setlX\/\"/' ${TmpDir}/setlX
sed -i 's/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/' ${TmpDir}/setlX

sudo cp ${TmpDir}/setlX ${JarDir}

sudo chmod +x ${JarDir}/setlX

exit 1
