;; .git がディレクトリにあったらeggを起動
(when (executable-find "git")
  (require 'egg nil t))
