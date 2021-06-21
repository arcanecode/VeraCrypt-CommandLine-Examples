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
# sudo chmod +x ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/create-volume.sh
#
# Next you should be in the Documents folder.
# cd ~/Documents
#
# Finally you can execute the script
# sudo ~/Documents/code/VeraCrypt-CommandLine-Examples/Linux/create-volume.sh
#
# Be sure to read through this entire script completely before trying to run the
# script, as there are some dependancies you will need to install. Better yet,
# read them in the post.md file for an easy to read explanation. The comments here
# are just a refresher, the post.md has full explanations.
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# Before you install VeraCrypt, you should be aware it has a dependency on the
# libwxgtk3.0-gtk3-0v5 library, so we might as well install that first. From the
# terminal execute these commands.
#
# sudo apt-get update -y
# sudo apt-get install -y libwxgtk3.0-gtk3-0v5
#
# Next, in order to format a volume as exFat so it can be used across platforms,
# you'll need to install the exFat tools.
#
# sudo apt-get install -y exfat-fuse exfat-utils
#
# Now you'll need to install VeraCrypt. I went to https://veracrypt.fr/en/Downloads.html
# and scrolled down to the Linux area. In the Ubuntu 20.04 area, I downloaded
# veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb file into my Downloads folder.
#
# In the terminal, I moved to my Downloads folder then issued this command to
# install it:
#
# sudo dpkg -i veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
#
# From here I went into Ubuntu's menu and launched VeraCrypt to validate it installed
# correctly.
#
# Before we begin I'd like to make two notes. First, I'll be storing the container
# in my Documents folder. So in the terminal be sure to cd into your Documents.
# This will make it easier as we won't have to specify full paths to our files.
#
# Second, included in this demo is a randomdata.txt file. We'll explain its use
# shortly, but you'll need to copy this file into Documents as well, or when the
# time comes include the full path to it.
#
# At the bottom of this file is the command as one long line, but let's first break
# it into its individual parameters and explain each one.
#
#----------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------
# This is the command to launch VeraCrypt from the command line
#----------------------------------------------------------------------------------------
# sudo veracrypt

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
# --create vctest.vc

#----------------------------------------------------------------------------------------
# Next we indicate how big. If you just list a number, VeraCrypt assumes you mean
# bytes, but you can also affix M for megabytes, G gigabytes, K kilobytes, and so on.
# Here I'm going to keep it small for demo purposes and use 200 megabytes.
#----------------------------------------------------------------------------------------
# --size 200M

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
# In order to keep this container portable across OS's (Windows and macOS)
# we'll format using exfat. In order to format as exFAT, you'll need to have installed
# the exFAT utilities on your system (see the comments at the top).
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
#
# I've provided a sample one as part of this demo, I just randomly smacked
# keys on my keyboard with my eyes closed. I'd suggest creating one of
# your own for production, but for just testing and learning (I'm assuming
# you'll throw away the vault when you are done) then the one here will be OK.
#----------------------------------------------------------------------------------------
# --random-source randomdata.txt

# The line you can run in Terminal is:
sudo veracrypt --text --create vctest.vc --size 200M --password MySuperSecurePassword1! --volume-type normal --encryption AES --hash sha-512 --filesystem exfat --pim 0 --keyfiles "" --random-source randomdata.txt

