# Emacs sxhkd-mode

A very simple major mode to edit [sxhkd](https://github.com/baskerville/sxhkd) config files.

<p align=center><img src=&ldquo;screenshot.png /></p>

This mode inherits from `sh-mode`, and just adds some faces to highlight key
names (`ctrl`, `Print`...)

Use <kbd>C-c C-c</kbd> (`sxhkd-update-sxhkd`) to update sxhkd through a `USR-1` signal.

