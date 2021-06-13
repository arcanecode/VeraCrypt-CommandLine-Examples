REM ---------------------------------------------------------------------------
REM This file contains an example of how to dismount a VeraCrypt volume from
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
REM Next is the dismount parameter. You pass in the drive letter associated
REM with the volume to dismount.
REM
REM If you omit the drive letter, VeraCrypt will dismount ALL currently
REM mounted volumes.
REM ---------------------------------------------------------------------------
REM
REM /dismount H

REM ---------------------------------------------------------------------------
REM We now provide the quit parameter. By default, if you omit it then the
REM VeraCrypt dialog will remain on the screen. Using quit will close the
REM VeraCrypt dialog, something usually desired if you are running a script.
REM ---------------------------------------------------------------------------
REM
REM /quit

REM ---------------------------------------------------------------------------
REM Finally we provide the force parameter. If some app is accessing the
REM volume, for example Windows File Explorer, it will prevent VeraCrypt from
REM dismounting.
REM
REM The force parameter tells VeraCrypt to shut down, no matter what.
REM Your inclusion of force is up to you, depending on your situation.
REM
REM For the demo, we'll include it.
REM ---------------------------------------------------------------------------
REM
REM /force

REM ---------------------------------------------------------------------------
REM Here is the full command as a single line, unmounting a specific drive
REM letter and forcing the dismount no matter what.
REM ---------------------------------------------------------------------------

"C:\Program Files\VeraCrypt\VeraCrypt.exe" /dismount H /quit /force
