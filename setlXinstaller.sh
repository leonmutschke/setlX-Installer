#!/bin/bash

# Set paths and version for the download
setlx_version=2-5-1
folder_tmp="$HOME/tmp/setlX"
folder_usr="/usr/local/setlX/"
folder_library="$HOME/setlXlibrary"


#CHECK IF JAVA IS INSTALLED
if ! ( which java >/dev/null 2>&1 ) ; then
  echo "Java is not installed, please install Java first!"
  exit 1
fi

#CHECK for a temporary folder
if ! ( [ -d "$HOME/tmp" ] ) ; then
  echo "Creating temporary folder\n\n"
  mkdir $HOME/tmp/
  if ! ( [ -d ${folder_tmp} ] ) ; then
    mkdir ${folder_tmp}
  fi
fi

echo "Downloading setlX binary to $HOME/tmp/setlX\n\n"

wget -O ${folder_tmp}/setlX_v${setlx_version}.binary_only.zip "http://download.randoom.org/setlX/pc/setlX_v${setlx_version}.binary_only.zip" 

unzip ${folder_tmp}/setlX_v${setlx_version}.binary_only.zip -d ${folder_tmp}/

#CHECK for a setlX folder
if ! ( [ -d ${folder_usr} ] ) ; then
  echo "Creating setlX folder in /usr/local/setlX\n\n"
  mkdir ${folder_usr}
fi

# find all files that match 'setlX*.jar' and copy them to ${folder_usr} (default: /usr/local/setlX/)
sudo find ${folder_tmp}/ -type f -name 'setlX*.jar' -exec cp '{}' ${folder_usr} ';'

#CHECK for a setlXlibrary folder
if ! ( [ -d ${folder_library} ] ) ; then
  echo "Creating setlX-library folder\n\n"
  mkdir ${folder_library}
fi

find ${folder_tmp}/setlXlibrary -type f -name '*.*' -exec cp '{}' ${folder_library} ';'

sed -i 's/setlXJarDirectory\=\"\.\"/setlXJarDirectory\=\"\/usr\/local\/setlX\/\"/' ${folder_tmp}/setlX
sed -i 's/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/' ${folder_tmp}/setlX


#sed 's/[setlXJarDirectory\=\"\.\"]/[setlXJarDirectory\=\"\/usr\/local\/setlX\"]/' ${folder_tmp}/setlX

sudo cp ${folder_tmp}/setlX ${folder_usr}

sudo chmod +x ${folder_usr}/setlX

exit 1
