(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-math-abbrev-prefix "ç")
 '(anki-editor-break-consecutive-braces-in-latex t)
 '(anki-editor-create-decks t)
 '(anki-editor-use-math-jax t)
 '(beacon-mode t)
 '(custom-safe-themes
   '("3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "9240e71034689655a6c05c04063af2c90d0a831aa4e7ca24c8b6e29b5a2da946" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" default))
 '(default-input-method "Agda")
 '(electric-pair-mode t)
 '(engine-mode t)
 '(erc-autojoin-channels-alist
   '(("freenode.net" "#haskell" "#emacs" "#archlinux" "#latex" "#org-mode")) t)
 '(erc-autojoin-timing 'ident t)
 '(erc-fill-function 'erc-fill-static t)
 '(erc-fill-static-center 22 t)
 '(erc-hide-list '("JOIN" "PART" "QUIT") t)
 '(erc-lurker-hide-list '("JOIN" "PART" "QUIT") t)
 '(erc-lurker-threshold-time 43200 t)
 '(erc-prompt-for-nickserv-password nil t)
 '(erc-server-reconnect-attempts 5 t)
 '(erc-server-reconnect-timeout 3 t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save t)
 '(ido-mode 'both nil (ido))
 '(magit-subtree-arguments nil)
 '(org-contacts-files '("~/org/Contacts.org"))
 '(org-index-id "c83b0f04-85f3-4b4d-84f4-3020e06776b5")
 '(org-preview-latex-process-alist
   '((dvipng :programs
             ("latex" "dvipng")
             :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
             (1.0 . 1.0)
             :latex-compiler
             ("latex -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))
     (dvisvgm :programs
              ("latex" "dvisvgm")
              :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
              (1.7 . 1.5)
              :latex-compiler
              ("latex -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("dvisvgm %f -e -n -b min -c %S -o %O"))
     (imagemagick :programs
                  ("latex" "convert")
                  :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                  (1.0 . 1.0)
                  :latex-compiler
                  ("pdflatex -interaction nonstopmode -output-directory %o %f")
                  :image-converter
                  ("convert -density %D -trim -antialias %f -quality 100 %O"))))
 '(package-selected-packages
   '(outline-magic haskell-tng-mode magit-todos anki-editor anki-connect ranger deadgrep org-index olivetti olivetti-mode neotree doom-themes xah-fly-keys org-edna tuareg org-expiry writegood-mode ivy-bibtex org-download keyfreq mu4e org-mru-clock god-mode lean-mode redprl ace-windows beacon ac-math math-symbols-list exwm-edit desktop-environment org-contacts ob-ipython gap-mode all-the-icons ledger-mode ledger helpful org-noter interleave elfeed-goodies elfeed-org elfeed calfw-org pdf-tools base16-theme dracula-theme centered-window centered-window-mode nord-theme dashboard anzu smartparens-config volatile-highlights golden-ratio rainbow-delimiters better-defaults spacemacs-theme spaceline evil mediawiki visual-regexp multiple-cursors flycheck-haskell-multi hs-lint flycheck-haskell flymake-haskell-multi flymake-hlint ox-gfm restart-emacs org-pomodoro which-key try counsel counsel-projectile mastodon sx helm-google calfw smex graphviz-dot-mode google-translate-default-ui ob-translate define-word cdlatex org-gcal elpy intero company-auctex ess ob-sagemath sage-mode ob-C ox-latex org-page sage-shell-mode org-drill-table idris-mode org-page engine-mode haskell-snippets yasnippet htmlize ox-reveal flycheck use-package auctex company-math rainbow-mode markdown-mode ox-twbs python-mode camcorder zenburn-theme crux haml-mode elmacro magit hlint-refactor multi-term fsharp-mode haskell-mode))
 '(safe-local-variable-values
   '((eval set-face-attribute 'font-lock-comment-face nil :background nil)
     (eval setq org-tags-exclude-from-inheritance
           '("post" "note"))
     (org-latex-pdf-process "pdflatex --shell-escape -interaction nonstopmode %f" "bibtex %b" "pdflatex --shell-escape -interaction nonstopmode %f")
     (org-download-image-dir . "~/actegory/org/images")
     (eval let
           ((unimath-topdir
             (expand-file-name
              (locate-dominating-file buffer-file-name "UniMath"))))
           (setq fill-column 100)
           (make-local-variable 'coq-use-project-file)
           (setq coq-use-project-file nil)
           (make-local-variable 'coq-prog-args)
           (setq coq-prog-args
                 `("-emacs" "-noinit" "-indices-matter" "-type-in-type" "-w" "-notation-overridden" "-Q" ,(concat unimath-topdir "UniMath")
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
     (org-download-image-dir . "~/Dropbox/orgzly/images")
     (org-log-reschedule)
     (org-tags-column . -119)
     (org-tags-column . -120)
     (org-tags-column . -130)
     (eval setq org-html-postamble-format
           '(("en" "<div id=\"footer\"><p class=\"postamble\">Last edited %d. Written by %c</p></div>")))
     (eval setq org-tags-exclude-from-inheritance
           '("post"))
     (eval defun cosmoi/publish nil
           (interactive)
           (org-map-entries
            (lambda nil
              (if
                  (org-entry-get
                   (point)
                   "EXPORT_FILE_NAME")
                  (funcall 'org-html-export-to-html nil t)))
            "-noexport" nil))
     (org-latex-pdf-process "xelatex --shell-escape -interaction nonstopmode %f" "bibtex %b" "xelatex --shell-escape -interaction nonstopmode %f")
     (org-latex-pdf-process "xelatex -interaction nonstopmode %f" "bibtex %b" "xelatex -interaction nonstopmode %f")
     (org-latex-default-packages-alist
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
      ("" "capt-of" nil))
     (org-latex-packages-alist)
     (org-latex-pdf-process "xelatex -interaction nonstopmode %f" "bibtex" "xelatex -interaction nonstopmode %f")
     (eval setq org-latex-default-packages-alist
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
 '(fixed-pitch ((t (:family "unspecified"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "dark gray"))))
 '(fringe ((t (:background "#292b2e"))))
 '(haskell-constructor-face ((t (:inherit font-lock-type-face))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-doc-face))))
 '(haskell-quasi-quote-face ((t (:inherit font-lock-doc-face))))
 '(header-line ((t (:background "default")))))
