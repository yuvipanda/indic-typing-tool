# Indic Typing Tool

This is a simple tool that lets you type in your native language on mobile phones. Currently only iOS devices are supported.

The tool is a simple wrapper around Wikimedia Foundation [Language Engineering][wmfle]'s [jquery.ime][jime] project. It simply adds a much easier to use (on a mobile device) language selector, and makes it available offline (on iOS devices). 

## Hacking on it

The project is written as a pure HTML offline application - no server side components. I use [CoffeeScript][cs] and [LESS][less]. The core `jquery.ime` engine is in Javascript, and contributions/fixes to keyboard maps should go to [the jquery.ime repo][jime].

## Credits

Many thanks to [Santhosh Thottingal][sant] for answering my questions during the development of the tool.

[wmfle]: https://wikimediafoundation.org/wiki/Language_Engineering_team
[jime]: http://github.com/wikimedia/jquery.ime
[sant]: http://thottingal.in
[cs]: http://coffeescript.org/
[less]: http://lesscss.org/
