# qs

qs is an emacs library for providing tmux like buffer management.

## Usage

```elisp
;; require quick select library
(require 'qs)

;; map Ctrl + Fn key to tag a buffer with a quick select tag
(define-key your-mode-map (kbd "C-<f1>")    (lambda () (interactive) (qs-set "f1")))
(define-key your-mode-map (kbd "C-<f2>")    (lambda () (interactive) (qs-set "f2")))
(define-key your-mode-map (kbd "C-<f3>")    (lambda () (interactive) (qs-set "f3")))
(define-key your-mode-map (kbd "C-<f4>")    (lambda () (interactive) (qs-set "f4")))
(define-key your-mode-map (kbd "C-<f5>")    (lambda () (interactive) (qs-set "f5")))
(define-key your-mode-map (kbd "C-<f6>")    (lambda () (interactive) (qs-set "f6")))
(define-key your-mode-map (kbd "C-<f7>")    (lambda () (interactive) (qs-set "f7")))
(define-key your-mode-map (kbd "C-<f8>")    (lambda () (interactive) (qs-set "f8")))
(define-key your-mode-map (kbd "C-<f9>")    (lambda () (interactive) (qs-set "f9")))
(define-key your-mode-map (kbd "C-<f10>")   (lambda () (interactive) (qs-set "f10")))
(define-key your-mode-map (kbd "C-<f11>")   (lambda () (interactive) (qs-set "f11")))
(define-key your-mode-map (kbd "C-<f12>")   (lambda () (interactive) (qs-set "f12")))
(define-key your-mode-map (kbd "C-S-<f1>")  (lambda () (interactive) (qs-set "s1")))
(define-key your-mode-map (kbd "C-S-<f2>")  (lambda () (interactive) (qs-set "s2")))
(define-key your-mode-map (kbd "C-S-<f3>")  (lambda () (interactive) (qs-set "s3")))
(define-key your-mode-map (kbd "C-S-<f4>")  (lambda () (interactive) (qs-set "s4")))
(define-key your-mode-map (kbd "C-S-<f5>")  (lambda () (interactive) (qs-set "s5")))
(define-key your-mode-map (kbd "C-S-<f6>")  (lambda () (interactive) (qs-set "s6")))
(define-key your-mode-map (kbd "C-S-<f7>")  (lambda () (interactive) (qs-set "s7")))
(define-key your-mode-map (kbd "C-S-<f8>")  (lambda () (interactive) (qs-set "s8")))
(define-key your-mode-map (kbd "C-S-<f9>")  (lambda () (interactive) (qs-set "s9")))
(define-key your-mode-map (kbd "C-S-<f10>") (lambda () (interactive) (qs-set "s10")))
(define-key your-mode-map (kbd "C-S-<f11>") (lambda () (interactive) (qs-set "s11")))
(define-key your-mode-map (kbd "C-S-<f12>") (lambda () (interactive) (qs-set "s12")))

;; map Alt + Fn to jump to a buffer with a given quickselect tag
(define-key your-mode-map (kbd "M-<f1>")    (lambda () (interactive) (qs-go "f1")))
(define-key your-mode-map (kbd "M-<f2>")    (lambda () (interactive) (qs-go "f2")))
(define-key your-mode-map (kbd "M-<f3>")    (lambda () (interactive) (qs-go "f3")))
(define-key your-mode-map (kbd "M-<f4>")    (lambda () (interactive) (qs-go "f4")))
(define-key your-mode-map (kbd "M-<f5>")    (lambda () (interactive) (qs-go "f5")))
(define-key your-mode-map (kbd "M-<f6>")    (lambda () (interactive) (qs-go "f6")))
(define-key your-mode-map (kbd "M-<f7>")    (lambda () (interactive) (qs-go "f7")))
(define-key your-mode-map (kbd "M-<f8>")    (lambda () (interactive) (qs-go "f8")))
(define-key your-mode-map (kbd "M-<f9>")    (lambda () (interactive) (qs-go "f9")))
(define-key your-mode-map (kbd "M-<f10>")   (lambda () (interactive) (qs-go "f10")))
(define-key your-mode-map (kbd "M-<f11>")   (lambda () (interactive) (qs-go "f11")))
(define-key your-mode-map (kbd "M-<f12>")   (lambda () (interactive) (qs-go "f12")))
(define-key your-mode-map (kbd "M-S-<f1>")  (lambda () (interactive) (qs-go "s1")))
(define-key your-mode-map (kbd "M-S-<f2>")  (lambda () (interactive) (qs-go "s2")))
(define-key your-mode-map (kbd "M-S-<f3>")  (lambda () (interactive) (qs-go "s3")))
(define-key your-mode-map (kbd "M-S-<f4>")  (lambda () (interactive) (qs-go "s4")))
(define-key your-mode-map (kbd "M-S-<f5>")  (lambda () (interactive) (qs-go "s5")))
(define-key your-mode-map (kbd "M-S-<f6>")  (lambda () (interactive) (qs-go "s6")))
(define-key your-mode-map (kbd "M-S-<f7>")  (lambda () (interactive) (qs-go "s7")))
(define-key your-mode-map (kbd "M-S-<f8>")  (lambda () (interactive) (qs-go "s8")))
(define-key your-mode-map (kbd "M-S-<f9>")  (lambda () (interactive) (qs-go "s9")))
(define-key your-mode-map (kbd "M-S-<f10>") (lambda () (interactive) (qs-go "s10")))
(define-key your-mode-map (kbd "M-S-<f11>") (lambda () (interactive) (qs-go "s11")))
(define-key your-mode-map (kbd "M-S-<f12>") (lambda () (interactive) (qs-go "s12")))

;; map Alt+Right and Alt+Left to go to the "next" and "previous" tagged buffers
(define-key your-mode-map (kbd "M-<right>") 'qs-next)
(define-key your-mode-map (kbd "M-<left>")  'qs-prev)

```
