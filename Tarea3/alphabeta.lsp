(Load 'funcionesDamas.lsp)
(setq depth (parse-integer (car #+CLISP *args*)))
(setq st (read-from-string (cadr #+CLISP *args*)))
(setq asRed (read-from-string (caddr #+CLISP *args*)))

(minimax-ab st depth asRed)
(print "depth:")
(print depth)
(print "from:")
(print st)
(print "to:")
(print (caddr bm))
(print (fourth bm))