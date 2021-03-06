
;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

;; package 管理の設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; 自動でインストールするpackageの設定
(require 'cl)
(defvar installing-package-list
  '(
  ;; package list
  ruby-mode
  rspec-mode
  coffee-mode
  haml-mode
  sass-mode
  magit
  auto-complete
  helm
  helm-descbinds
  ))
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
     (package-refresh-contents)
     (dolist (pkg not-installed)
       (package-install pkg))))


;; backupファイルを ~/.emacs.d/backup以下に配置する
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))
(setq delete-auto-save-files t)

;; 文字コードをUTF-8にする
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)
;; menu-barを非表示
(menu-bar-mode 0)

;; paren-node 対応する括弧を強調して表示
(setq show-paren-delay 0)
(show-paren-mode t)

;; タブ幅を調整
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))



(put 'upcase-region 'disabled nil)


;; helmの設定
(require 'helm-config)
(require 'helm-descbinds)
(helm-mode 1)
(helm-descbinds-mode)
;; C-x b で helm-for-files
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;; helm-find-file ではTABでファイル名をそのまま補完する(TABの代わりはC-;
;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;(define-key helm-find-files-map (kbd "C-;") 'helm-select-action)
;; TAB押した場合にファイルが存在しない場合は何もしない
;(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;  "Execute command only if CANDIDATE exists"
;  (when (file-exists-p candidate)
;    ad-do-it))
