# VeraCrypt On The Command Line for macOS

## Introduction

Automation is the key to success, especially in the DevOps world. In addition, security is an ever increasing need in today's world of hacks and ransomware.

In my last two posts I showed how to use the encryption utility, VeraCrypt, to create encrypted containers and drives to securely store data. In this, and the next two posts, we'll see how we can automate VeraCrypt from the command line.

We'll cover the basics. Creating a container, mounting a container (aka volume), getting a list of mounted volumes, and finally dismounting your volumes.

As it turns out, the command line syntax is a bit different for all the major operating systems. In this post we'll focus on macOS, in the next two posts we'll cover Windows and Linux.

## Prerequisites

Naturally, you'll have to have VeraCrypt installed. You can find out more in my first post of the series, VeraCrypt - A Powerful Encryption Utility.

The next requirement applies to macOS. In order for macOS to be able to read the variety of filesystems VeraCrypt supports, you need to install a free utility, macFUSE.

It's free, fast to install and takes very little in the way of system resources. It's compatible with macOS BigSur and Catalina, and probably older versions too, check their site if you have that need.

## Code Samples

While I will be providing samples here, you should also check out the project I have on GitHub that goes with this post, VeraCrypt-CommandLine-Examples.

I'll update it over time as needed, and it may be easier for you to download, or cut and paste from it.

OK, let's get started!

## Creating a Container

First off, let's look at the long line of code needed to create a container. Please note that while your blog reader may wrap the command below, it should be one line in your shell script.

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --create "/Users/arcanecode/Documents/temp/vctest.vc" --size "200M" --password MySuperSecurePassword1! --volume-type normal --encryption AES --hash sha-512 --filesystem exfat --pim 0 --keyfiles "" --random-source /Users/arcanecode/Documents/temp/randomdata.txt
```

OK, that's a bit hard to read, so let me break it out into each part below.

The first item is the path to the VeraCrypt application, assuming you installed it in the default location.

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt
```

The `--text` parameter says we want to use VeraCrypt in text mode, not GUI.  Note, the `--text` parameter must be the FIRST parameter you pass in, or it will not work.

```
--text
```

We next tell VeraCrypt we want to create a new file container, and where it is to be stored at. For this demo, I've created a **temp** folder in my **Documents** directory.

You'll want to change this to the location where you store your volumes. In addition, you'll also want to change the user folder from **arcanecode** to your username.

```
--create "/Users/arcanecode/Documents/temp/vctest.vc"
```

Next we indicate how big we want our container to be. If you just list a number, VeraCrypt assumes you mean bytes, but you can also affix M for megabytes, G gigabytes, K kilobytes, and so on.

Here I'm going to keep it small for demo purposes and use 200 megabytes.

```
--size "200M"
```

Now we provide our password. Normally you would not want to hard code it, but rather pass it into your script as a parameter.

I wanted to keep this demo simple though, and focus on VeraCrypt so I've just hard coded it. I'm using the same "super secure" password I've used in my last few posts.

```
--password MySuperSecurePassword1!
```

Next is the volume type, normal or hidden. My previous blog post talks about hidden types, and if you are going to do a hidden volume I would suggest using the GUI in order to assure it is done right.

For this demo we'll go with a normal volume

```
--volume-type normal
```

Now we pick the encryption type. There are quite a few, so refer to the VeraCrypt documentation for a full list. Here we're using AES.

```
--encryption AES
```

Next up, for the encryption method we picked it needs to know the hashing algorithm. For AES I suggest SHA-512.

```
--hash sha-512
```

In order to keep this container portable across other OS's (Windows and Linux) we'll format using exfat. Be aware though that to use exfat on a Mac, you'll have to install macFUSE (see the prerequisites section above.)

```
--filesystem exfat
```

The PIM is a special number that allows you to specify the number of times hashing algorithm executes. It's a bit more complex than that, if you want full details see the VeraCrypt documentation.

For now, we can pass it the value of 0 (zero), which tells it to use the default value for the PIM.

```
--pim 0
```

You can mount a volume in VeraCrypt using a keyfile, as opposed to a password. We've not done that here, so we'll just pass in an empty string to indicate we won't use a keyfile.

```
--keyfiles ""
```

As a final parameter, you need to provide random data for VeraCrypt to use when generating its hashes. It needs at least 320 characters, but you can give more.

I've provided a sample one as part of this demo (see the GitHub code samples), I just randomly smacked keys on my keyboard with my eyes closed. I'd suggest creating one of your own for production, but for just testing and learning (I'm assuming you'll throw away the vault when you are done) then the one here will be OK.

```
--random-source /Users/arcanecode/Documents/temp/randomdata.txt
```

OK, that's everything you need to create a volume. Now that it's created, let's mount it.

## Mounting a VeraCrypt Volume

Here is the full command line to mount. (As before, it should be on a single line, ignore any wrapping done by your browser).

```

/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --mount "/Users/arcanecode/Documents/temp/vctest.vc" /Volumes/vctest --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no --slot 1 --verbose
```

