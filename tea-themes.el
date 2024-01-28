;;; tea-themes.el --- A custom theme  -*- lexical-binding: t; -*-
;; Copyright (C) 2024 Tilman Andre Mix
;; -------------------------------------------------------------------
;; Authors: Colin McLear
;; -------------------------------------------------------------------
;; URL: https://github.com/mclear-tools/lambda-themes
;; -------------------------------------------------------------------
;; Created: 2021-03-16
;; Version: 0.1
;; Package-Requires: ((emacs "25.1"))
;; -------------------------------------------------------------------
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the BSD Zero Clause License
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://opensource.org/license/0bsd/>
;; -------------------------------------------------------------------
;;; Commentary:
;; Tea-Theme provides a simple theme for GNU EMacs
;; -------------------------------------------------------------------

;;; Code:

;;;; Requirements
(eval-when-compile
  (require 'cl-macs))

(unless (>= emacs-major-version 25)
  (error "Required GNU Emacs major version 25 or later"))

(defcustom tea-themes-italic-comments t
  "If t, use italics for comments."
  :type 'boolean
  :group 'tea-themes)

(defcustom tea-themes-italic-keywords t
  "If t, use italics for keywords."
  :type 'boolean
  :group 'tea-themes)

(defcustom tea-themes-custom-colors nil
  "Set custom colors for the-themes."
  :type 'alist
  :group 'tea-themes)

;;; Define Tea Faces:
(defgroup tea-themes nil
  "Faces and colors for tea-themes."
  :group 'faces)

(defface tea-bg nil "Background face for tea-themes." :group 'faces)
(defface tea-fg nil "Foreground face for tea-themes." :group 'faces)

(defun tea-themes-create (variant theme-name)
  "Define theme colors for VARIANT and THEME-NAME."
  (let ((class '((class color) (min-colors 89)))
        (tea-bg (cond ((eq variant 'dark) "#282828") ((eq variant 'light) "#fbf1c7")))
        (tea-fg (cond ((eq variant 'dark) "#ebdbb2") ((eq variant 'light) "#3c3836"))))

    (cl-loop for (cvar . val) in tea-themes-custom-colors
             do (set cvar val))

    (custom-theme-set-faces
     theme-name
     `(default ((,class (:background ,tea-bg :foreground ,tea-fg))))
     `(cursor ((,class (:background ,tea-fg))))
     `(fringe ((,class (:background ,tea-bg :weight light))))
    )))

;;; Provide file
;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'tea-themes)
;;; tea-themes.el ends here
