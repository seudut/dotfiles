
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'package)

(setq package-archives '(("mepla" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
