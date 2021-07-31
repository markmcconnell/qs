;;; qs -- Emacs buffer quick switching system.

;;; Commentary:
;;; Tested on Emacs 27
;;; Provides an interface to tag and then switch to tagged buffers quickly.

;;; Code:
(require 'cl-lib)
(require 'seq)

(defvar *qs-map* (make-hash-table :test 'equal)
  "Map of quick tags in use to buffer objects.")

(defvar *qs-tag* (list "f1" "f2" "f3" "f4" "f5" "f6" "f7" "f8" "f9" "f10" "f11" "f12" "s1" "s2" "s3" "s4" "s5" "s6" "s7" "s8" "s9" "s10" "s11" "s12")
  "List of all tags available for automatic assigninment.")

;; each buffer saves it's active tag in this buffer-local variable
(make-variable-buffer-local 'qs-tag)

;; ###########################################################################
(defun qs-clr ()
  "Remove the quick select tag and index from current buffer."
  (let* ((name   (buffer-name))
	 (start  (string-match "<:.+>" name))
	 (end    (string-match ">" name start))
	 (rename (concat (cl-subseq name 0 start)
			 (cl-subseq name (+ end 1)))))

    ;; remove from hash
    (remhash qs-tag *qs-map*)

    ;; remove the tag
    (setq qs-tag nil)

    ;; rename the buffer to remove string tag from name
    (rename-buffer rename rename)))

(defun qs-unset (tag &optional replace)
  "Remove a TAG from the taglist and the corresponding buffer.
If REPLACE is specified, then immediate set as the new tag."
  (interactive "MUnset Tag: ")
  (let ((owner (gethash tag *qs-map*)))
    
    ;; if there is an owner and it's still live:
    (if (and owner (buffer-live-p owner))

	;; if replace, set to replacement, otherwise remove tag
	(if (stringp replace)
	    (with-current-buffer owner (qs-set replace))
	  (with-current-buffer owner (qs-clr)))
      
      ;; otherwise, just remove the tag from the map.
      (remhash tag *qs-map*))))
  
(defun qs-set (tag)
  "Add or change the quick select TAG for current buffer."
  (interactive "MSet Tag: ")
  (let ((previous-tag qs-tag))

    ;; remove any previously existing tag
    (when previous-tag (qs-clr))

    ;; if new tag is different from current, add new tag
    (unless (equal previous-tag tag)

      ;; if this tag is already in use by someone else
      ;; have them swap with us,  or give up the tag.
      (qs-unset tag previous-tag)

      ;; set the tag in buffer local variable
      (setq qs-tag tag)

      ;; save current buffer in hash under tag
      (setf (gethash tag *qs-map*) (current-buffer))

      ;; rename the buffer to include tagged name
      (rename-buffer (concat (buffer-name) "<:" tag ">")))))

;; ###########################################################################
(defun qs-other--sort (l r)
  "Function used to sort quick select tags L and R."
  (let ((pos-l (cl-position l *qs-tag* :test 'equal))
	(pos-r (cl-position r *qs-tag* :test 'equal)))

    (< pos-l pos-r)))

(defun qs-other (offset)
  "Find next quick select tag at OFFSET from current tag in sorted order."
  (let* ((keys (sort (hash-table-keys *qs-map*) #'qs-other--sort))
	 (last (- (length keys) 1))
	 (index (+ offset (or (cl-position qs-tag keys :test #'string-equal) -1))))

    ;; choose the next entry, wrapping around when out of bounds
    (nth (cond ((> index last) 0)
	       ((< index 0)    last)
	       (t              index)) keys)))

(defun qs-go (tag)
  "Switch to the buffer with matching quick select TAG."
  (let ((buffer (gethash tag *qs-map*)))

    ;; switch to buffer if it exists, otherwise complain
    (if buffer (switch-to-buffer buffer)
      (message (concat "No quick select buffer: " tag)))))

;; ###########################################################################
(defun qs-hook--kill ()
  "Remove any quick select tag when buffer is killed."
  (when qs-tag (qs-clr)))

(defun qs-hook--find ()
  "Automatically add a quick select tag to a buffer when file is visited."
  (let* ((keys (hash-table-keys *qs-map*))
	 (free (car (seq-filter (lambda (e) (not (member e keys))) *qs-tag*))))

    ;; if there's a free tag, and this buffer is untagged, tag it
    (when (and free (null qs-tag)) (qs-set free))))

(add-hook 'kill-buffer-hook 'qs-hook--kill)
(add-hook 'find-file-hook 'qs-hook--find)

;; ###########################################################################
(defun qs-next (arg)
  "Switch to the next tagged buffer in sorted order.
With prefix argument ARG, do this that many times."
  (interactive "p")
  (qs-go (qs-other (or arg 1))))

(defun qs-prev (arg)
  "Switch to the previous tagged buffer in sorted order.
With prefix argument ARG, do this that many times."
  (interactive "p")
  (qs-go (qs-other (- (or arg 1)))))

;; ###########################################################################
(provide 'qs)
;;; qs.el ends here
