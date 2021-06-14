# VeraCrypt on the Command Line for Windows

## Introduction

This is part of my ongoing series on the VeraCrypt encryption utility. If you've not kept up, in my first post of the series, "VeraCrypt - A Powerful Encryption Utility", I covered the basics of VeraCrypt including how to get it, use it through the GUI, and how the series was inspired by the Grumpy Old Bens podcast.

In the second post, "Creating and Using Hidden Containers in VeraCrypt", I covered how to create a hidden container, adding an extra level of security to your containers.

My previous post, "VeraCrypt on the Command Line for macOS", showed how to call VeraCrypt from within a script on the macOS platform.

The commands to call VeraCrypt from the command line are very different for each platform, As such, I've broken them out into individual blog posts.

In this entry you'll see how to call VeraCrypt on Windows 10.

## Prerequisites

Obviously, you'll need to have VeraCrypt installed. My first post in the series,  "VeraCrypt - A Powerful Encryption Utility", covers where to get it from.

For this post, we'll also be using the CMD mode to execute the commands. Do note that on most installations of Windows these days, PowerShell has replaced CMD as the default terminal shell. If you open up a command window and see PowerShell, all you have to do is type in CMD and it enter, and you'll be switched to CMD mode.

## Code Samples

While I will be providing samples here, you should also check out the project I have on GitHub that goes with this post, VeraCrypt-CommandLine-Examples.

I’ll update it over time as needed, and it may be easier for you to download, or cut and paste from it.

One item I want to mention, unlike the macOS version, the Windows version of VeraCrypt lacks the ability to list containers. So for this post we'll only be able to include creation, mounting and dismounting of containers.

OK, let’s get started!

## Creating a Container

Let's begin by looking at the full command to create a container, then we will break it down to it's individual components. While your blog reader or webpage may wrap the line, in your script (or command line) it should all be entered as a single line of text.

```
"C:\Program Files\VeraCrypt\VeraCrypt Format.exe" /create "C:\temp\vctest.vc" /size "200M" /password MySuperSecurePassword1! /encryption AES /hash sha-512 /filesystem exfat /pim 0 /silent
```

First up is the command to call. If you installed VeraCrypt to the default folder, you'll find it in `C:\Program Files\VeraCrypt\`.

The command to create a new volume is actually a separate executable than the rest of VeraCrypt. It is "`VeraCrypt Format.exe`"

Note there is indeed a space in the file name! Thus you have to enclose the entire thing in double quotes.

```
"C:\Program Files\VeraCrypt\VeraCrypt Format.exe"
```

Next is the command to create a volume, `/create`. You follow it with the path and file name to create. If you omit the path it will create the volume in the current directory you are running the script from.

As with all file names, if it has a space you must include double quotes. Otherwise they are optional, but it doesn't hurt to have them.

```
/create "C:\temp\vctest.vc"
```

We now need to tell VeraCrypt how big to make the volume. VeraCrypt includes shortcuts for M (Megabytes), G (Gigabytes), T (Terabytes) and K (Kilobytes). If you omit a letter, it assumes bytes.

For this demo we are making it small, so will use 200M to indicate 200 Megabytes.

```
/size "200M"
```

Next up is the password to use to encrypt the volume. In a "real world" situation, you should probably pass it into the script or get it using an alternate method.

To keep this demo simple, I'm just going to embed the password using the "super secure" password I've used throughout this series of blog posts.

As with file names, if your password has spaces you'll need to enclose it in double quotes.

```
/password MySuperSecurePassword1!
```

Now we need to provide the encryption algorithm to use. VeraCrypt supports a vast array of algorithms, see their documentation for the supported list.

For this demo, we'll use the popular AES.

```
/encryption AES
```

Many algorithms require you to provide an encryption hashing method. For AES, we'll use the strong SHA-512.

```
/hash sha-512
```

In order to keep this container portable across OS's we'll format using exfat. Be aware though that to use exfat on a Mac, you'll have to install macFUSE (see my previous post on macOS for more info).

```
/filesystem exfat
```

The PIM is a special number that allows you to specify the number of times the hashing algorithm executes. It's a bit more complex than that, if you want full details see the VeraCrypt documentation at:

https://documentation.help/VeraCrypt/Personal%20Iterations%20Multiplier%20(PIM).html

For now, we can pass it the value of 0, which tells it to use the default value.

```
/pim 0
```

