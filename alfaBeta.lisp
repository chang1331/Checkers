(setq h 0 finJuego 0)
(setq tablero '() pila nil cerrado nil nodo nil v nil)
(setq dobleI nil dobleJ nil)
(setq hPieza 0 hPos 0 hMov 0 patronH 0 sumadist 0)

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

(setq tabRey '((nil 0 nil 0 nil 0 nil -1)
			   (0 nil 1 nil 1 nil 1 nil)
			   (nil 1 nil 2 nil 2 nil 0)
			   (0 nil 2 nil 4 nil 1 nil)
			   (nil 1 nil 4 nil 2 nil 0)
			   (0 nil 2 nil 2 nil 1 nil)
			   (nil 1 nil 1 nil 1 nil 0)
			   (-1 nil 0 nil 0 nil 0 nil)))
;nodo=(id padre cMov tablero  v)


(defun inicio(dep)
	*ab((car pila) dep -999999 999999)

	)



(defun ab(tab node depth a b)
	(cond ((or (EQ depth 0) (finJuego)) (calculaH))
			((eq (mod depth 2) 0) (setq v -999999) (setq movimiento (sigMov depth node tab)) (loop while movimiento  
															do (setq v (max v (ab (nth 3 movimiento) movimiento (decf depth) a b)))
															   (setq a (max a v))
															   (cond((<= b a) (break))
															   		(t (setq movimiento (sigMov depth node tab))))) return v)
											
			(t (setq v 999999) (setq movimiento (sigMov depth node tab)) (loop while movimiento  
															do (setq v (min v (ab (nth 3 movimiento) movimiento (decf depth) a b)))
															   (setq a (min b v))
															   (cond((<= b a) (break))
															   		(t (setq movimiento (sigMov depth node tab))))) return v))
	



(defun sigMov(prof nodo tab)


(cond((EQ (mod prof 2) 0) (loop for i from 0 to 7 
							    do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
							      								do  (cond((EQ (nth j (nth i tab) 0)))
							      										 ((EQ (nth j (nth i tab) -1)) (generaMov -1 i j (nth 2 nodo) tab)) 
							      										 ((EQ (nth j (nth i tab) -2)) (generaMov -2 i j (nth 2 nodo) tab)))))
							            (t (loop for j from 0 to 6 by 2
							      								do  (cond((EQ (nth j (nth i tab) 0)))
							      										 ((EQ (nth j (nth i tab) -1)) (generaMov -1 i j (nth 2 nodo) tab)) 
							      										 ((EQ (nth j (nth i tab) -2)) (generaMov -2 i j (nth 2 nodo) tab))))))))
	(t (loop for i from 0 to 7 
		    do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
		      								do  (cond((EQ (nth j (nth i tab) 0)))
		      										 ((EQ (nth j (nth i tab) 1)) (generaMov 1 i j (nth 2 nodo) tab)) 
		      										 ((EQ (nth j (nth i tab) 2)) (generaMov 2 i j (nth 2 nodo) tab)))))
		            (t (loop for j from 0 to 6 by 2
		      								do  (cond((EQ (nth j (nth i tab) 0)))
		      										 ((EQ (nth j (nth i tab) 1)) (generaMov 1 i j (nth 2 nodo) tab)) 
		      										 ((EQ (nth j (nth i tab) 2)) (generaMov 2 i j (nth 2 nodo) tab))))))))


