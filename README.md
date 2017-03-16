# Script to install setlX on UNIX-like OS #
Bash script to install the setlX interpreter on UNIX like Operating systems.

This script is based on the official instruction on how to install setlX, which can be found here:
[SetlX Official Website](randoom.org/Software/SetlX)

#### Since the script is still under development, there are not many features. ####
Right now, it does only a regular installation. Errors might occur, feel free to report them.

At the moment, the script is working for Linux and Mac. You need to have <code>wget</code> in order to install it.

### Installing setlX ###

You need to be root to execute the script, since you are copying files to <code>/usr/local/</code> and changing the access permissions in order to make it executable. You also need to restart your computer to be able to use the <code>setlX</code> command.

Packages required: <code>wget</code>, <code>java</code>

1. Clone the repository
2. Go to the folder, where the script is located
3. Open a terminal
4. Execute the script by <code>sudo setlXinstaller.sh</code>
5. Now you can start setlX by entering <code>setlX</code> into the command line (you may have to restart your computer)

#### Changing version and paths ####

You are able to edit the script to change the setlX-version and the paths.
By default, the values are:
<pre><code>setlx_version=2-6-0
TmpDir="$HOME/tmp/setlX"
JarDir="/usr/local/setlX/"
LibDir="$HOME/setlXlibrary"
BinDir="/usr/local/bin"</code></pre>

The <code>TmpDir</code> variable is used to check for a temporary folder.
The setlX-binary will be downloaded and unzipped to <code>$HOME/tmp/setlX</code> by default.
This folder will not be deleted after the installation has been finished!

If you want to change the path for the jar-files or the library-files, just change the paths for the <code>JarDir</code> and <code>LibDir</code> variables. Right now, you also have to change the paths in the following two lines by hand:

<pre><code>sed -i 's/setlXJarDirectory\=\"\.\"/setlXJarDirectory\=\"\/usr\/local\/setlX\/\"/' ${TmpDir}/setlX
sed -i 's/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/' ${TmpDir}/setlX</code></pre>
