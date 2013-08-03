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

(After
 (let ((git-dir (f-expand ".git" magit-git-project-path)))
   (when (f-dir? git-dir)
     (f-delete git-dir t)))
 (let ((ignores '(".gitkeep")))
   (-map
    (lambda (file)
      (unless (--any? (equal it (f-filename file)) ignores)
        (f-delete file t)))
    (f-files magit-git-project-path))))
