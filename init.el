;; MELPA configuration
;; Taken from http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

;; Org-babel init file
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-math-abbrev-prefix "ç")
 '(LaTeX-math-list
   (quote
    (("=" "cong" "" nil)
     ("C-r" "longrightarrow" "" nil)
     ("<right>" "longrightarrow" "" nil)
     ("<left>" "longleftarrow" "" nil)
     ("C-<right>" "Longrightarrow" "" nil)
     ("C-<left>" "Longleftarrow" "" nil))))
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(delete-selection-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t)
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
     ("colorlinks=true" "hyperref" nil))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (haskell-snippets yasnippet htmlize ox-reveal flycheck use-package auctex company-math rainbow-mode markdown-mode ox-twbs python-mode camcorder zenburn-theme crux haml-mode elmacro magit hlint-refactor multi-term org fsharp-mode haskell-mode)))
 '(server-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "dark gray"))))
 '(haskell-constructor-face ((t (:inherit font-lock-type-face))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-doc-face))))
 '(haskell-quasi-quote-face ((t (:inherit font-lock-doc-face))))
 '(org-level-1 ((t (:inherit outline-1 :weight bold))))
 '(org-level-3 ((t (:inherit outline-3 :weight normal))))
 '(org-level-5 ((t (:inherit outline-5 :weight normal)))))


;; F-Sharp mode
(require 'fsharp-mode)


;; Evaluating Lisp in place
;; From: http://emacsredux.com/blog/2013/06/21/eval-and-replace/
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


;; Beamer class
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))





;; HAML mode
(require 'haml-mode)
(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; Opens TODO with f6
(global-set-key (kbd "<f6>")
		(lambda() (interactive) 
		   (find-file "~/org/todo.org")
		   ))

;; Opens Magit with f9
(global-set-key (kbd "<f9>") 'magit-status)

;; Org-mode
(setq org-agenda-files (list "~/org/todo.org"))
(setq org-export-coding-system 'utf-8)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Zenburn theme
;;(load-theme 'zenburn t)

;; Latex zooming
;; with C-x C-+
(defun update-org-latex-fragment-scale ()
  (let ((text-scale-factor (expt text-scale-mode-step text-scale-mode-amount)))
    (plist-put org-format-latex-options :scale (* 1.2 text-scale-factor)))
)
(add-hook 'text-scale-mode-hook 'update-org-latex-fragment-scale)



;; Latex-math-mode
(require 'latex)

;; Tikz-cd
(add-to-list 'org-latex-packages-alist
             '("" "tikz" t))

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

(setq org-latex-create-formula-image-program 'imagemagick)

;; Flymake
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; What face am I using?
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; Org-Reveal
;; Taken from http://cestlaz.github.io/posts/using-emacs-11-reveal/#.V8rkPdH7CkA
(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)


;; Yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(require 'haskell-snippets)