Let's start breaking it down. First, as before, is the full path to the VeraCrypt app. 

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt
```

As with all of these commands, the `--text` parameter must come first to let VeraCrypt know we want to use text mode and not the GUI.

```
--text
```

The mount parameter actually has two values that need to be passed in.

First we pass in the name of the file to mount.

Second we need to provide a mount point. This will let macOS treat it like any other drive you might plug in.

In macOS, use /Volumes then add on a name. For simplicity I usually use the name of the file (without any extension),  but it doesn't have to be.

In reality though, it doesn't make a real difference as macOS overrides the name you provide, and instead uses "Untitled", "Untitled 2", and so on.

```
--mount "/Users/arcanecode/Documents/temp/vctest.vc" /Volumes/vctest
```

Next is our "super secure" password. If your password has spaces, you'll need to wrap this in double quote marks.

```
--password MySuperSecurePassword1!
```

If you overrode the default PIM when creating your volume, you'll need to provide it. Otherwise, we can pass it the value of 0 (zero), which tells it to use the default value

```
--pim 0
```

If you created your volume using a keyfile or files, provide them here. Otherwise, you can just pass in an empty string to indicate no keyfile is needed.

```
--keyfiles ""
```

If this volume contained a hidden volume, you would need to let VeraCrypt know by using a value of yes, plus some other parameters.

In this case there is no hidden partition in our volume, so we can just give a value of `no`.

```
--protect-hidden no
```

### OPTIONAL - Slot

Slot is an optional parameter. If you look at the VeraCrypt GUI in macOS, down the left side are a series of slot numbers. If you omit this parameter, VeraCrypt will mount in the first empty slot.

However you can specify a slot, which can be useful if you want to make sure certain volumes always mount in a specific slot. You can then use the slot number when you want to dismount your volumes.

```
--slot 1

```

### OPTIONAL - Verbose

Verbose is also an optional parameter, but I often include it just to see what is going on under the covers. You can use it with any of the commands in this post, I just included it on this one for example purposes.

If you intend to make this into a script then I would suggest omitting it once your script is debugged and working.

```
--verbose
```

OK, hopefully all is going well, and you've created and mounted your volume. Let's next see how to get a list, from the command line, of all your mounted volumes.

## Listing Mounted Volumes

Here's the command line to see what is mounted on your Mac.

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --list
```

As with other commands you have seen, we start with the full path to the VeraCrypt application. We then use `--text` to let VeraCrypt know not to use the GUI.

We finish with `--list`, which tells VeraCrypt to display a list of all mounted containers. This will include the slot number, volume name, and mount directory.

Mom always taught me to put away my toys when I was done playing with them, so in the next section we'll see how to unmount your volumes once you are done with them.

## Dismounting VeraCrypt Volumes

There are four ways to dismount a volume. Three of them will dismount a specific volume, the final will dismount all volumes.

All ways follow the same pattern. Give the path to the VeraCrypt app, followed by the `--text` parameter to tell VeraCrypt not to launch the GUI.

Finally we give the `--dismount` to let VeraCrypt know we want to unload our volume. The value passed into the `--dismount` parameter varies, and will be explained below.

### Method 1: Slot Number

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --dismount --slot 1
```

With the first method, you provide the slot number. If you mounted a volume and used the slot number parameter,  for example your personal file vault is always in slot 5, then this can be an easy way to dismount.

On the other hand, if you let VeraCrypt load in the first available slot, you'll either have to look at the GUI, or run the list command in the previous section, to learn the slot number.

### Method 2: Volume Name

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --dismount "/Volumes/Untitled"
```

Using the volume list command or looking at the "Mount Directory" column in the GUI, you can pass in that value to unmount. Because this is typically "Untitled", "Untitled 1" and so on, it can be of an issue trying to be reliable in unmounting the right volume.

### Method 3: Volume File Name

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --dismount "/Users/arcanecode/Documents/temp/vctest.vc"
```

This method is the most reliable. Since you know the name of the file you mounted, you can just provide the same file name to unmount.

VeraCrypt doesn't care what slot it is loaded into, it uses the file name to find it.

### The winner - Method 3!

For the reasons above, I highly suggest Method 3 be your go to method for dismounting volumes in your scripts. It is the most reliable, and easiest to understand when looking at the scripts.

But wait, there's more!

### Dismounting ALL Volumes

There is one final method, you can dismount all of the VeraCrypt volumes you have mounted.

```
/Applications/VeraCrypt.app/contents/MacOS/VeraCrypt --text --dismount
```

If you use just the `--dismount` parameter, and pass in no values, then VeraCrypt will attempt to dismount ALL volumes you have loaded.

This can be a useful command to run when you're shutting down your Mac, to ensure all volumes are properly shutdown.

If you don't have any volumes mounted, then VeraCrypt basically shrugs it's shoulders, does nothing, and ends.

## Conclusion

In this post, we learned how to create, mount, and dismount VeraCrypt volumes from the command line in macOS. In addition, we also saw how to get a listing of volumes currently mounted.

In the next two posts we'll see how to do the same things, but in Windows, then Linux.

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
