
(progn
  (defvar current-time-string "")
  (run-with-timer
   1 1
   (lambda ()
     (let ((message-log-max nil))
       (unless (minibuffer-window-active-p (minibuffer-window))
         (when (member (current-message)
                       (list current-time-string nil))
           (message "%s" (setq current-time-string
                               (current-time-string)))))))))
[nil 21872 33554 386400 1 (lambda nil (let (...) (if ... nil ...))) nil nil 0]




    (with-current-buffer " *Minibuf-0*"
      (insert (format-time-string "%H:%M")))

 (run-at-time
  nil 60
  (lambda ()
    (with-current-buffer " *Minibuf-0*"
      (erase-buffer)
      (dotimes (spaces (- (frame-width) 8))
        (insert " "))
      (insert (format-time-string "%H:%M")))))

