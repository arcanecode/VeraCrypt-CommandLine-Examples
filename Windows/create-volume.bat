REM ---------------------------------------------------------------------------
REM This provides an example of how to create a VeraCrypt volume in Windows
REM
REM At the bottom of this file is the full command as a single line. To make
REM it more understandable, we'll first break the line into it's individual
REM components
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
REM First up is the command to call. If you installed VeraCrypt to the
REM default folder, you'll find it in C:\Program Files\VeraCrypt\
REM
REM The command to create a new volume is actually a seperate executable
REM than the rest of VeraCrypt. It is VeraCrypt Format.exe
REM Note there is indeed a space in the file name! Thus you have to enclose
REM the enter thing in double quotes.
REM ---------------------------------------------------------------------------
REM
REM "C:\Program Files\VeraCrypt\VeraCrypt Format.exe"

REM ---------------------------------------------------------------------------
REM Next is the command to create a volume, /create. You follow it with
REM the path and file name to create. If you omit the path it will create
REM the volume in the current directory you are running the script from.
REM
REM As with all file names, if it has a space you must include double
REM quotes. Otherwise they are optional, but it doesn't hurt to have them.
REM ---------------------------------------------------------------------------
REM
REM /create "C:\temp\vctest.vc"

REM ---------------------------------------------------------------------------
REM We now noeed to tell VeraCrypt how big to make the volume. VeraCrypt
REM includes shortcuts for M (Megabytes), G (Gigabytes), T (Terabytes) and
REM K (Kilobytes). If you omit a letter, it assumes bytes.
REM
REM For this demo we are making it small, so will use 200M to indicate
REM 200 Megabytes.
REM ---------------------------------------------------------------------------
REM
REM /size "200M"

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
REM Now we need to provide the encryption algorithm to use. VeraCrypt
REM supports a vast array of algorithms, see their documentation for
REM the supported list.
REM
REM For this demo, we'll use the popular AES
REM ---------------------------------------------------------------------------
REM
REM /encryption AES

REM ---------------------------------------------------------------------------
REM Many algorithms require you to provide an encryption stream. For AES,
REM we'll use the strong SHA-512.
REM ---------------------------------------------------------------------------
REM
REM /hash sha-512

REM ---------------------------------------------------------------------------
REM In order to keep this container portable across OS's
REM we'll format using exfat. Be aware though that to use exfat on a Mac,
REM you'll have to install macFUSE (see the comments in the scripts for macOS)
REM ---------------------------------------------------------------------------
REM
REM /filesystem exfat

REM ---------------------------------------------------------------------------
REM The PIM is a special number that allows you to specify the number of
REM times hashing algorhythm executes. It's a bit more complex than that,
REM if you want full details see the VeraCrypt documentation at:
REM https://documentation.help/VeraCrypt/Personal%20Iterations%20Multiplier%20(PIM).html
REM
REM For now, we can pass it the value of 0, which tells it to use the default value
REM ---------------------------------------------------------------------------
REM
REM /pim 0

REM Here is the entire command as a single line.

"C:\Program Files\VeraCrypt\VeraCrypt Format.exe" /create "C:\temp\vctest.vc" /size "200M" /password MySuperSecurePassword1! /encryption AES /hash sha-512 /filesystem exfat /pim 0
