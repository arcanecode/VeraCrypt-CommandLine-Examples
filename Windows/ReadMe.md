# ReadMe for VeraCrypt on the Command Line on Windows

## Overview

This set of files has examples to create, mount, and dismount VeraCrypt volumes in Windows. This is to support my blog post at [arcanecode.com](https://arcanecode.com). Alteratively, a copy of the post has been placed in the [post.md](post.md) file in this folder.

Each script is well documented with all of its parameters. When doing a code review, I'd suggest reading in this order:

1. create-volume.bat
1. mount-volume.bat
1. dismount-volume.bat

Note that, unlike the macOS version, the Windows version of VeraCrypt does not have a feature to list volumes.

Additionally, the Windows version of VeraCrypt does not require the use of a randomdata.txt file like macOS requires. It can generate its own pool of random data.

---

## Author Information

### Author

Robert C. Cain | [@ArcaneCode](https://twitter.com/arcanecode) | arcanecode@gmail.com

### Websites

About Me: [http://arcanecode.me](http://arcanecode.me)

Blog: [http://arcanecode.com](http://arcanecode.com)

Github: [http://arcanerepo.com](http://arcanerepo.com)

LinkedIn: [http://arcanecode.in](http://arcanecode.in)

### Copyright Notice

This document is Copyright (c) 2021 Robert C. Cain. All rights reserved.

The code samples herein is for demonstration purposes. No warranty or guarantee is implied or expressly granted.

This document may not be reproduced in whole or in part without the express written consent of the author. Information within can be used within your own projects.
