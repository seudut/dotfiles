

(setq fiplr-root-markers '(".git" ".svn" "*.DS_Store"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.o" ".obj" "*.swp" "*.hg" ".pyc" ".*" ))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)



(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)


(require 'projectile-speedbar)

(provide 'init-project)
