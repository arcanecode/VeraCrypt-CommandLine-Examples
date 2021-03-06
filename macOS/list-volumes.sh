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

/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --list 
