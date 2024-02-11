;; (load "/home/nix/.config/home-manager/emacs/sanemacs.el" nil t)
;;(load "/home/nix/.dotfiles/home/emacs/sanemacs.el" nil t)

(set-frame-font "iosevka 12" nil t)

(transient-mark-mode 1)

;; auto refresh buffers
(global-auto-revert-mode 1)

;; also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(eval-after-load "org"
  '(require 'ox-md nil t))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-odd-levels-only t)


(require 'evil)
(evil-mode 1)

;;(setq
;; org-default-notes-file "/home/nix/documents/org-docs/default.org"
;; initial-buffer-choice  org-default-notes-file)
;;
;;(require 'org)
;;(setq initial-major-mode 'org-mode)
