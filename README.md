# setlX-unix-installer-script
Bash script to install the setlX interpreter on UNIX like OS

This script is based on the official instruction on how to install setlX, which can be found here:
[SetlX Official Website](randoom.org/Software/SetlX)

Since the script is still under development, there are not many features.
Also, it has only be tested on Linux Machines! Feel free to test it on macOS.

### Installing setlX ###

You need to be root to execute the script, since you are copying files to <code>/usr/local/</code> and changing the access permissions in order to make it executable. You also need to restart your computer to be able to use the <code>setlX</code> command.

#### Changing version and paths ####

You are able to edit the script to change the setlX-version and the paths.
By default, the values are:
<pre><code>setlx_version=2-5-1
TmpDir="$HOME/tmp/setlX"
JarDir="/usr/local/setlX/"
LibDir="$HOME/setlXlibrary"</code></pre>

The <code>TmpDir</code> variable is used to check for a temporary folder.
The setlX-binary will be downloaded and unzipped to <code>$HOME/tmp/setlX</code> by default.
This folder will not be deleted after the installation has been finished!

If you want to change the path for the jar-files or the library-files, just change the paths for the <code>JarDir</code> and <code>LibDir</code> variables. Right now, you also have to change the paths in the following two lines by hand:

<pre><code>sed -i 's/setlXJarDirectory\=\"\.\"/setlXJarDirectory\=\"\/usr\/local\/setlX\/\"/' ${TmpDir}/setlX
sed -i 's/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/setlXlibraryPath\=\"\$HOME\/setlXlibrary\/\"/' ${TmpDir}/setlX</code></pre>
