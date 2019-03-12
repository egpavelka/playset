;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

;; To start dev server:
;; 
((nil . ((mode . npm)
       ;; (mode . pony)
       (pyvenv-activate . "/home/gigi/Code/Current/playsette/venv/")
       (pony-settings (make-pony-project
                   :python "/home/gigi/Code/Current/playsette/venv/bin/python"
                   :pythonpath "/home/gigi/Code/Current/playsette/api/"
                   :settings "local_settings_file"
                   :appsdir "testproject/apps/")
                      )
       (python-shell-process-environment . ("DJANGO_SETTINGS_MODULE=playsette.settings"))
       (python-shell-extra-pythonpaths . ("/home/gigi/Code/Current/playsette/api/"))
       (python-shell-virtualenv-root . "/home/gigi/Code/Current/playsette/venv/"))))
