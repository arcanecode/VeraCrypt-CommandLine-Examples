#----------------------------------------------------------------------------------------
# Copyright Notice
#
# This document is Copyright (c) 2021 Robert C. Cain. All rights reserved.
#
# The code samples herein is for demonstration purposes. No warranty or guarantee 
# is implied or expressly granted.
#
# This sample may not be reproduced in whole or in part without the express written
# consent of the author. Information within can be used within your own projects.
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# NOTE: Before this will work, you must install macFUSE from https://osxfuse.github.io.
# It provides additional code to let you mount other file systems, such as the exFAT we
# are using in this demo.
#
# At the bottom of this file is the command as one long line, but let's first break 
# it into its individual parameters and explain each one.
#
# For all of these examples, I have created a "temp" folder inside my Documents folder.
#
# When you copy these commands, you will need to change the user name from "arcanecode"
# to your own user name. 
# 
# Additionally you'll need to create the same temp folder, or update the paths to
# where you wish to store your containers.
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# This is the command to launch VeraCrypt from the macOS command line
#----------------------------------------------------------------------------------------
# /Applications/VeraCrypt.app/contents/MacOS/VeraCrypt 

#----------------------------------------------------------------------------------------
# The --text parameter says we want to use VeraCrypt in text mode, not GUI
# Note, the --text parameter must be the FIRST parameter you pass in, or
# it will not work.
#----------------------------------------------------------------------------------------
# --text 

#----------------------------------------------------------------------------------------
# We next tell VeraCrypt we want to create a new file container, and where it is
# to be stored at.
#----------------------------------------------------------------------------------------
# --create "/Users/arcanecode/Documents/temp/vctest.vc" 

#----------------------------------------------------------------------------------------
# Next we indicate how big. If you just list a number, VeraCrypt assumes you mean
# bytes, but you can also affix M for megabytes, G gigabytes, K kilobytes, and so on.
# Here I'm going to keep it small for demo purposes and use 200 megabytes.
#----------------------------------------------------------------------------------------
# --size "200M" 

#----------------------------------------------------------------------------------------
# Now we provide our password. Normally you would not want to hard code it, but
# rather pass it into your script as a parameter. I wanted to keep this demo simple
# though, and focus on VeraCrypt so I've just hard coded it.
#----------------------------------------------------------------------------------------
# --password MySuperSecurePassword1! 

#----------------------------------------------------------------------------------------
# Next is the volume type, normal or hidden. I have a blog post on my blog 
# that talks about hidden types, and if you are going to do a hidden I
# would suggest using the GUI in order to assure it is done right.
# For this demo we'll go with a normal volume.
#----------------------------------------------------------------------------------------
# --volume-type normal 

#----------------------------------------------------------------------------------------
# Now we pick the encryption type. There are quite a few, so refer to the
# VeraCrypt documentation for a full list. Here we're using AES
#----------------------------------------------------------------------------------------
# --encryption AES 

#----------------------------------------------------------------------------------------
# Next up, for the encryption method we picked it needs to know the hashing
# algo. For AES I suggest sha-512
#----------------------------------------------------------------------------------------
# --hash sha-512 

#----------------------------------------------------------------------------------------
# In order to keep this container portable across OS's (Windows and Linux)
# we'll format using exfat. Be aware though that to use exfat on a Mac,
# you'll have to install macFUSE (see the comment at the top)
#----------------------------------------------------------------------------------------
# --filesystem exfat 

#----------------------------------------------------------------------------------------
# The PIM is a special number that allows you to specify the number of 
# times hashing algorhythm executes. It's a bit more complex than that,
# if you want full details see the VeraCrypt documentation at: 
# https://documentation.help/VeraCrypt/Personal%20Iterations%20Multiplier%20(PIM).html
# For now, we can pass it the value of 0, which tells it to use the default value
#----------------------------------------------------------------------------------------
# --pim 0 

#----------------------------------------------------------------------------------------
# You can mount a volume in VeraCrypt using a keyfile, as opposed to a password.
# We've not done that here, so we'll just pass in an empty string to indicate
# we won't use a keyfile.
#----------------------------------------------------------------------------------------
# --keyfiles "" 

#----------------------------------------------------------------------------------------
# As a final parameter, you need to provide random data for VeraCrypt to 
# use when generating its hashes. It needs at least 320 characters, but
# you can give more. 
# I've provided a sample one as part of this demo, I just randomly smacked
# keys on my keyboard with my eyes closed. I'd suggest creating one of
# your own for production, but for just testing and learning (I'm assuming
# you'll throw away the vault when you are done) then the one here will be OK.
#----------------------------------------------------------------------------------------
# --random-source /Users/arcanecode/Documents/temp/randomdata.txt

# The line you can run in Terminal, iTerm2 or another terminal of your choice.
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --create "/Users/arcanecode/Documents/temp/vctest.vc" --size "200M" --password MySuperSecurePassword1! --volume-type normal --encryption AES --hash sha-512 --filesystem exfat --pim 0 --keyfiles "" --random-source /Users/arcanecode/Documents/temp/randomdata.txt