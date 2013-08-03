(require 'f)

(defvar magit-support-path
  (f-dirname load-file-name))

(defvar magit-features-path
  (f-parent magit-support-path))

(defvar magit-root-path
  (f-parent magit-features-path))

(defvar magit-git-project-path
  (f-expand "git-project" magit-features-path))

(add-to-list 'load-path magit-root-path)

(require 'magit)
(require 'espuds)
(require 'ert)

(Before
 (--map
  (f-delete it t)
  (f-directories magit-git-project-path)))
