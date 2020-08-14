;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Joshua Wong"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; Record all org files under org-agenda
(setq org-directory "~/org/")
(setq org-agenda-files (list "~/org"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Load centaur tabs (to remove this once I get used to emacs proper)
(define-key evil-normal-state-map (kbd "g n") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g m") 'centaur-tabs-backward)

(setq doom-font (font-spec :family "Iosevka" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Iosevka" :size 13)
      doom-big-font (font-spec :family "Iosevka" :size 19))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE" "DEFERRED" "CANCELLED")))

(setq org-tag-alist '(("Learning" . ?l) ("Personal" . ?p) ("Chore" . ?c)))

;; Store links for org
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link)

;; Org Journal notes
(setq org-journal-dir "~/org/journal/")
(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-file-format "Week-of-%d-%m-%Y")
(setq org-journal-file-type "'weekly")
(setq org-journal-find-file 'find-file)
(setq org-journal-file-header "#+TAGS:\n")
(require 'org-journal)
(require 'org-tempo)

;; Web Mode indent
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; prettier-js on save
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; Use xelatex as latex compiler
(setq org-latex-compiler "xelatex")
;; Add <au keybind to insert default header
(tempo-define-template "author"
  '("#+AUTHOR: Joshua Wong\n")
  "<au"
  "Add author name"
  'org-tempo-tags)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
