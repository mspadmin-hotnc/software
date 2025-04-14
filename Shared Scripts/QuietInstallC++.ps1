# PowerShell script to download and install the latest version of Microsoft Visual C++ Redistributable
# Written by Charles Sanders 4-14-25

# Define Variables
$path = "c:\hotnc\"
$url = "https://aka.ms/vs/17/release/"
$filename1 = "vc_redist.x64.exe"
# This is for the 64-bit Intel/AMD version. If using 32-bit, change the filename to vc_redist.x86.exe. 
# If using the ARM version, change the filename to vc_redist.arm64.exe

# This section checks for the existence of c:\hotnc\ folder. If it does not exist, this command will create it.
# The file will be downloaded and run from this location.
# If installing from a network location, comment out this section and change the path variable to that network location.
If(!(Test-Path -PathType Container $path)) {
    New-Item -ItemType Directory -Path $path
}

# This section downloads the file and stores it in the path shown above.
# If installing from a network drive, you can comment out this section.
Invoke-WebRequest -Uri $url$filename1 -OutFile $path$filename1

# This section quietly installs the file.
& $path$filename1 /install /quiet /norestart
