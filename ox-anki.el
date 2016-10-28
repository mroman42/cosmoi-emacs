;; This code is a derivative of "ox-anki.el", written by Vitalie Spinu.
;; Author: Mario Roman (M42)

;;; ox-anki.el --- Org Exporter to Anki Flashcards
;;
;; Filename: ox-anki.el
;; Author: Vitalie Spinu
;; Maintainer: Vitalie Spinu
;; Copyright (C) 2014, Vitalie Spinu, all rights reserved
;; Version: 1.0
;; URL: https://github.com/vitoshka/ox-anki
(require 'ox)
(require 'ox-html)

(org-export-define-derived-backend 'anki 'html
  :translate-alist '((headline . org-anki-headline)
                     (template . nil)
                     (inner-template . nil))
  :menu-entry
  '(?a "Export to Anki"
       ((?f "As tab-separated File" org-anki-export-to-file)
	(?a "Export all in separated files" org-anki-export-all))))

(defun org-anki-headline (headline contents info)
  "Transcode a HEADLINE element from Org to Anki csv format.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information.

High level headlines up to `org-export-headline-levels' (see also
`org-export-low-level-p') are merged into an Anki question."
  ;; Simplified version of `org-html-headline'.
  (setq contents (or contents ""))

  (let ((level (org-export-get-relative-level headline info))
        (numberedp (org-export-numbered-headline-p headline info))
        ;; Create the headline text.
        (full-text
         (substring-no-properties
          (replace-regexp-in-string
           "\n" "" (org-export-data (org-element-property :title headline) info)))))
    (cond
     ;; Case 1: This is a footnote section: ignore it.
     ((org-element-property :footnote-section-p headline) nil)
     ;; Case 2. This is a deep sub-tree: export it as a list item.
     ((org-export-low-level-p headline info)
      ;; Build the real contents of the sub-tree.
      (let* ((type (if numberedp 'ordered 'unordered))
     	     (itemized-body (org-html-format-list-item
     			     contents type nil info nil full-text)))
     	(concat
     	 (and (org-export-first-sibling-p headline info)
     	      (org-html-begin-plain-list type))
     	 itemized-body
     	 (and (org-export-last-sibling-p headline info)
     	      (org-html-end-plain-list type)))))
     ;; Case 3. Standard headline.  Export it as a section.
     (t
      (let* ((last-child-level (plist-get info :last-child-level))
             (last-child (or (null last-child-level)
                             (eq last-child-level level))))
        (unless last-child-level
          (plist-put info :last-child-level level))
        (let ((front (concat full-text "\t")))
          (when (= level 1)
            (plist-put info :last-child-level nil))
          ;; all this mambo jambo is for replilcation of parent headlines across
          ;; the last-child headline that contains the answer
          (if last-child
              (propertize
               (concat (when (= level 1)
                         (concat (org-element-property :ID headline) ""))
                       front
                       (replace-regexp-in-string "\n+" "<br>" contents)
                       (when (not (= level 1)) "!@@!"))
               :aid (org-element-property :ID headline))
            (mapconcat (lambda (x)
                         (replace-regexp-in-string
                          "\n+" "<br>"
                          (if (= level 1)
                              (concat (get-text-property (1- (length x)) :aid x) "" front x)
                            (propertize (concat front x)
                                        :aid (get-text-property 1 :aid x)))))
                       (split-string contents "!@@!\n*" t)
                       "\n"))))))))


;;;###autoload
(defun org-anki-export-to-file
  (&optional async subtreep visible-only ext-plist)
  (interactive)
  (let* ((file (org-export-output-file-name ".anki.csv" subtreep))
	 (org-export-coding-system org-html-coding-system))
    (org-export-to-file 'anki file
      async subtreep visible-only 'body-only ext-plist)))

;; Export top-level headings to a separate file
;; Taken from: http://emacs.stackexchange.com/a/2260/12208
(defun org-anki-export-all
    (&optional async subtreep visible-only ext-plist)
  "Export all subtrees that are *not* tagged with :noexport: to
separate files.
Note that subtrees must have the :EXPORT_FILE_NAME: property set
to a unique value for this to work properly."
  (interactive)
  (let ((fn 'org-anki-export-to-file))
    (save-excursion
      (set-mark (point-min))
      (goto-char (point-max))
      (org-map-entries (lambda () (funcall fn nil t)) "-noexport" 'region-start-level))))

(provide 'ox-anki)
