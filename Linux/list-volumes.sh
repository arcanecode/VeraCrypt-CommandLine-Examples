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
# sudo chmod +x ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/list-volumes.sh
#
# Next you should be in the Documents folder.
# cd ~/Documents
#
# Finally you can execute the script
# sudo ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/list-volumes.sh
#
# Be sure to read through this entire script completely before trying to run the
# script, as there are some dependancies you will need to install. Better yet,
# read them in the post.md file for an easy to read explanation. The comments here
# are just a refresher, the post.md has full explanations.
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Getting a list of mounted volumes from the command line
#
# As with other commands you have seen, we start with the full path to the VeraCrypt
# application. We then use --text to let VeraCrypt know not to use the GUI.
#
# We finish with --list, which tells VeraCrypt to display a list of all mounted 
# containers. This will include the slot number, volume anme, and mount directory.
#
# For all of these examples, I have created a "temp" folder inside my Documents folder.
#
# When you copy these commands, you will need to change the user name from "arcanecode"
# to your own user name.
#
# Additionally you'll need to create the same temp folder, or update the paths to
# where you wish to store your containers.
#----------------------------------------------------------------------------------------

sudo veracrypt --text --list
