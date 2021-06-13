REM ---------------------------------------------------------------------------
REM This file contains an example of how to mount a VeraCrypt volume from
REM the command line.
REM
REM At the bottom of the script is the entire command in a single line
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
REM We start with the command to VeraCrypt. This assumes you have installed
REM to the default folder.
REM ---------------------------------------------------------------------------
REM
REM "C:\Program Files\VeraCrypt\VeraCrypt.exe"

REM ---------------------------------------------------------------------------
REM Next we provide the volume parameter, with the path to and the file name
REM of the file to mount.
REM ---------------------------------------------------------------------------
REM
REM /volume "C:\temp\vctest.vc"

REM ---------------------------------------------------------------------------
REM Volumes in VeraCrypt appear as a drive letter to Windows. As such we
REM need to provide a letter to use. Note if you use a drive letter
REM already in use, you'll get an error.
REM
REM The letter can be provided in either or upper or lower case.
REM ---------------------------------------------------------------------------
REM
REM /letter h

REM ---------------------------------------------------------------------------
REM Next up is the password to use to encrypt the volume. In a "real world"
REM situation, you should probably pass it in or get it in an alternate
REM method.
REM
REM To this demo simple, I'm just going to embed the password using the
REM "super secure" password I've used throughout this series of blog posts.
REM
REM As with file names, if your password has spaces you'll need to encluse
REM it in double quotes.
REM ---------------------------------------------------------------------------
REM
REM /password MySuperSecurePassword1!

REM ---------------------------------------------------------------------------
REM Finally we provide the quit parameter. By default, if you omit it then the
REM VeraCrypt dialog will remain on the screen. Using quit will close the
REM VeraCrypt dialog, something usually desired if you are running a script.
REM ---------------------------------------------------------------------------
REM
REM /quit

"C:\Program Files\VeraCrypt\VeraCrypt.exe" /volume "C:\temp\vctest.vc" /letter h /password MySuperSecurePassword1! /quit
