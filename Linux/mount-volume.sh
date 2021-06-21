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
# The sections below describe how VeraCrypt on the command line works. For a complete
# explanation see the post.md file in this project.
#
# Before you can run the script though, there are a few things you need to know.
#
# I have a folder under Documents called code. In it I cloned this project, which
# created the folder VeraCrypt-CommandLine-Examples. These scripts are stored in the
# Linux folder. You should alter the commands below to fit your directory setup.
#
# Before you can execute this script you will need to mark it as executable.
# sudo chmod +x ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/mount-volume.sh
#
# Next you should be in the Documents folder.
# cd ~/Documents
#
# Finally you can execute the script
# sudo ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/mount-volume.sh
#
# Be sure to read through this entire script completely before trying to run the
# script, as there are some dependancies you will need to install. Better yet,
# read them in the post.md file for an easy to read explanation. The comments here
# are just a refresher, the post.md has full explanations.
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
# This is the command to launch VeraCrypt from the command line
#----------------------------------------------------------------------------------------
# sudo veracrypt

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
# Second we need to provide a mount point. This will let Linux treat it like any other
# drive you might plug in. In this example we will use `/mnt`.
#
# --mount vctest.vc /mnt
#
# Using `/mnt` works fine if you only have one volume to mount. If not, you'll have to
# create new mount points. This is pretty easy.
#
# sudo mkdir /media/vc2
#
# Placing these in the `/media` area is a common practice. From there you can name it
# anything you want. You could use vc followed by the slot number, or use the name of
# the file.
#
# Then in your script, you can use:
#
# --mount vctest.vc /media/vc2
#
# Note that once you create the directory under /media it is persistent, you don't
# have to create it again. This does mean your /media will accumulate these mount
# points over time. Once you are sure you'll no longer need them consider using
# rmdir to remove them.
#
# You could of course use /media for all your volumes, and avoid using /mnt
# completely. Just be aware you'll have to create a name under /media first.
#----------------------------------------------------------------------------------------
# --mount vctest.vc /mnt

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
sudo veracrypt --text --mount vctest.vc /mnt --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no --slot 1 --verbose

# Here is a second version without the optional parameters
# sudo veracrypt --text --mount vctest.vc /mnt --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no
