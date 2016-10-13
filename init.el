(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/use-package/")
(require 'use-package)
(setq use-package-always-ensure t)

(defun my-asm-mode-hook ()
  (local-set-key (kbd "TAB") 'self-insert-command)
  (setq indent-line-function nil)
  (setq tab-always-indent (default-value 'tab-always-indent)))
(add-hook 'asm-mode-hook 'my-asm-mode-hook)

(use-package lua-mode
  :mode ("\\.lua\\'" . lua-mode)
  :interpreter ("lua" . lua-mode)
  :config (setq lua-indent-level 4))

(use-package web-mode
  :mode (("\\.css\\'" . web-mode)
         ("\\.scss\\'" . web-mode)
         ("\\.hbs\\'" . web-mode)
         ("\\.html\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.json\\'" . web-mode)
         ("\\.xml\\'" . web-mode))
  :config ((web-mode-use-tabs)
           (setq web-mode-enable-auto-quoting t)
           (setq web-mode-enable-auto-pairing t)
           (setq web-mode-enable-auto-closing t)
           (setq web-mode-style-padding 4)
           (setq web-mode-script-padding 4)
           (setq web-mode-block-padding 4)
           (setq web-mode-markup-indent-offset 4)
           (setq web-mode-css-indent-offset 4)
           (setq web-mode-code-indent-offset 4)))

(use-package auto-complete
  :config (ac-config-default))

(use-package undo-tree
  :config (global-undo-tree-mode))

(electric-pair-mode t)

(require 'whitespace)
(setq whitespace-style '(face lines-tail tabs tab-mark))
(set-face-background 'whitespace-line nil)
(set-face-background 'whitespace-tab nil)
(set-face-foreground 'whitespace-tab "cyan")
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\xAC ?\t] [?\t])))
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default c-basic-offset 4
              tab-width 4)
(setq indent-tabs-mode t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq backup-by-copying t)
(setq delete-old-versions t)

(custom-set-variables
 '(custom-enabled-themes (quote (adwaita)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 '(default ((t (:family "Roboto Mono" :foundry "pyrs" :slant normal :weight normal :height 90 :width normal)))))
