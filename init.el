;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (project-explorer go-autocomplete auto-complete exec-path-from-shell go-eldoc color-theme-sanityinc-solarized go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 行数
;;(global-linum-mode t)

;; 根据是否是 GUI 程序加载主题
;; Terminal 内不加载，使用 Terminal 的主题
;; GUI 程序加载主题
(if (display-graphic-p)
    ;; Do any keybindings and theme setup here
    (load-theme 'sanityinc-solarized-dark t)
  )

(setenv "GOPATH" "/Users/huangou/Go")

(add-to-list 'exec-path "/Users/huangou/Go/bin")

(defun go-mode-setup ()
 (setq compile-command "go build -v && go test -v && go vet")
 (define-key (current-local-map) "\C-c\C-c" 'compile)
 (go-eldoc-setup)
 (setq gofmt-command "goimports")
 (add-hook 'before-save-hook 'gofmt-before-save)
 (local-set-key (kbd "M-.") 'godef-jump)
 (local-set-key (kbd "M-,") 'pop-tag-mark))
(add-hook 'go-mode-hook 'go-mode-setup)

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

;;Project Explorer
(require 'project-explorer)
(global-set-key (kbd "M-e") 'project-explorer-toggle)

(provide 'init)
;;; init.el ends here
