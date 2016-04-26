;;; Init --- my file
;;; Commentary:
;;;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;;                         ("melpa" . "https://melpa.org/packages/")))

(require 'package)
;;; Code:
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/") t)
;;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;;; KEY BINDINGS
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  ;(setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  ;(setq mac-command-modifier 'control)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

;;; ENABLE LINE NUMBER GLOBALLY
(global-linum-mode t)

;;; ENABLE COLUMN NUMBER
(setq column-number-mode t)

;;; DISABLE TAB CHARACTER
(setq-default indent-tabs-mode nil)

;;; DEFAULT INDENT 2 CHARACTERS
(setq standard-indent 2)

;;; DISABLE BACKUP FILE (filename~)
(setq make-backup-files nil)

;;; DISABLE AUTOSAVE FILE (#file-name#)
(setq auto-save-default nil)

;;; DEFAULT EMACS THEME SETTINGS
;;(load-theme 'wombat)

;;; CUSTOM THEME SETTINGS
;;; originally the custom-theme-load-path contains all the custom
;;; themes, due we are pulling the themes from git repos it required
;;; to load each  theme path (the folder that contains the .el theme file)
(add-to-list 'custom-theme-load-path "~/emacs-pkgs/themes/jbeans-emacs/")
(add-to-list 'custom-theme-load-path "~/emacs-pkgs/themes/monokai-emacs/")
(add-to-list 'custom-theme-load-path "~/emacs-pkgs/themes/emacs-material-theme")
;;(load-theme 'material t)
;;(load-theme 'ujelly t)
(load-theme 'jbeans t)
;;(load-theme 'monokai t)


;;; LOAD PROJECTILE
;;(projectile-global-mode)

;;; VERTICAL RULER SETTINGS
;;; (*** fucks up with company and maybe auto-complete ***)
;; setting vertical ruler via
;;(require 'fill-column-indicator)
;;(add-hook 'after-change-major-mode-hook 'fci-mode)
;;(setq fci-rule-column 81)
;;(setq fci-rule-color "#444444")
;;(setq fci-rule-use-dashes 1)
;;(setq fci-dash-pattern 0.8)
;;(setq fci-handle-truncate-lines nil)

;;; HIGHLIGHT LONG LINES, OVER 80 CHARS
;(setq whitespace-style '(face lines-tail))
;(global-whitespace-mode t)

;;; COLUMN MARKER
(add-to-list 'load-path "~/emacs-pkgs/column-marker/")
(require 'column-marker)
;;emacs counts first column as 0
;;(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 81)))
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))
;;(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))


;;; GETTING RID OF WHITESPACES
;;; this package gets enable is file is free from whitespaces,
;;; when file is dirty it need to be enabled (M-X delete- ...)
(add-to-list 'load-path "~/emacs-pkgs/delete-nl-spaces/")
(require 'delete-nl-spaces)

;; AUTOCOMPLETE SETTINGS
;;(add-hook 'after-init-hook 'global-company-mode) ; company pkg
(ac-config-default) ; auto-complete pkg

;; SYNTAX CHECKER
(global-flycheck-mode) ; flycheck pkg

;;; ENABLING IDO
;;; this comes by default with emacs
;;(require 'ido)
;;(ido-mode t)

;; enable helm
;;(require 'helm-config)
;;(helm-mode 1)

;;; NEOTREE
(add-to-list 'load-path "~/emacs-pkgs/emacs-neotree/")
(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "<C-escape>") 'neotree-toggle)

;;; ENABLING WEB-MODE
(add-to-list 'load-path "~/emacs-pkgs/web-mode/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

;;; MARKDOWN MODE
(add-to-list 'load-path "~/emacs-pkgs/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;; JS2-MODE
(add-to-list 'load-path "~/emacs-pkgs/js2-mode/")
(require 'js2-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;;(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;;; SWEWER-MODE
;;; used by ac-js2, so just adding load path
;; I'm not using this package.
(add-to-list 'load-path "~/emacs-pkgs/skewer-mode/")

;;; SIMPLE-HTTPD
;;; Dependency of ac-js2
(add-to-list 'load-path "~/emacs-pkgs/emacs-web-server/")
(setq httpd-root "~/webdev/emacs-webserver")
;;;(httpd-start)

;;; AC-JS2
;;; it works in conjunction with autocomplete and js2-mode
(add-to-list 'load-path "~/emacs-pkgs/ac-js2/")
(require 'ac-js2)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;;; SMARTPARENS
(add-to-list 'load-path "~/emacs-pkgs/smartparens/")
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode +1)

;;; EMMET MODE
;; used or quick html typing
(add-to-list 'load-path "~/emacs-pkgs/emmet-mode/")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;;; INITIAL EMACS FRAME SIZE
(setq initial-frame-alist
      '(
        (width . 190) ; character
        (height . 58) ; lines
        ))

;;; DISABLE TOOLBAR AND SCROLLBAR
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; FIPLR SETTINGS
;;; used as a fuzzy finder of files, folders in project
;;; (** the root project is marked by a dummy file .project **)
;;; (** I customised for rails projects, ignoring, .keep, tmp/, log/ **)
;;;   1. M-x fiplr-find-file RET
;;;   2. M-x fiplr-find-directory RET
;;;   3. M-x fiplr-clear-cache RET
(global-set-key (kbd "C-x f") 'fiplr-find-file) ; binding find-file to key
(setq fiplr-root-markers '(".project"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" "tmp" "log"))
                            (files ("*.jpg" "*.png" "*.zip" ".keep" "*~"))))

;;; FLYSPELL SETTINGS
;;: flyspell is bundled by default in emacs so no need to install it or require

(setq flyspell-issue-message-flg nil)
;(add-hook 'enh-ruby-mode-hook
(add-hook 'ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))
;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)

;;; KEY MAPPINGS
; switch windows (C-x o)
(global-set-key (kbd "<C-tab>") 'other-window)
;;; init ends here


(set-face-bold-p 'bold nil)

;;; CUSTOM VARS
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(js2-basic-offset 2))
