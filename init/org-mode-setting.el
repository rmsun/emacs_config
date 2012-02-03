;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffer
(setq-default org-enforce-todo-dependencies t)
;;support for beamer.
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("beamer"
               "\\documentclass[11pt]{beamer}\n\\usepackage[utf8]{inputenc}\n\\usepackage[T1]{fontenc}\n\\usepackage{hyperref}\n\\usepackage{verbatim}\n"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}\\frametitle{%s}" "\\end{frame}"
                "\\begin{frame}\\frametitle{%s}" "\\end{frame}")))
;;add publish projects
(setq org-publish-project-alist
      '(("orgfiles"
         :base-directory "~/notes/org/orgs"
         :base-extension "org"
         :publishing-directory "~/notes/org/publish/htmls"
         :publishing-function org-publish-org-to-html
         :auto-sitemap t
         :auto-index t
         :make-index t
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :exclude "PrivatePage.org"   ;; regexp
         :headline-levels 3
         :section-numbers nil
         :table-of-contents nil
         ;;         :style "<link rel=\"stylesheet\"
         ;;                     href=\"../other/mystyle.css\" type=\"text/css\"/>"
         :html-preamble t)
        
        ("images"
         :base-directory "~/notes/org/images/"
         :base-extension "jpg\\|gif\\|png"
         ;;:publishing-directory "/ssh:user@host:~/html/images/"
         :publishing-directory "~/notes/org/publish/images"
         :publishing-function org-publish-attachment)
        
        ("other"
         :base-directory "~/notes/org/others"
         :base-extension "css\\|el"
         :publishing-directory "~/notes/org/publish/others"
         :publishing-function org-publish-attachment)
        ("website" :components ("orgfiles" "images" "other"))))
;; use ido-like completion
(setq org-completion-use-ido t)
;; for yasniper
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))
;;(setq org-footnote-define-inline t)
;; for C-c C-j 
;;(setq org-goto-auto-isearch nil)