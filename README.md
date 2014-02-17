CMDKit Framework
================

The CMDKit Framework, or Command Kit Framework, is a framework that helps make Objective-C programs for the UNIX Command Line.  

The framework is very simple to use. Here are the different features, and a bit about how they work:

####CMDArgumentHandle

Parses the input from argc and argv (in main()) and adds a load of useful features for interpreting the arguments. Maintains a list of valid options, their arguments, and can even print invalid options if they're present.

####CMDOption

Holds information about a valid option: its "name", number of arguments, and whether it is just a single letter or a word. Used in conjunction with CMDArgumentHandle to easily see if any invalid options are present, and to acquire the arguments of a given option.

####CMDConsoleManager

Manages a console and notifies the delegate of any input received. Extremely useful for using commands within a program.

####CMDPrinting

Various printing functions that seamlessly blend printf and new lines.

###Wiki

Be sure to take a look at the [wiki](https://github.com/Macro206/CMDKit-Framework/wiki) for full documentation on the various classes and protocols.

###Note:  
  
Specifically made for Mac. It uses the Foundation Framework, which is available by default on Macs.

Therefore it won't work on Linux or Windows.

However, you're welcome to rewrite it (e.g. in C++) so that it works on other platforms. If you choose to publish the modified code, please attribute me, or even better, include a link to the original repository.

Thanks!

Made by Macro206
