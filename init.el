(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defun my-lua-mode-hook ()
  "Hook for lua-mode."
  (setq lua-indent-level 4))
(add-hook 'lua-mode-hook 'my-lua-mode-hook)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hook for web-mode."
  (web-mode-use-tabs)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-style-padding 4)
  (setq web-mode-script-padding 4)
  (setq web-mode-block-padding 4)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(add-hook 'local-write-file-hooks
  '(lambda () (delete-trailing-whitespace) nil))

(require 'auto-complete-config)
(ac-config-default)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'whitespace)
(setq whitespace-style '(face lines-tail tabs tab-mark))
(set-face-background 'whitespace-line nil)
(set-face-background 'whitespace-tab nil)
(set-face-foreground 'whitespace-tab "cyan")
(setq whitespace-display-mappings
  '((tab-mark ?\t [?\xAC ?\t] [?\t])))
(global-whitespace-mode t)

(setq-default c-basic-offset 4
  tab-width 4)
(setq indent-tabs-mode t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t)

(electric-pair-mode t)
