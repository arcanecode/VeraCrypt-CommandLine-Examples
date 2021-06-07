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
# This example will show how to mount a VeraCrypt volume in macOS
#
# At the bottom is the full command in a single line. Here in the comments we'll break
# it into individual parameters.
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
#
# Note, the --text parameter must be the FIRST parameter you pass in, or
# it will not work.
#----------------------------------------------------------------------------------------
# --text 

#----------------------------------------------------------------------------------------
# The mount parameter actually has two values that need to be passed in.
#
# First we pass in the name of the file to mount.
#
# Second we need to provide a mount point. This will let macOS treat it like any
# other drive you might plug in. In macOS, use /Volumes then add on a name.
# 
# For simplicity I usually use the name of the file (without any extension), 
# but it doesn't have to be. 
#
# In reality though, it doesn't make a real difference as macOS overrides the name
# you provide, and instead uses "Untitled", "Untitled 2", and so on.
#----------------------------------------------------------------------------------------
# --mount "/Users/arcanecode/Documents/temp/vctest.vc" /Volumes/vctest 

#----------------------------------------------------------------------------------------
# Now we provide our password. Normally you would not want to hard code it, but
# rather pass it into your script as a parameter. I wanted to keep this demo simple
# though, and focus on VeraCrypt so I've just hard coded it.
#----------------------------------------------------------------------------------------
# --password MySuperSecurePassword1! 

#----------------------------------------------------------------------------------------
# If you overrode the default PIM when creating your volume, you'll need to provide it.
# Otherwise, we can pass it the value of 0, which tells it to use the default value
#----------------------------------------------------------------------------------------
# --pim 0 

#----------------------------------------------------------------------------------------
# If you created your volume using a keyfile or files, provide them here. Otherwise
# you can just pass in an empty string to indicate no keyfile is needed.
#----------------------------------------------------------------------------------------
# --keyfiles "" 

#----------------------------------------------------------------------------------------
# If this volume contained a hidden volume, you would need to let VeraCrypt know by
# using a value of yes, plus some other parameters.
#
# In this case there is not hidden partition in our volume, so we can just give a value
# of no.
#----------------------------------------------------------------------------------------
# --protect-hidden no 

#----------------------------------------------------------------------------------------
# OPTIONAL! 
# Slot is an optional parameter. If you look at the VeraCrypt GUI in macOS, down the
# left side are a series of slot numbers. If you omit this parameter, VeraCrypt will
# mount in the first empty slot.
#
# However you can specify a slot, which can be useful if you want to make sure
# certain volumes always mount in a specific slot. You can then use the slot number
# when you want to dismount your volumes.
#----------------------------------------------------------------------------------------
# --slot 1 

#----------------------------------------------------------------------------------------
# OPTIONAL! 
# This too is an optional parameter, but I often include it just to see what is going
# on under the covers. If you intend to make this into a script then I would suggest
# omitting it once your script is debugged and working.
#----------------------------------------------------------------------------------------
# --verbose 

# Here is the full command line, with the optional slot and verbose as examples
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --mount "/Users/arcanecode/Documents/temp/vctest.vc" /Volumes/vctest --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no --slot 1 --verbose

# Here is a second version without the optional parameters
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --mount "/Users/arcanecode/Documents/temp/vctest.vc" /Volumes/vctest --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no 
