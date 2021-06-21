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
# sudo chmod +x ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/dismount-volume.sh
#
# Next you should be in the Documents folder.
# cd ~/Documents
#
# Finally you can execute the script
# sudo ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/dismount-volume.sh
#
# Be sure to read through this entire script completely before trying to run the
# script, as there are some dependancies you will need to install. Better yet,
# read them in the post.md file for an easy to read explanation. The comments here
# are just a refresher, the post.md has full explanations.
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Dismounting
#
# There are four ways to dismount a volume. Three of them will dismount a specific
# volume, the final will dismount all volumes.
#
# All ways follow the same pattern. Give the path to the VeraCrypt app, followed
# by the --text parameter to tell VeraCrypt not to launch the GUI.
#
# Finally we give the --dismount to let VeraCrypt know we want to unload our volume.
# The value passed into the --dismount parameter varies, and will be explained below.
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
# Method 1: Slot Number
#
# With the first method, you provide the slot number. If you mounted a volume
# and used the slot number parameter, so for example your personal file vault is alwasy
# in slot 5, then this can be an easy way to dismount.
#
# On the other hand, if you let VeraCrypt load in the first available slot, you'll
# either have to look at the GUI, or run the command in the list-volumes.sh file
# found in this demo, to learn the slot number.
#----------------------------------------------------------------------------------------
# sudo veracrypt --text --dismount --slot 1

#----------------------------------------------------------------------------------------
# Method 2: Mount Directory
#
# Using the volume list command or looking at the "Mount Directory" column in the GUI,
# you can pass in that value to umount. Because this is typically "Untitled", "Untitled 1"
# and so on, it can be of an issue trying to be reliable in umounting the right volume.
#----------------------------------------------------------------------------------------
# sudo veracrypt --text --dismount /mnt

#----------------------------------------------------------------------------------------
# Method 3: Volume file name
#
# This next method is the most reliable. Since you know the name of the file you
# mounted, you can just provide the same file name to unmount. VeraCrypt doesn't
# care what slot it is loaded into, it uses the file name to find it.
#----------------------------------------------------------------------------------------
# sudo veracrypt --text --dismount vctest.vc

#----------------------------------------------------------------------------------------
# The winner! Method 3!
#
# For the reasons above, I highly suggest Method 3 be your go to method for
# unmounting volumes in your scripts. It is the most reliable, and easiest
# to understand when looking at the scripts.
#
# But wait, there's more!
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# There is one more way to dismount.
#
# If you use just the --dismount parameter, and pass in no values, then VeraCrypt
# will attempt to dismount ALL volumes you have loaded.
#
# This can be a useful command to run when you're shutting down your Mac,
# to ensure all volumes are properly shutdown.
#
# If you don't have any volumes mounted, then VeraCrypt basically shrugs
# it's shoulders, does nothing, and ends.
#----------------------------------------------------------------------------------------
sudo veracrypt --text --dismount

