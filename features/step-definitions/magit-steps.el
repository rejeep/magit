(Given "^a git project$"
  (lambda ()
    (shell-command (format "cd %s && git init" magit-git-project-path))))

(When "^I open magit status$"
  (lambda ()
    (magit-status magit-git-project-path)))

(And "^I create file \"\\([^\"]+\\)\":$"
  (lambda (file content)
    (f-write (f-expand file magit-git-project-path) content)))

(When "^I go to file \"\\([^\"]+\\)\"$"
  (lambda (file)
    (goto-char (point-min))
    (re-search-forward file)))
