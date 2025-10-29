;;; bossa-nova-theme.el --- Brazilian flag-inspired theme with deep backgrounds -*- lexical-binding: t -*-

;; Copyright (C) 2025 Henrique Marques
;; Author: Henrique Marques <hm2030master@proton.me>
;; URL: https://github.com/0xhenrique/bossa-nova-theme
;; Version: 0.1
;; Package-Requires: ((emacs "24.1"))
;; SPDX-License-Identifier: GPL-3.0-or-later

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Bossa Nova theme inspired by the Brazilian flag.
;;
;;; Code:

(defgroup bossa-nova-theme nil
  "Bossa Nova theme customization options."
  :group 'faces)

(defcustom bossa-nova-theme-variant 'green
  "Variant of the Bossa Nova theme to use.
Valid values are 'green or 'blue."
  :type '(choice (const :tag "Green variant" green)
                 (const :tag "Blue variant" blue))
  :group 'bossa-nova-theme)

(deftheme bossa-nova
  "Bossa Nova theme - Brazilian flag-inspired color scheme.")

;; Define color palettes for both variants
(let* ((variant bossa-nova-theme-variant)
       ;; Green variant palette
       (green-palette
        '((bg           . "#00080a")
          (bg+1         . "#002814")
          (bg+2         . "#003d1f")
          (bg+3         . "#005028")
          (bg+4         . "#006832")
          (bg-highlight . "#002814")
          (fg           . "#f5f5f5")
          (fg+1         . "#ffffff")
          (fg-dim       . "#b0b0b0")
          (yellow       . "#ffd700")
          (yellow-dim   . "#e6c200")
          (yellow-pale  . "#fff4b3")
          (green        . "#7cb342")
          (green-light  . "#aed581")
          (green-dim    . "#558b2f")
          (white        . "#ffffff")
          (red          . "#ff5252")
          (red-dim      . "#d32f2f")
          (blue         . "#42a5f5")
          (blue-dim     . "#1976d2")
          (cyan         . "#26c6da")
          (magenta      . "#ab47bc")))
       ;; Blue variant palette
       (blue-palette
        '((bg           . "#000412")
          (bg+1         . "#001a33")
          (bg+2         . "#002d4d")
          (bg+3         . "#004080")
          (bg+4         . "#0052a3")
          (bg-highlight . "#001a33")
          (fg           . "#f5f5f5")
          (fg+1         . "#ffffff")
          (fg-dim       . "#b0b0b0")
          (yellow       . "#ffd700")
          (yellow-dim   . "#e6c200")
          (yellow-pale  . "#fff4b3")
          (green        . "#72c275")
          (green-light  . "#81c784")
          (green-dim    . "#737373")
          (white        . "#ffffff")
          (red          . "#ff5252")
          (red-dim      . "#d32f2f")
          (blue         . "#64b5f6")
          (blue-dim     . "#1976d2")
          (cyan         . "#4dd0e1")
          (magenta      . "#ba68c8")))
       ;; Select palette based on variant
       (palette (if (eq variant 'blue) blue-palette green-palette))
       ;; Helper function to get colors from palette
       (color (lambda (name) (cdr (assoc name palette)))))

  (custom-theme-set-variables
   'bossa-nova
   '(frame-background-mode (quote dark)))

  (custom-theme-set-faces
   'bossa-nova

   ;; Basic Coloring
   `(default ((t (:foreground ,(funcall color 'fg) :background ,(funcall color 'bg)))))
   `(cursor ((t (:background ,(funcall color 'yellow)))))
   `(region ((t (:background ,(funcall color 'bg+3) :foreground nil))))
   `(highlight ((t (:background ,(funcall color 'bg-highlight) :foreground nil))))
   `(fringe ((t (:background nil :foreground ,(funcall color 'bg+2)))))
   `(vertical-border ((t (:foreground ,(funcall color 'bg+2)))))
   `(border ((t (:background ,(funcall color 'bg) :foreground ,(funcall color 'bg+2)))))
   `(link ((t (:foreground ,(funcall color 'yellow) :underline t))))
   `(link-visited ((t (:foreground ,(funcall color 'yellow-dim) :underline t))))
   `(match ((t (:background ,(funcall color 'bg+4)))))
   `(shadow ((t (:foreground ,(funcall color 'bg+4)))))
   `(minibuffer-prompt ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(secondary-selection ((t (:background ,(funcall color 'bg+3) :foreground nil))))
   `(trailing-whitespace ((t (:background ,(funcall color 'red)))))
   `(tooltip ((t (:background ,(funcall color 'bg+4) :foreground ,(funcall color 'white)))))

   ;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,(funcall color 'yellow)))))
   `(font-lock-comment-face ((t (:foreground ,(funcall color 'green-dim)))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,(funcall color 'green-dim)))))
   `(font-lock-constant-face ((t (:foreground ,(funcall color 'green-light)))))
   `(font-lock-doc-face ((t (:foreground ,(funcall color 'green)))))
   `(font-lock-doc-string-face ((t (:foreground ,(funcall color 'green)))))
   `(font-lock-function-name-face ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(font-lock-keyword-face ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(font-lock-string-face ((t (:foreground ,(funcall color 'green)))))
   `(font-lock-type-face ((t (:foreground ,(funcall color 'green-light)))))
   `(font-lock-variable-name-face ((t (:foreground ,(funcall color 'fg)))))
   `(font-lock-warning-face ((t (:foreground ,(funcall color 'red) :weight bold))))

   ;; Mode Line
   `(mode-line ((t (:background ,(funcall color 'bg+1) :foreground ,(funcall color 'white) :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(mode-line-inactive ((t (:background ,(funcall color 'bg+1) :foreground ,(funcall color 'fg-dim) :box nil))))

   ;; Line Numbers
   `(line-number ((t (:inherit default :foreground ,(funcall color 'bg+4)))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,(funcall color 'yellow)))))

   ;; Search
   `(isearch ((t (:foreground ,(funcall color 'bg) :background ,(funcall color 'yellow) :weight bold))))
   `(isearch-fail ((t (:foreground ,(funcall color 'bg) :background ,(funcall color 'red)))))
   `(lazy-highlight ((t (:foreground ,(funcall color 'fg+1) :background ,(funcall color 'bg+3)))))

   ;; Show Paren
   `(show-paren-match ((t (:background ,(funcall color 'bg+4) :foreground ,(funcall color 'yellow) :weight bold))))
   `(show-paren-mismatch ((t (:background ,(funcall color 'red-dim) :foreground ,(funcall color 'white) :weight bold))))

   ;; Dired
   `(dired-directory ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(dired-symlink ((t (:foreground ,(funcall color 'cyan)))))
   `(dired-ignored ((t (:foreground ,(funcall color 'fg-dim)))))

   ;; Org Mode
   `(org-level-1 ((t (:foreground ,(funcall color 'yellow) :weight bold :height 1.3))))
   `(org-level-2 ((t (:foreground ,(funcall color 'green-light) :weight bold :height 1.2))))
   `(org-level-3 ((t (:foreground ,(funcall color 'yellow-dim) :weight bold :height 1.1))))
   `(org-level-4 ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(org-level-5 ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(org-level-6 ((t (:foreground ,(funcall color 'green)))))
   `(org-level-7 ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(org-level-8 ((t (:foreground ,(funcall color 'green)))))
   `(org-document-title ((t (:foreground ,(funcall color 'yellow) :weight bold :height 1.5))))
   `(org-document-info ((t (:foreground ,(funcall color 'green)))))
   `(org-document-info-keyword ((t (:foreground ,(funcall color 'green-dim)))))
   `(org-todo ((t (:foreground ,(funcall color 'red) :weight bold))))
   `(org-done ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(org-date ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(org-special-keyword ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(org-code ((t (:foreground ,(funcall color 'green)))))
   `(org-verbatim ((t (:foreground ,(funcall color 'green)))))

   ;; Magit
   `(magit-branch-local ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(magit-branch-remote ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(magit-tag ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(magit-hash ((t (:foreground ,(funcall color 'fg-dim)))))
   `(magit-section-heading ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(magit-section-highlight ((t (:background ,(funcall color 'bg-highlight)))))
   `(magit-diff-file-heading ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(magit-diff-hunk-heading ((t (:background ,(funcall color 'bg+2) :foreground ,(funcall color 'fg)))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,(funcall color 'bg+3) :foreground ,(funcall color 'fg+1)))))
   `(magit-diff-added ((t (:foreground ,(funcall color 'green) :background ,(funcall color 'bg)))))
   `(magit-diff-removed ((t (:foreground ,(funcall color 'red) :background ,(funcall color 'bg)))))
   `(magit-diff-added-highlight ((t (:foreground ,(funcall color 'green-light) :background ,(funcall color 'bg-highlight)))))
   `(magit-diff-removed-highlight ((t (:foreground ,(funcall color 'red) :background ,(funcall color 'bg-highlight)))))
   `(magit-diff-context ((t (:foreground ,(funcall color 'fg-dim)))))
   `(magit-diff-context-highlight ((t (:foreground ,(funcall color 'fg) :background ,(funcall color 'bg-highlight)))))

   ;; Company
   `(company-tooltip ((t (:foreground ,(funcall color 'fg) :background ,(funcall color 'bg+1)))))
   `(company-tooltip-annotation ((t (:foreground ,(funcall color 'green-dim) :background ,(funcall color 'bg+1)))))
   `(company-tooltip-annotation-selection ((t (:foreground ,(funcall color 'green) :background ,(funcall color 'bg+2)))))
   `(company-tooltip-selection ((t (:foreground ,(funcall color 'fg+1) :background ,(funcall color 'bg+2)))))
   `(company-tooltip-mouse ((t (:background ,(funcall color 'bg+2)))))
   `(company-tooltip-common ((t (:foreground ,(funcall color 'yellow)))))
   `(company-tooltip-common-selection ((t (:foreground ,(funcall color 'yellow)))))
   `(company-scrollbar-fg ((t (:background ,(funcall color 'bg+3)))))
   `(company-scrollbar-bg ((t (:background ,(funcall color 'bg+1)))))
   `(company-preview ((t (:background ,(funcall color 'bg+2)))))
   `(company-preview-common ((t (:foreground ,(funcall color 'yellow) :background ,(funcall color 'bg+2)))))

   ;; Flycheck
   `(flycheck-error ((t (:underline (:style wave :color ,(funcall color 'red))))))
   `(flycheck-warning ((t (:underline (:style wave :color ,(funcall color 'yellow-dim))))))
   `(flycheck-info ((t (:underline (:style wave :color ,(funcall color 'green))))))

   ;; Flyspell
   `(flyspell-incorrect ((t (:underline (:style wave :color ,(funcall color 'red))))))
   `(flyspell-duplicate ((t (:underline (:style wave :color ,(funcall color 'yellow-dim))))))

   ;; Helm
   `(helm-source-header ((t (:foreground ,(funcall color 'yellow) :background ,(funcall color 'bg) :weight bold :height 1.3))))
   `(helm-match ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(helm-selection ((t (:background ,(funcall color 'bg-highlight) :foreground ,(funcall color 'fg+1)))))
   `(helm-candidate-number ((t (:background ,(funcall color 'bg+2) :foreground ,(funcall color 'yellow) :weight bold))))

   ;; Ido
   `(ido-first-match ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(ido-only-match ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(ido-subdir ((t (:foreground ,(funcall color 'yellow)))))

   ;; Compilation
   `(compilation-info ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(compilation-warning ((t (:foreground ,(funcall color 'yellow-dim) :weight bold))))
   `(compilation-error ((t (:foreground ,(funcall color 'red) :weight bold))))
   `(compilation-mode-line-exit ((t (:foreground ,(funcall color 'green) :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,(funcall color 'red) :weight bold))))

   ;; Diff
   `(diff-added ((t (:foreground ,(funcall color 'green) :background nil))))
   `(diff-removed ((t (:foreground ,(funcall color 'red) :background nil))))
   `(diff-header ((t (:foreground ,(funcall color 'yellow) :background nil))))
   `(diff-file-header ((t (:foreground ,(funcall color 'yellow) :weight bold :background nil))))
   `(diff-hunk-header ((t (:foreground ,(funcall color 'fg) :background ,(funcall color 'bg+2)))))

   ;; Tab Bar
   `(tab-bar ((t (:background ,(funcall color 'bg+1) :foreground ,(funcall color 'fg-dim)))))
   `(tab-bar-tab ((t (:background nil :foreground ,(funcall color 'yellow) :weight bold))))
   `(tab-bar-tab-inactive ((t (:background nil :foreground ,(funcall color 'fg-dim)))))

   ;; Term Colors
   `(term-color-black ((t (:foreground ,(funcall color 'bg+3) :background ,(funcall color 'bg+4)))))
   `(term-color-red ((t (:foreground ,(funcall color 'red) :background ,(funcall color 'red)))))
   `(term-color-green ((t (:foreground ,(funcall color 'green) :background ,(funcall color 'green)))))
   `(term-color-yellow ((t (:foreground ,(funcall color 'yellow) :background ,(funcall color 'yellow)))))
   `(term-color-blue ((t (:foreground ,(funcall color 'blue) :background ,(funcall color 'blue)))))
   `(term-color-magenta ((t (:foreground ,(funcall color 'magenta) :background ,(funcall color 'magenta)))))
   `(term-color-cyan ((t (:foreground ,(funcall color 'cyan) :background ,(funcall color 'cyan)))))
   `(term-color-white ((t (:foreground ,(funcall color 'fg) :background ,(funcall color 'white)))))

   ;; Whitespace
   `(whitespace-space ((t (:background ,(funcall color 'bg) :foreground ,(funcall color 'bg+1)))))
   `(whitespace-tab ((t (:background ,(funcall color 'bg) :foreground ,(funcall color 'bg+1)))))
   `(whitespace-newline ((t (:background ,(funcall color 'bg) :foreground ,(funcall color 'bg+2)))))
   `(whitespace-trailing ((t (:background ,(funcall color 'red) :foreground ,(funcall color 'red)))))
   `(whitespace-line ((t (:background ,(funcall color 'bg+2) :foreground ,(funcall color 'red)))))

   ;; Which Function
   `(which-func ((t (:foreground ,(funcall color 'yellow)))))

   ;; ERC
   `(erc-notice-face ((t (:foreground ,(funcall color 'green)))))
   `(erc-timestamp-face ((t (:foreground ,(funcall color 'yellow-dim)))))
   `(erc-input-face ((t (:foreground ,(funcall color 'fg+1)))))
   `(erc-my-nick-face ((t (:foreground ,(funcall color 'yellow) :weight bold))))

   ;; Message
   `(message-header-name ((t (:foreground ,(funcall color 'green)))))
   `(message-header-subject ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(message-header-to ((t (:foreground ,(funcall color 'fg)))))
   `(message-header-cc ((t (:foreground ,(funcall color 'fg)))))
   `(message-header-other ((t (:foreground ,(funcall color 'green)))))

   ;; Info
   `(info-menu-header ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(info-menu-star ((t (:foreground ,(funcall color 'red)))))
   `(info-node ((t (:foreground ,(funcall color 'yellow) :weight bold))))
   `(info-xref ((t (:foreground ,(funcall color 'green)))))
   `(info-xref-visited ((t (:foreground ,(funcall color 'green-dim)))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'bossa-nova)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; bossa-nova-theme.el ends here