The final parameter is `/silent`. By default VeraCrypt will display dialogs notifying you of its progress, as well as when it is complete.

In a scripting situation you would normally not want this, so we add the silent switch to suppress the messages.

Note this does have one side affect, if there are any errors those too are also suppressed, so you won't be aware of them. The most common of these would be the attempt to create a volume name that already exists.

```
/silent
```

You now have everything you need to create a VeraCrypt volume. Note that there is one more parameter that we didn't use in the example, but you may want to know about.

```
/force
```

Normally, if you are trying to create a new volume and that file already exists, VeraCrypt will pop up a dialog (assuming you've not used /silent) warning you the volume you are trying to create already exists. It will then give you the choice of canceling or overwriting the existing file.

The `/force` parameter suppresses the message and always overwrites the file.

So hopefully you've now created your own volume using the commands in this section. Let's now see how to mount it.

## Mounting a VeraCrypt Volume

Mounting is very simple, here is the full command, then we'll take a look at each part. As before, it should be all a single line.

```
"C:\Program Files\VeraCrypt\VeraCrypt.exe" /volume "C:\temp\vctest.vc" /letter x /password MySuperSecurePassword1! /quit /silent
```

We start with the command to VeraCrypt. This assumes you have installed to the default folder.

```
"C:\Program Files\VeraCrypt\VeraCrypt.exe"
```

Next we provide the `/volume` parameter, with the path to and the file name of the file to mount.

```
/volume "C:\temp\vctest.vc"
```

Volumes in VeraCrypt appear as a drive letter to Windows. As such we need to provide a letter to use. Note if you use a drive letter already in use, you'll get an error.

The letter can be provided in either or upper or lower case.

If you don't know a drive letter, or don't care what letter is used, then you can omit this parameter completely. When you do, VeraCrypt will use the first available drive letter it finds.

```
/letter x
```

Next up is the password to use to encrypt the volume. In a "real world" situation, you should probably pass it into the script, or get it using an alternate method.

To keep this demo simple, I'm just going to embed the password using the "super secure" password I've used throughout this series of blog posts.

As with file names, if your password has spaces you'll need to enclose it in double quotes.

```
/password MySuperSecurePassword1!
```

Next we provide the `/quit` parameter. By default, if you omit it then the VeraCrypt dialog will remain on the screen. Using quit will close the VeraCrypt dialog, something usually desired if you are running a script.

```
/quit
```

Finally we'll add the `/silent` parameter. This has the same affect as it did in the create function, suppressing any dialogs. Be aware, that for `/silent` to work, you must also have used the `/quit` parameter.

```
/silent
```

At this point hopefully all went well, and you have created a volume as well as mounted it. Once you are done with a volume, you'll need to dismount it, the subject of the next section.

## Dismounting VeraCrypt Volumes

The command to dismount a volume is the simplest of all.

```
"C:\Program Files\VeraCrypt\VeraCrypt.exe" /dismount H /quit /silent /force
```

Let's look at the individual components of the command.

We start with the command to VeraCrypt. This assumes you have installed to the default folder.

```
"C:\Program Files\VeraCrypt\VeraCrypt.exe"
```

Next is the dismount parameter. You pass in the drive letter associated with the volume to dismount. As with mounting, the case of the drive letter does not matter.

If you omit the drive letter, VeraCrypt will dismount ALL currently mounted volumes.

```
/dismount X
```

We now provide the quit parameter. By default, if you omit it then the VeraCrypt dialog will remain on the screen. Using quit will close the VeraCrypt dialog, something usually desired if you are running a script.

```
/quit
```

Now we append the `/silent` parameter, to suppress any dialogs as we did in the previous sections. As with mounting, for `/silent` to work we must also include /quit.

```
/silent
```

Finally we provide the force parameter. If some app is accessing the volume, for example Windows File Explorer, it will prevent VeraCrypt from dismounting.

The force parameter tells VeraCrypt to shut down, no matter what. Your inclusion of force is up to you, depending on your situation.

For the demo, we'll include it.

```
/force
```

And that's all there is to it. It's a best practice to dismount all of your volumes when you are done with them, and especially before shutting down your computer.

This will ensure any operations that are copying data to your encrypted volume have completed, ensuring the data does not get corrupted.

## Conclusion

This post covered how to create, mount and dismount VeraCrypt volumes in Windows 10. The technique should also be applicable to Windows 7 and 8, if you are still on those platforms.


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
