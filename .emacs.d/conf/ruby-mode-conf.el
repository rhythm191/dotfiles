# ruby-mode config file

# indent width == 2
(add-hook 'ruby-mode-hook
    '(lambda ()
         (setq indent-tabs-mode nil)
         (setq ruby-indent-level 2)
))

# indent when method paramater is object
(setq ruby-deep-indent-paren-style nil)