(defun generaMov(tipo i j movHechos tab)

	(cond((< movHechos 2)   ;mov para peones 
	 (case movHechos
		(0 (cond((> tipo 0) (setq tab (reversed tab))))
					(cond((and  (>= (- j 1) 1) (<= (+ i 1) 6)) ;derecha adelante <- bien
												(cond((EQ (nth (- j 1) (nth (+ i 1) tablero) ) 0)  return (list (+ i 1) (- j 1)))
													 (t (cond((and (>= (- j 2) 2) (<= (+ i 2) 5) ) (EQ (nth (- j 2) (nth (+ i 2) tablero) ) 0))
																		 								(cond ((saltoDoble tipo (+ i 2) (- j 2)) return (list (dobleI) (dobleJ)))
																		 									  (t return (list (+ i 2) (- j 2))))) 
									  							(t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))) ;falta, hacer recursion en genera mov para case 2 
						 (t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))

		(1 (cond((> tipo 0) (setq tab (reversed tab)))) ;izquierda adelante -> bien
					(cond((and  (<= (+ j 1) 6) (<= (+ i 1) 6)) 
												(cond((EQ (nth (+ j 1) (nth (+ i 1) tablero) ) 0)  return (list (+ i 1) (+ j 1)))
													 (t (cond((and (<= (+ j 2) 5) (<= (+ i 2) 5) ) (EQ (nth (+ j 2) (nth (+ i 2) tablero) ) 0))
																		 								(cond ((saltoDoble tipo (+ i 2) (+ j 2)) return (list (dobleI) (dobleJ)))
																		 									  (t return (list (+ i 2) (+ j 2))))) 
									  							(t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))) ;falta, hacer recursion en genera mov para case 2 
						 (t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))
      ))


	((EQ (abs tipo) 2)   

	(case movHechos		;mov para rey
		(2 (cond((> tipo 0) (setq tab (reversed tab)))) ;derecha atrás <- bien
					(cond((and  (>= (- j 1) 1) (>= (- i 1) 1)) 
												(cond((EQ (nth (- j 1) (nth (- i 1) tablero) ) 0)  return (list (- i 1) (- j 1)))
													 (t (cond((and (>= (- j 2) 2) (>= (- i 2) 2) ) (EQ (nth (- j 2) (nth (- i 2) tablero) ) 0))
																		 								(cond ((saltoDoble tipo (- i 2) (- j 2)) return (list (dobleI) (dobleJ)))
																		 									  (t return (list (- i 2) (- j 2))))) 
									  							(t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))) ;falta, hacer recursion en genera mov para case 2 
						 (t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))

		(3 (cond((> tipo 0) (setq tab (reversed tab)))) ;izq atrás bien
					(cond((and  (<= (+ j 1) 6) (>= (- i 1) 1)) 
												(cond((EQ (nth (+ j 1) (nth (+ i 1) tablero) ) 0)  return (list (+ i 1) (+ j 1)))
													 (t (cond((and (<= (+ j 2) 5) (>= (- i 2) 2) ) (EQ (nth (+ j 2) (nth (+ i 2) tablero) ) 0))
																		 								(cond ((saltoDoble tipo (+ i 2) (+ j 2)) return (list (dobleI) (dobleJ)))
																		 									  (t return (list (+ i 2) (+ j 2))))) 
									  							(t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))) ;falta, hacer recursion en genera mov para case 2 
						 (t (cond((> tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))
      ))

	(t nil))


	)
		

(defun saltoDoble(tipo i j tab)

	)

(defun generaNodo(nodo depth))

(defun calculaH()
	(setq h (+ (cuentaPiezasH) (posTab) (hMov) (runAwayH))))


(defun reversed(l)
  (cond ((null l) nil )
        ((listp (car l)) (append (reversed (cdr l)) (list (reversed (car l)))))
        ((append (reversed(cdr l)) (list (car l))))))

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
								
(defun movimientosH()
	(loop for i from 0 to 8   ;x= primer elemento de lista Tablero (nil val1 nil val2 nil val3 nil val4)
  do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
  								do  (cond((EQ (nth j (nth i tablero)) 0))				 ;pos vacia
  										 ((EQ (nth j (nth i tablero)) 1) (incf hMov (movDispo i j 1)) )  ;mov dispo. para mi peón en (i,j)
  										 ((EQ (nth j (nth i tablero)) 2) (incf hMov (movDispo i j 2))) ;mov dispo. para mi rey en (i,j)
  										 ((EQ (nth j (nth i tablero)) -1) (decf hMov (movDispo i j -1))) ;pos con su peón
  										 (t (decf hMov (movDispo i j -2))))))				 ;pos con su rey
  			(t (loop for j from 0 to 6 by 2
					do (cond((EQ (nth j (nth i tablero)) 0))				 ;pos vacia
							((EQ (nth j (nth i tablero)) 1) (incf hMov (movDispo i j 1)) )  ;mov dispo. para mi peón en (i,j)
							((EQ (nth j (nth i tablero)) 2) (incf hMov (movDispo i j 2))) ;mov dispo. para mi rey en (i,j)
							((EQ (nth j (nth i tablero)) -1) (decf hMov (movDispo i j -1))) ;pos con su peón
							(t (decf hMov (movDispo i j -2))))))))
hMov)

(defun runAway(i j pieza)
	(cond((EQ pieza 1)(cond (EQ ) ))
		((EQ pieza -1))
		)
	)



;checar si hay fichas de ambos jugadores, si ambos tienen fichas checar si tienen movimientos, si uno no tiene movimientos, fin de juego
(defun finJuego()
	(loop for i from 0 to 8   ;x= primer elemento de lista Tablero (nil val1 nil val2 nil val3 nil val4)
  		do (cond(())) ))





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