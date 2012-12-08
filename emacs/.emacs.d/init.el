
;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをｻﾌﾞディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

;; backupファイルを ~/.emacs.d/backup以下に配置する
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))
(setq delete-auto-save-files t)

;; (install-elisp)
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定
  (setq auto-install-directory "~/.emacs.d/elisp")
  ;; EmacsWikiに登録されている elispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

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
