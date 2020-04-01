;;; sxhkd-mode.el --- Simple major mode to edit sxhkd config files -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Yoav Marco
;;
;; Author: Yoav Marco <http://github/yoavm448>
;; Maintainer: Yoav Marco <yoavm448@gmail.com>
;; Created: February 07, 2020
;; Modified: February 07, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/yoavm448/sxhkd-mode
;; Package-Requires: ((emacs 26.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Simple major mode to edit sxhkd config files
;;  This mode inherits from `sh-mode`, and just adds some faces to highlight key
;;  names (ctrl, Print...)
;;
;;  Use C-c C-c (`sxhkd-update-sxhkd') to update sxhkd through a USR1 signal.
;;
;;; Code:


(defun sxhkd-update-sxhkd ()
  "Save buffer and send a USR1 to sxhkd for it to reload the config."
  (interactive)
  (save-buffer)
  (message "Updating sxhkd...")
  (start-process "pkill" nil "pkill" "-USR1" "sxhkd"))

(defvar sxhkd-mode-map
  (let ((keymap (make-sparse-keymap)))
    (define-key keymap (kbd "C-c C-c") #'sxhkd-update-sxhkd)
    keymap)
  "Keymap for sxhkd major mode.")

(defgroup sxhkd nil
  "Group for sxhkd-mode relatex stuff."
  :group 'sxhkd
  :prefix "sxhkd-"
  :link '(url-link :tag "Homepage" "https://github.com/yoavm448/sxhkd-mode"))

(defvar sxhkd-mode-hook nil
  "Hooks to run after entering `sxhkd-mode'.")

;;;###autoload
(define-derived-mode sxhkd-mode sh-mode "sxhkd"
  "Basic major mode for editing sxhkd config files.

Inherits from `sh-mode', and provides syntax highlighting for
modifiers and special keys. Use C-c C-c to update sxhkd.")

;;;###autoload
(add-to-list 'auto-mode-alist
             '("/sxhkdrc\\'" . sxhkd-mode))

(defface sxhkd-bspc-face
  '((t :inherit font-lock-type-face))
  "Face used to mark the 'bspc' command"
  :group 'sxhkd)

(font-lock-add-keywords
 'sxhkd-mode
 `((,(regexp-opt '("bspc") 'words)
    0 'sxhkd-bspc-face prepend))
 'end)

(defface sxhkd-modifiers-face
  '((t :inherit font-lock-builtin-face))
  "Face used for modifier keys, like super and ctrl.")

(font-lock-add-keywords
 'sxhkd-mode
 `((,(regexp-opt '("super" "hyper" "meta" "alt" "control" "ctrl" "shift" "mode_switch"
                   "lock" "mod1" "mod2" "mod3" "mod4" "mod5" "_") 'words)
    0 'sxhkd-modifiers-face prepend))
 'end)

(defface sxhkd-special-face
  '((t :inherit font-lock-keyword-face))
  "Face used for spacial keys, like BackSpace and Print.")

(font-lock-add-keywords
 'sxhkd-mode
 `((,(regexp-opt
      '("BackSpace" "Tab" "Linefeed" "Clear" "Return" "Pause" "Scroll_Lock"
        "Sys_Req" "Escape" "Delete" "Select" "Print" "Execute" "Insert"
        "Undo" "Redo" "Menu" "Find" "Cancel" "Help" "Break" "Mode_switch"
        "script_switch" "Num_Lock" "space" "exclam" "quotedbl" "numbersign"
        "dollar" "percent" "ampersand" "apostrophe" "quoteright"
        "parenleft" "parenright" "asterisk" "plus" "comma" "minus" "period"
        "slash" "colon" "semicolon" "less" "equal" "greater" "question"
        "at" "bracketleft" "backslash" "bracketright" "asciicircum"
        "underscore" "grave" "quoteleft" "braceleft" "bar" "braceright"
        "asciitilde"

        "XF86ModeLock" "XF86MonBrightnessUp" "XF86MonBrightnessDown"
        "XF86KbdLightOnOff" "XF86KbdBrightnessUp" "XF86KbdBrightnessDown"
        "XF86Standby" "XF86AudioLowerVolume" "XF86AudioMute"
        "XF86AudioRaiseVolume" "XF86AudioPlay" "XF86AudioStop"
        "XF86AudioPrev" "XF86AudioNext" "XF86HomePage" "XF86Mail"
        "XF86Start" "XF86Search" "XF86AudioRecord" "XF86Calculator"
        "XF86Memo" "XF86ToDoList" "XF86Calendar" "XF86PowerDown"
        "XF86ContrastAdjust" "XF86RockerUp" "XF86RockerDown"
        "XF86RockerEnter" "XF86Back" "XF86Forward" "XF86Stop" "XF86Refresh"
        "XF86PowerOff" "XF86WakeUp" "XF86Eject" "XF86ScreenSaver" "XF86WWW"
        "XF86Sleep" "XF86Favorites" "XF86AudioPause" "XF86AudioMedia"
        "XF86MyComputer" "XF86VendorHome" "XF86LightBulb" "XF86Shop"
        "XF86History" "XF86OpenURL" "XF86AddFavorite" "XF86HotLinks"
        "XF86BrightnessAdjust" "XF86Finance" "XF86Community"
        "XF86AudioRewind" "XF86BackForward" "XF86Launch0" "XF86Launch1"
        "XF86Launch2" "XF86Launch3" "XF86Launch4" "XF86Launch5"
        "XF86Launch6" "XF86Launch7" "XF86Launch8" "XF86Launch9"
        "XF86LaunchA" "XF86LaunchB" "XF86LaunchC" "XF86LaunchD"
        "XF86LaunchE" "XF86LaunchF" "XF86ApplicationLeft"
        "XF86ApplicationRight" "XF86Book" "XF86CD" "XF86Calculater"
        "XF86Clear" "XF86Close" "XF86Copy" "XF86Cut" "XF86Display"
        "XF86DOS" "XF86Documents" "XF86Excel" "XF86Explorer" "XF86Game"
        "XF86Go" "XF86iTouch" "XF86LogOff" "XF86Market" "XF86Meeting"
        "XF86MenuKB" "XF86MenuPB" "XF86MySites" "XF86New" "XF86News"
        "XF86OfficeHome" "XF86Open" "XF86Option" "XF86Paste" "XF86Phone"
        "XF86Q" "XF86Reply" "XF86Reload" "XF86RotateWindows"
        "XF86RotationPB" "XF86RotationKB" "XF86Save" "XF86ScrollUp"
        "XF86ScrollDown" "XF86ScrollClick" "XF86Send" "XF86Spell"
        "XF86SplitScreen" "XF86Support" "XF86TaskPane" "XF86Terminal"
        "XF86Tools" "XF86Travel" "XF86UserPB" "XF86User1KB" "XF86User2KB"
        "XF86Video" "XF86WheelButton" "XF86Word" "XF86Xfer" "XF86ZoomIn"
        "XF86ZoomOut" "XF86Away" "XF86Messenger" "XF86WebCam"
        "XF86MailForward" "XF86Pictures" "XF86Music" "XF86Battery"
        "XF86Bluetooth" "XF86WLAN" "XF86UWB" "XF86AudioForward"
        "XF86AudioRepeat" "XF86AudioRandomPlay" "XF86Subtitle"
        "XF86AudioCycleTrack" "XF86CycleAngle" "XF86FrameBack"
        "XF86FrameForward" "XF86Time" "XF86Select" "XF86View" "XF86TopMenu"
        "XF86Red" "XF86Green" "XF86Yellow" "XF86Blue" "XF86Suspend"
        "XF86Hibernate" "XF86TouchpadToggle" "XF86TouchpadOn"
        "XF86TouchpadOff" "XF86AudioMicMute" "XF86Keyboard" "XF86WWAN"
        "XF86RFKill" "XF86AudioPreset" "XF86Switch_VT_1" "XF86Switch_VT_2"
        "XF86Switch_VT_3" "XF86Switch_VT_4" "XF86Switch_VT_5"
        "XF86Switch_VT_6" "XF86Switch_VT_7" "XF86Switch_VT_8"
        "XF86Switch_VT_9" "XF86Switch_VT_10" "XF86Switch_VT_11"
        "XF86Switch_VT_12" "XF86Ungrab" "XF86ClearGrab" "XF86Next_VMode"
        "XF86Prev_VMode" "XF86LogWindowTree" "XF86LogGrabInfo") 'words)
    0 'sxhkd-special-face prepend))
 'end)

(provide 'sxhkd-mode)
;;; sxhkd-mode.el ends here
