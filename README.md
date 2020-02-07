# Emacs sxhkd-mode

A very simple major mode to edit [sxhkd](https://github.com/baskerville/sxhkd) config files.

![screenshot](https://raw.githubusercontent.com/yoavm448/sxhkd-mode/master/screenshot.png)

This mode inherits from `sh-mode`, and just adds some faces to highlight key
names (`ctrl`, `Print`...)

Use <kbd>C-c C-c</kbd> (`sxhkd-update-sxhkd`) to update sxhkd through a `USR-1` signal.
