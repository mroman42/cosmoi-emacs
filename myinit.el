(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq m42/wiki-file "~/Dropbox/orgzly/wiki.org")
(setq m42/math-file "~/projects/math/notes.org")
(setq m42/init-file "~/.emacs.d/myinit.org")
(setq m42/agenda-file "~/Dropbox/orgzly/tasks.org")

(global-set-key (kbd "<f5>") (lambda() (interactive) (find-file m42/wiki-file)))
(global-set-key (kbd "<f6>") (lambda() (interactive) (find-file m42/math-file)))
(global-set-key (kbd "<f8>") (lambda() (interactive) (find-file m42/init-file)))
(global-set-key (kbd "<f9>") (lambda() (interactive) (find-file m42/agenda-file)))

(setq inhibit-startup-screen t)
(setq initial-buffer-choice m42/wiki-file)

(setq-default word-wrap 1)

(global-set-key (kbd "C-c s") 'eshell)

(use-package markdown-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; (add-hook 'haskell-mode-hook 'intero-mode)

(require 'ess-site)

(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-python-command "python2")

(require 'ein)

(load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(use-package sage-shell-mode
  :ensure t)

(setq sage-shell:use-prompt-toolkit t)

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'eval-and-replace)

(use-package haml-mode
  :ensure t)
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; (use-package company
;;   :ensure t
;;   :config (progn
;; 	    (global-company-mode 1)))

;; (use-package company-auctex
;;   :ensure t
;;   :config (progn
;;             (defun company-auctex-labels (command &optional arg &rest ignored)
;; 	      "company-auctex-labels backend"
;; 	      (interactive (list 'interactive))
;; 	      (case command
;;                 (interactive (company-begin-backend 'company-auctex-labels))
;;                 (prefix (company-auctex-prefix "\\\\.*ref{\\([^}]*\\)\\="))
;;                 (candidates (company-auctex-label-candidates arg))))

;;             (add-to-list 'company-backends
;;                          '(company-auctex-macros
;;                            company-auctex-environments))

;;             (add-to-list 'company-backends #'company-auctex-labels)
;;             (add-to-list 'company-backends #'company-auctex-bibs)))

(setq org-directory "~/org")
(setq org-agenda-files (list m42/agenda-file))
(setq org-archive-location "~/org/archive.org ::* From %s")

(setq org-export-coding-system 'utf-8)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(set-face-attribute 'org-level-1 nil
  :inherit 'outline-1
  :foreground "LightGoldenrod1"
  :weight 'bold
  :height 1.05)

(set-face-attribute 'org-level-2 nil
  :inherit 'outline-1
  :weight 'semi-bold
  :height 1.0)

(set-face-attribute 'org-level-3 nil 
  :inherit 'outline-3 
  :weight 'bold)

(set-face-attribute 'org-level-4 nil
  :inherit 'outline-3 
  :foreground "light steel blue" 
  :weight 'normal)

(set-face-attribute 'org-level-5 nil
  :inherit 'outline-4 
  :foreground "thistle" 
  :weight 'normal)

(set-face-attribute 'org-level-6 nil
  :inherit 'outline-4)

(set-face-attribute 'org-level-8 nil
  :inherit 'outline-7)

(set-face-attribute 'org-link nil
  :inherit 'link
  :foreground "SlateGray1"
  :underline nil)

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)

(require 'ob-C)
(org-babel-do-load-languages
 'org-babel-load-languages
  '( (ruby . t)
     (haskell . t)
     (C . t)
     (emacs-lisp . t)
     (ditaa . t)
     (R . t)
     (sagemath . t)
   ))

;; Ob-sagemath supports only evaluating with a session.
(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

;; C-c c for asynchronous evaluating (only for SageMath code blocks).
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))

;; Do not confirm before evaluation
(setq org-confirm-babel-evaluate nil)

;; Do not evaluate code blocks when exporting.
(setq org-export-babel-evaluate nil)

;; Show images when opening a file.
(setq org-startup-with-inline-images t)

;; Show images after evaluating code blocks.
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

(defadvice org-babel-haskell-initiate-session
  (around org-babel-haskell-initiate-session-advice)
  (let* ((buff (get-buffer "*haskell*"))
         (proc (if buff (get-buffer-process buff)))
         (type (cdr (assoc :result-type 'params)))
         (haskell-program-name
          (if (equal type 'output) "runhaskell-ob" "ghci")))
    (if proc (kill-process proc))
    (sit-for 0)
    (if buff (kill-buffer buff))
    ad-do-it))

(ad-activate 'org-babel-haskell-initiate-session)

(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_9.jar")

(setq org-capture-templates
      (quote (
	      ("x" "org-protocol" entry (file+headline "~/projects/wiki/wiki.org" "Inbox")
	       "** %c %^g" :kill-buffer t :prepend t)
	      ("i" "idea" entry (file+olp "~/projects/wiki/wiki.org" "Ideas" "Fáciles")
	       "*** %?\n%U\n" :kill-buffer t :prepend t)
	     )))

(defun m42/export-html-if-agenda()
  "Auto exports an html file"
  (when (equal buffer-file-name "/home/mario/Dropbox/orgzly/tasks.org")
    (org-twbs-export-to-html)))

(add-hook 'after-save-hook 'm42/export-html-if-agenda)

(global-set-key (kbd "C-ñ") 'org-toggle-latex-fragment)

(setq LaTeX-math-abbrev-prefix "ç")
(setq LaTeX-math-list
  (quote
    ((";" "mathbb{" "" nil)
     ("=" "cong" "" nil)
     ("<right>" "longrightarrow" "" nil)
     ("<left>" "longleftarrow" "" nil)
     ("C-<right>" "Longrightarrow" "" nil)
     ("C-<left>" "Longleftarrow" "" nil)
     ("^" "widehat" "" nil)
     ("~" "widetilde" "" nil)
     ("'" "\partial" "" nil)
     ("0" "varnothing" "" nil)
     ("C-(" "left(" "" nil)
     ("C-)" "right)" "" nil)
     )))

(require 'latex)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'org-mode-hook 'LaTeX-math-mode)

(add-to-list 'org-latex-packages-alist '("" "tikz" t))
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
(setq org-latex-create-formula-image-program 'imagemagick)

(defun update-org-latex-fragment-scale ()
  (let ((text-scale-factor (expt text-scale-mode-step text-scale-mode-amount)))
    (plist-put org-format-latex-options :scale (* 1.2 text-scale-factor)))
)
(add-hook 'text-scale-mode-hook 'update-org-latex-fragment-scale)

(setq pinta-dir "./images/")
(setq pinta-dimension "300x300")

(defun org-pinta (filename)
  "Creates an image using pinta"
  (interactive "sImage name: ")

  (let ((file (concat pinta-dir "/" filename ".png")))
    ; creates the image, opens pinta
    (shell-command (concat "mkdir -p $(dirname " file ") && touch " file))
    (shell-command (concat "convert -size " pinta-dimension " xc:white png24:" file))
    (shell-command (concat "pinta " file))

    ; inserts the image in the current buffer
    (insert "#+begin_center")
    (newline)
    (insert "#+attr_latex: :width 50px")
    (newline)
    (insert (concat "[[" file "]]"))
    (newline)
    (insert "#+end_center")
  )
)

(use-package yasnippet
  :ensure t
  :init (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
  :config (yas-global-mode 1)
  :bind (("<C-dead-grave>" . yas-insert-snippet))
  )

(use-package haskell-snippets
  :ensure t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(use-package org-page
  :ensure t)
(setq op/repository-directory "~/projects/m42.github.io/")
(setq op/site-domain "http://m42.github.io/")

(setq op/site-domain "http://m42.github.io/")
(setq op/site-main-title "Mario Román")
(setq op/site-sub-title "M42 - mromang08@gmail.com")
(setq op/personal-github-link "https://github.com/m42")

(setq op/category-config-alist
   '(("blog" 
      :show-meta t 
      :show-comment nil 
      :uri-generator op/generate-uri 
      :uri-template "/blog/%y/%m/%d/%t/" 
      :sort-by :date 
      :category-index t)
     ("index"
      :show-meta nil 
      :show-comment nil 
      :uri-generator op/generate-uri 
      :uri-template "/" 
      :sort-by :date 
      :category-index nil)
     ("about"
      :show-meta nil 
      :show-comment nil 
      :uri-generator op/generate-uri 
      :uri-template "/about/" 
      :sort-by :date 
      :category-index nil)))

(use-package tex
  :ensure auctex)

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  )

;(load-file "~/.emacs.d/dict-replace.el")
;(global-set-key (kbd "<f5>") 'dict-translate)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package engine-mode
  :ensure t)

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")
(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")
(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")
(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")
(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(engine-mode t)
