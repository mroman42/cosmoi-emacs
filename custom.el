(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" default))
 '(electric-pair-mode t)
 '(engine-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save t)
 '(ido-mode 'both nil (ido))
 '(org-agenda-files '("~/Dropbox/orgzly/Tasks.org" "~/org/wiki/tasks.org"))
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "grffile" t)
     ("" "longtable" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "amssymb" t)
     ("" "capt-of" nil)
     ("colorlinks=true" "hyperref" nil)))
 '(package-selected-packages
   '(calfw-org pdf-tools base16-theme dracula-theme centered-window centered-window-mode nord-theme dashboard anzu avy smartparens-config smartparens volatile-highlights golden-ratio rainbow-delimiters better-defaults spacemacs-theme spaceline evil mediawiki visual-regexp polymode multiple-cursors flycheck-haskell-multi hs-lint flycheck-haskell flymake-haskell-multi flymake-hlint ox-gfm yankpad restart-emacs org-pomodoro which-key try counsel counsel-projectile projectile mastodon sx helm-google calfw smex graphviz-dot-mode google-translate-default-ui ob-translate define-word org-ref cdlatex org-gcal ein elpy intero company-auctex company ess ob-sagemath sage-mode ob-C ox-latex org-page sage-shell-mode org-plus-contrib org-drill-table idris-mode org-page engine-mode haskell-snippets yasnippet htmlize ox-reveal flycheck use-package auctex company-math rainbow-mode markdown-mode ox-twbs python-mode camcorder zenburn-theme crux haml-mode elmacro magit hlint-refactor multi-term org fsharp-mode haskell-mode))
 '(safe-local-variable-values
   '((eval setq org-latex-default-packages-alist
           (cons
            '("mathletters" "ucs" nil)
            org-latex-default-packages-alist))
     (org-latex-inputenc-alist
      ("utf8" . "utf8x"))
     (rainbow-delimiters-mode)
     (hunspell-local-dictionary . "english")
     (eval let
           ((unimath-topdir
             (expand-file-name
              (locate-dominating-file buffer-file-name "UniMath"))))
           (setq fill-column 100)
           (make-local-variable 'coq-use-project-file)
           (setq coq-use-project-file nil)
           (make-local-variable 'coq-prog-args)
           (setq coq-prog-args
                 `("-emacs" "-indices-matter" "-type-in-type" "-Q" ,(concat unimath-topdir "UniMath")
                   "UniMath"))
           (make-local-variable 'coq-prog-name)
           (setq coq-prog-name
                 (concat unimath-topdir "sub/coq/bin/coqtop"))
           (make-local-variable 'before-save-hook)
           (add-hook 'before-save-hook 'delete-trailing-whitespace)
           (modify-syntax-entry 39 "w")
           (modify-syntax-entry 95 "w")
           (if
               (not
                (memq 'agda-input features))
               (load
                (concat unimath-topdir "emacs/agda/agda-input")))
           (if
               (not
                (member
                 '("chimney" "╝")
                 agda-input-user-translations))
               (progn
                 (setq agda-input-user-translations
                       (cons
                        '("chimney" "╝")
                        agda-input-user-translations))
                 (setq agda-input-user-translations
                       (cons
                        '("==>" "⟹")
                        agda-input-user-translations))
                 (agda-input-setup)))
           (set-input-method "Agda"))
     (encoding . utf-8)
     (eval text-scale-increase 1)
     (eval text-scale-adjust))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "dark gray"))))
 '(fringe ((t (:background "#292b2e"))))
 '(haskell-constructor-face ((t (:inherit font-lock-type-face))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-doc-face))))
 '(haskell-quasi-quote-face ((t (:inherit font-lock-doc-face)))))
