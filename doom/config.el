;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jackson Daumeyer"
      user-mail-address "jackson.daumeyer@gmail.com")

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
(setq doom-font (font-spec :family "Hermit" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-peacock)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; PROJECTILE
(setq projectile-project-search-path '("~/doc/drexel/")
      projectile-globally-ignored-file-suffixes '(".pdf" ".odt"))

;; Writeroom-mode setup
(add-hook 'writeroom-mode-hook
  (setq text-scale-set 0)
  (setq display-line-numbers-type nil))

;; Doom Modeline
(setq doom-modeline-modal-icon nil)

;; ======================
;; ORG MODE CONFIGUARTION
;; ======================
;; Big Headers
;;(defun my/org-mode-hook ()
;;(add-hook 'org-load-hook #'my/org-mode-hook)

;; Google Calendar Integration
;; Org Caputre
(setq org-capture-templates
          '(("t" "Todo Item" entry (file+headline "~/Dropbox/org/todo.org" "General")
             "* TODO %? %^g\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
            ("p" "Project" entry (file+headline "~/Dropbox/org/todo.org" "Projects")
             "* TODO %?")
            ("i" "Intrest" entry (file+headline "~/Dropbox/org/todo.org" "Intrests")
             "* %? %^g \n %a")
          ("w" "Work Task" entry (file+headline "~/Dropbox/org/todo.org" "Abre Coop")
           "* TODO %?")))
(after! org
  ;; Margins
  (setq org-superstar-headline-bullets-list '("◉" "○" "▣" "□" "◈" "◇" "➢" )
        org-ellipsis "  ") ;; folding symbol

  ;; Header Faces
  (set-face-attribute 'org-document-title nil :family "Roboto Slab" :height 3.0)
  (set-face-attribute 'org-level-1        nil :family "Roboto Slab" :height 2.0)
  (set-face-attribute 'org-level-2        nil :family "Roboto Slab" :height 1.8)
  (set-face-attribute 'org-level-3        nil :family "Roboto Slab" :height 1.7)
  (set-face-attribute 'org-level-4        nil :family "Roboto Slab" :height 1.6)
  (set-face-attribute 'org-level-5        nil :family "Roboto Slab" :height 1.5)
  (set-face-attribute 'org-level-6        nil :family "Roboto Slab" :height 1.4)
  (set-face-attribute 'org-level-7        nil :family "Roboto Slab" :height 1.3)
  (set-face-attribute 'org-level-8        nil :family "Roboto Slab" :height 1.2)
  (set-face-attribute 'org-tag            nil :family "Hermit"      :height 1.0)
  ;; Agenda Faces
  (set-face-attribute 'org-agenda-date                  nil :family "Hermit" :height 1.6)
  (set-face-attribute 'org-agenda-date-today            nil :family "Hermit" :height 1.6)
  (set-face-attribute 'org-agenda-date-weekend          nil :family "Hermit" :height 1.6)
  ;;(set-face-attribute 'org-agenda-date-later            nil :family "Roboto Slab" :height 1.5)
  ;;(set-face-attribute 'org-agenda-date-earlier          nil :family "Roboto Slab" :height 1.5)
  (set-face-attribute 'org-agenda-structure             nil :family "Roboto Slab" :height 2.0)
  ;;(set-face-attribute 'org-agenda-deadline-face         nil :foreground "red")

  (setq org-todo-keywords '((sequence "TODO(t)" "PROG(p)" "WAIT(w)" "|" "DONE(d)")))
  ;; ☑□⌚e
        ;; show actually italicized text instead of /italicized text/
  ;; Make lists look a bit cooler
  ;;(font-lock-add-keywords 'org-mode
  ;;                      '(("^+\\([-*]\\) "
  ;;                        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "➥"))))))
;; ➥ →
  )
(setq org-agenda-block-separator (string-to-char " "))
(setq org-agenda-format-date 'my-org-agenda-format-date-aligned)

(defun my-org-agenda-format-date-aligned (date)
  "Format a DATE string for display in the daily/weekly agenda, or timeline.
This function makes sure that dates are aligned for easy reading."
  (require 'cal-iso)
  (let* ((dayname (calendar-day-name date 1 nil))
         (day (cadr date))
         (day-of-week (calendar-day-of-week date))
         (month (car date))
         (monthname (calendar-month-name month 1))
         (year (nth 2 date))
         (iso-week (org-days-to-iso-week
                    (calendar-absolute-from-gregorian date)))
         (weekyear (cond ((and (= month 1) (>= iso-week 52))
                          (1- year))
                         ((and (= month 12) (<= iso-week 1))
                          (1+ year))
                         (t year)))
         (weekstring (if (= day-of-week 1)
                         (format " W%02d" iso-week)
                       "")))
         (format " %s %s/%2d  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
            dayname month day)))

(setq org-agenda-custom-commands
      '(("x" "My Agenda"
          ((agenda "" (;;(org-agenda-skip-scheduled-if-done f)
                      (org-agenda-skip-timestamp-if-done t)
                      (org-agenda-skip-deadline-if-done t)
                      (org-agenda-start-day "+0d")
                      (org-agenda-span 7)
                      (org-agenda-overriding-header "\n✱ SCHEDULE:\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")

                      ;;(org-agenda-repeating-timestamp-show-all nil)
                      (org-agenda-prefix-format "   %t")
                       ;;(concat "  %-3i  %-15b %t%s" org-agenda-hidden-separator))
                      ;;(org-agenda-todo-keyword-format " ☐ ")
                      (org-agenda-time)
                      (org-agenda-current-time-string "⯇━━━━━━━━━ NOW")
                      ;;(org-agenda-scheduled-leaders '("" ""))
                      ;;(org-agenda-deadline-leaders '("" ""))
                      (org-agenda-time-grid (quote ((today require-timed remove-match) (0800 2100) "      " "━━━━━━━━━━━━━━━")))
                      ))

          (alltodo "" ;; List of all other tasks
                ((org-agenda-overriding-header "✱ TASKS:\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n")
                (org-agenda-remove-tags t)
                (org-agenda-prefix-format "   %t ")
                ;;(org-agenda-todo-keyword-format "")
                (org-agenda-dim-blocked-tasks 'invisible)
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))) ;; Ignore any scheduled tasks
        )))))


(server-start)
