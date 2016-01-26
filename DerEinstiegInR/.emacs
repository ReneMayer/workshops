(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#313131" "#D9A0A0" "#8CAC8C" "#FDECBC" "#99DDE0" "#E090C7" "#A0EDF0" "#DCDCCC"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (dichromacy)))
 '(custom-safe-themes
   (quote
    ("bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" default)))
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers)
     (ess-fl-keyword:operators)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T)
     (ess-R-fl-keyword:%op%))))
 '(fci-rule-color "#5E5E5E")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   (quote
    ((20 . "#C99090")
     (40 . "#D9A0A0")
     (60 . "#ECBC9C")
     (80 . "#DDCC9C")
     (100 . "#EDDCAC")
     (120 . "#FDECBC")
     (140 . "#6C8C6C")
     (160 . "#8CAC8C")
     (180 . "#9CBF9C")
     (200 . "#ACD2AC")
     (220 . "#BCE5BC")
     (240 . "#CCF8CC")
     (260 . "#A0EDF0")
     (280 . "#79ADB0")
     (300 . "#89C5C8")
     (320 . "#99DDE0")
     (340 . "#9CC7FB")
     (360 . "#E090C7"))))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(cua-mode t) ; windows style binding C-x, C-v, C-c, C-z
(global-font-lock-mode t) ; turn on syntax highlighting

;; start R in current working directory, don't let R ask user
(setq ess-ask-for-ess-directory nil)

;; create a new frame for each help instance
(setq ess-help-own-frame 'one)
;; I want the *R* process in its own frame
;; (setq inferior-ess-own-frame t)


;; Run C-c C-d C-e to see effect
(setq ess-describe-at-point-method 'tooltip)

(setq completion-auto-help t)
(setq ess-use-auto-complete t)


;; Remove Emacs "splash screen"
;; http://fuhm.livejournal.com/
(defadvice command-line-normalize-file-name
  (before kill-stupid-startup-screen activate)
  (setq inhibit-startup-screen t))
(setq inhibit-splash-screen t)


;; Make Emacs scroll smoothly with down arrow key.
;; 2011-10-14
;; faq 5.45 http://www.gnu.org/s/emacs/emacs-faq.html#Modifying-pull_002ddown-menus
(setq scroll-conservatively most-positive-fixnum)


(set-keyboard-coding-system 'iso-latin-1)


(ess-toggle-underscore nil)


; ESS 13.05 default C-Ret conflicts with CUA mode rectangular selection.
;; Change shortcut to use Shift-Return
;; Suggested by Vitalie Spinu ESS-help email 2013-05-15
;; Revision suggested 2013-09-30 to co-exist with Windows Emacs
;; and the load order which has ess after user init file.
(eval-after-load "ess-mode"
 '(progn
   (define-key ess-mode-map [(control return)] nil)
   (define-key ess-mode-map [(control e)] 'ess-eval-region-or-line-and-step))
)


(let ((default-directory  "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))


(require 'auto-complete)
(global-auto-complete-mode t)



;;(require 'auto-complete)
;;(global-auto-complete-mode t)

;;(ac.config-default t)


(setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


(require 'ess-site)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))


;; Toggle between org & R modes.
(defun toggle-org-R-mode ()
  (interactive)
  "Toggle mode between org-R modes"
  (cond
   ((string= major-mode "org-mode")
    (R-mode))
   ((string= major-mode "ess-mode")
    (org-mode))
   )
  )
(global-set-key [f6] 'toggle-org-R-mode)



