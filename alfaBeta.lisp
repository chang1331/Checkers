(setq h 0 finJuego 0)
(setq tablero '() pila nil cerrado nil nodo nil poda nil)
(setq hPieza 0 hPos 0 hmovT 0 patronH 0 sumadist 0)

(setq tabPeonY '((nil 0 nil 0 nil 0 nil 0)
			     (6 nil 5 nil 5 nil 5 nil)
				 (nil 4 nil 4 nil 4 nil 5)
				 (4 nil 3 nil 3 nil 3 nil)
				 (nil 2 nil 2 nil 2 nil 3)
				 (2 nil 1 nil 1 nil 1 nil)
				 (nil 0 nil 0 nil 0 nil 1)
				 (3 nil 3 nil 3 nil 3 nil)))

(setq tabPeonT '((nil 3 nil 3 nil 3 nil 3)
			     (1 nil 0 nil 0 nil 0 nil)
				 (nil 1 nil 1 nil 1 nil 2)
				 (3 nil 2 nil 2 nil 2 nil)
				 (nil 3 nil 3 nil 3 nil 4)
				 (5 nil 4 nil 4 nil 4 nil)
				 (nil 5 nil 5 nil 5 nil 6)
				 (0 nil 0 nil 0 nil 0 nil)))

(setq tabRey '((nil 0 nil 0 nil 0 nil 0)
			   (0 nil 1 nil 1 nil 1 nil)
			   (nil 1 nil 2 nil 2 nil 0)
			   (0 nil 2 nil 4 nil 1 nil)
			   (nil 1 nil 4 nil 2 nil 0)
			   (0 nil 2 nil 2 nil 1 nil)
			   (nil 1 nil 1 nil 1 nil 0)
			   (0 nil 0 nil 0 nil 0 nil)))
;nodo=(id padre cMov inix iniy finx finy  v)


(defun inicio(dep)
	(push '(1 nil 0 nil nil nil nil nil) pila)
	ab((car pila) dep -999999 999999)

	)
(defun ab(node depth a b)
	(cond ((or (EQ depth 0) (finJuego)) (calculaH) (setf (nth 5 node) h) (revierteTab node) (cond((< a b) (cond((EQ (mod depth 2) 0 ) (cond((a<h)     )
																		(t)))
													(t (cond((b>h)(setq b h))
																  (t)))) (generaNodo))
											(t (setq poda t))))
			(t (cond((> (nth 2 node) 12) (push (pop pila) cerrado) (revierteTab node) (setq nodo (sigMov)) (push nodo pila)  (ab nodo depth a b))
					(t (cond((>= a b) (push (pop pila) cerrado) (ab  (car pila) (incf depth) a b))
						(t (setq nodo (generaNodo node depth)) (push nodo pila) (ab nodo (decf depth) a b)))))))
	)




(defun sigMov(nodo))

(defun generaNodo(nodo depth))

(defun calculaH()
	(setq h (+ (cuentaPiezasH) (posTab) (patrones))))



(defun cuentaPiezasH()
(let ((c 0))                      
  (loop for x in tablero   ;x= primer elemento de lista Tablero (nil val1 nil val2 nil val3 nil val4)
      do (cond((EQ (nth 0 x) nil) (loop for i from 1 to 7 by 2
      								do  (cond((EQ (nth i x) 0))				 ;pos vacia
      										 ((EQ (nth i x) 1) (incf c 10))  ;pos con mi peón
      										 ((EQ (nth i x) 2) (incf c 13))  ;pos con mi rey
      										 ((EQ (nth i x) -1) (decf c 10)) ;pos con su peón
      										 (t (decf c 13)))))				 ;pos con su rey
      			(t (loop for i from 0 to 6 by 2
						do (cond((EQ (nth i x) 0))              ;pos vacia     
									((EQ (nth i x) 1) (incf c 10))  ;pos con mi peón
									((EQ (nth i x) 2) (incf c 13))  ;pos con mi rey
									((EQ (nth i x) -1) (decf c 10)) ;pos con su peón
									(t (decf c 13)))))))            ;pos con su rey
									c))          
	

(defun posTab()
(loop for i from 0 to 8   ;x= primer elemento de lista Tablero (nil val1 nil val2 nil val3 nil val4)
  do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
  								do  (cond((EQ (nth j (nth i tablero)) 0))				 ;pos vacia
  										 ((EQ (nth j (nth i tablero)) 1) (incf hPos (nth j (nth i tabPeonY))))  ;pos con mi peón
  										 ((EQ (nth j (nth i tablero)) 2) (incf hPos (nth j (nth i tabRey)))) ;pos con mi rey
  										 ((EQ (nth j (nth i tablero)) -1) (decf hPos (nth j (nth i tabPeonT)))) ;pos con su peón
  										 (t (decf hPos (nth j (nth i tabRey)))))))				 ;pos con su rey
  			(t (loop for j from 0 to 6 by 2
					do (cond((EQ (nth j (nth i tablero)) 0))				 ;pos vacia
								 ((EQ (nth j (nth i tablero)) 1) (incf hPos (nth j (nth i tabPeonY))))  ;pos con mi peón
								 ((EQ (nth j (nth i tablero)) 2) (incf hPos (nth j (nth i tabRey)))) ;pos con mi rey
								 ((EQ (nth j (nth i tablero)) -1) (decf hPos (nth j (nth i tabPeonT)))) ;pos con su peón
								 (t (decf hPos (nth j (nth i tabRey)))))))))
hPos)           ;pos con su rey
								
(defun patrones()
	)
(defun revierteTab())


;checar si hay fichas de ambos jugadores, si ambos tienen fichas checar si tienen movimientos, si uno no tiene movimientos, fin de juego
(defun finJuego()
	(loop while (>= row 0) 
  		do (setf row (- row 1))           ; or better: do (decf row)
 		collect (findIndex row col)))





function alphabeta(node, depth, α, β, maximizingPlayer)
02      if depth = 0 or node is a terminal node
03          return the heuristic value of node
04      if maximizingPlayer
05          v := -∞
06          for each child of node
07              v := max(v, alphabeta(child, depth – 1, α, β, FALSE))
08              α := max(α, v)
09              if β ≤ α
10                  break (* β cut-off *)
11          return v
12      else
13          v := +∞
14          for each child of node
15              v := min(v, alphabeta(child, depth – 1, α, β, TRUE))
16              β := min(β, v)
17              if β ≤ α
18                  break (* α cut-off *)
19          return v