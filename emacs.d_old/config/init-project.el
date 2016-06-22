
;; http://batsov.com/projectile/
(setq fiplr-root-markers '(".git" ".svn" "*.DS_Store"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.o" ".obj" "*.swp" "*.hg" ".pyc" ".*" "*.so" "*.dylib"))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)




(provide 'init-project)
