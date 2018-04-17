(setq h 0 finJuego 0)
(setq tablero '() ids 1 cerrado nil nodo nil v nil)
(setq movimiento nil res nil)
(setq hPieza 0 hPos 0 hMov 0 patronH 0 sumadist 0)

(setq tabPeonT '((nil 0 nil 0 nil 0 nil 0)
			     (6 nil 5 nil 5 nil 5 nil)
				 (nil 4 nil 4 nil 4 nil 5)
				 (4 nil 3 nil 3 nil 3 nil)
				 (nil 2 nil 2 nil 2 nil 3)
				 (2 nil 1 nil 1 nil 1 nil)
				 (nil 0 nil 0 nil 0 nil 1)
				 (3 nil 3 nil 3 nil 3 nil)))


(setq tabPeonY '((nil 3 nil 3 nil 3 nil 3)
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
;nodo=(id padre cMov tablero v)


(setq tablero '((nil 1 nil 1 nil 1 nil 1)
			   (1 nil 1 nil 1 nil 1 nil)
			   (nil 1 nil 1 nil 1 nil 1)
			   (0 nil 0 nil 0 nil 0 nil)
			   (nil 0 nil 0 nil 0 nil 0)
			   (-1 nil -1 nil -1 nil -1 nil)
			   (nil -1 nil -1 nil -1 nil -1)
			   (-1 nil -1 nil -1 nil -1 nil)))

(setq n '(1 nil 0 tablero nil))

(defun ab(tab node depth a b)
	(format t "nodo ab: ~D ~%" node)
	(cond ((or (EQ depth 0)) (calculaH))
			((eq (mod depth 2) 0) (setq v -999999) (setq movimiento (sigMov depth node tab))  (loop while (not(null movimiento))  
															do (setq v (max v (ab (nth 3 movimiento) movimiento (decf depth) a b)))
															   (setq a (max a v))
															   (cond((<= b a) (break))
															   		(t (setq movimiento (sigMov depth movimiento tab))))) return v)
											
			(t (setq v 999999) (setq movimiento (sigMov depth node tab)) (loop while (not(null movimiento))   
															do (setq v (min v (ab (nth 3 movimiento) movimiento (decf depth) a b)))
															   (setq a (min b v))
															   (cond((<= b a) (break))
															   		(t (setq movimiento (sigMov depth movimiento tab))))) return v)))



(defun sigMov(prof nodo tab)
(format t "nodo sig mov: ~D ~%" nodo)
(cond((EQ (mod prof 2) 0) (setq tab (reversed tab)) (loop for i from 0 to 7 
							    do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
							      								do  (cond((EQ (nth j (nth i tab)) 0))
							      										 ((EQ (nth j (nth i tab)) -1) (setq res (generaMov -1 i j (nth 2 nodo) tab)) 
							      										 							  (cond((not (null res)) (return))
							      										 									 (t))) 
							      										 ((EQ (nth j (nth i tab)) -2) (setq res (generaMov -2 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t))))))
							            (t (loop for j from 0 to 6 by 2
							      								do  (cond((EQ (nth j (nth i tab)) 0))
							      										 ((EQ (nth j (nth i tab)) -1) (setq res (generaMov -1 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t)))
							      										 ((EQ (nth j (nth i tab)) -2) (setq res(generaMov -2 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t)))))))
							    (setq tab (reversed tab)) 
							    (cond((not (null res)) (setq res (list (incf ids) (car nodo) (car (last mov)) (nth 2 r)  nil)) (setq tab (reversed tab))  (return res))
		    						 (t ))))

	(t (loop for i from 0 to 7 
		    do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
		      								do  (cond((EQ (nth j (nth i tab)) 0))
		      										 ((EQ (nth j (nth i tab)) 1) (setq res (generaMov 1 i j (nth 2 nodo) tab)) 
							      										 							  (cond((not (null res)) (return))
							      										 									 (t)))  
		      										 ((EQ (nth j (nth i tab)) 2) (setq res (generaMov 2 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t))))))
		            (t (loop for j from 0 to 6 by 2
		      								do  (cond((EQ (nth j (nth i tab)) 0))
		      										 ((EQ (nth j (nth i tab)) 1) (setq res (generaMov 1 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t))) 
		      										 ((EQ (nth j (nth i tab)) 2) (setq res (generaMov 2 i j (nth 2 nodo) tab))
							      										 							  (cond((not (null res)) (return))
							      										 									 (t)))))))
		    (cond((not (null res)) (setq res (list (incf ids) (car nodo) (car (last mov)) (nth 2 r)  nil)) (format t "RES: ~D ~%" res) (return res))
		    	(t ))    ))))


(defun generaMov(tipo i j movHechos tab)
#|(format t "movHechos: ~D ~%" movHechos)|#
	 #|(format t "i: ~D  j: ~D ~%" i j )|#
	(cond((< tipo 0) (setq tab (reversed tab))))
	;si puedes comer
	(cond ((or (and (>= (- j 2) 2) (<= (+ i 2) 5) (EQ (nth (- j 2) (nth (+ i 2) tab)) 0) (or (EQ (nth (- j 1) (nth (+ i 1) tab)) (- tipo)) (EQ (nth (- j 1) (nth (+ i 1) tab)) (/ (- tipo) 2)))) ;ADELANTE DERECHA
             (and (<= (+ j 2) 5) (<= (+ i 2) 5) (EQ (nth (+ j 2) (nth (+ i 2) tab)) 0) (or (EQ (nth (+ j 1) (nth (+ i 1) tab)) (- tipo)) (EQ (nth (+ j 1) (nth (+ i 1) tab)) (/ (- tipo) 2)))) ;ADELANTE IZQUIERDA
             (and (EQ (abs tipo) 2) (>= (- j 2) 2) (>= (- i 2) 2) (EQ (nth (- j 2) (nth (- i 2) tab) ) 0) (or (EQ (nth (- j 1) (nth (- i 1) tab)) (- tipo)) (EQ (nth (- j 1) (nth (- i 1) tab)) (/ (- tipo) 2)))) ;ATRÁS DERECHA
             (and (EQ (abs tipo) 2) (<= (+ j 2) 5) (>= (- i 2) 2) (EQ (nth (+ j 2) (nth (- i 2) tab) ) 0) (or (EQ (nth (+ j 1) (nth (- i 1) tab)) (- tipo)) (EQ (nth (+ j 1) (nth (- i 1) tab)) (/ (- tipo) 2))))) ;ATRÁS IZQUIERDA
				;poner bandera 
			   (cond ((<= 4 movHechos 7))
			   		 (t (setq movHechos 5)))
			   	#|(format t "movHechos en saltos: ~D ~%" movHechos)|#
			   (case movHechos
			   		;SALTOS
			   		(4 (cond((and  (>= (- j 2) 2) (<= (+ i 2) 5) (EQ (nth (- j 2) (nth (+ i 2) tablero)) 0)) (setq mov (list (+ i 2) (- j 2) 4))) ;SALTO ADELANTE DERECHA
							(t (cond((< tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))  
																														   
		            (5 (cond((and  (<= (+ j 2) 5) (<= (+ i 2) 5) (EQ (nth (+ j 2) (nth (+ i 2) tablero) ) 0)) (setq mov (list (+ i 2) (+ j 2) 5))) ;SALTO ADELANTE IZQUIERDA
		            																						  		
		                    (t (cond((< tipo 0) (setq tab (reversed tab))))  (generaMov tipo i j (incf movHechos) tab))))

		            (6 (cond((and (EQ (abs tipo) 2) (>= (- j 2) 2) (>= (- i 2) 2) (EQ (nth (- j 2) (nth (- i 2) tablero)) 0)) (setq mov (list (- i 2) (- j 2) 6))) ;SALTO ATRÁS DERECHA 
		                    (t (cond((< tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))

		            (7 (cond((and (EQ (abs tipo) 2) (<= (+ j 2) 5) (<= (- i 2) 2) (EQ (nth (+ j 2) (nth (- i 2) tablero)) 0)) (setq mov (list (- i 2) (+ j 2) 7))) ;SALTO ATRÁS DERECHA
		                    (t (cond((< tipo 0) (setq tab (reversed tab)))) (generaMov tipo i j (incf movHechos) tab))))
		           )

				   (setq r (list (car mov) (cadr mov) (generaTablero tipo i j (car(last mov)) tab))) r
;falta coronar 
			   	)

			;MOVIMIENTOS NORMALES
		   ((<= movHechos 3) 
		   	#|(format t "movHechos en cond: ~D ~%" movHechos)|#
		   		(case movHechos
		            (0 (cond((and  (>= (- j 1) 0) (<= (+ i 1) 7) (EQ (nth (- j 1) (nth (+ i 1) tablero)) 0)) (setq mov (list (+ i 1) (- j 1) 0))) ;ADELANTE DERECHA
		                    (t (cond((< tipo 0) (setq tab (reversed tab)))) #|(format t "movHechos en case0: ~D ~%" (+ movHechos 1))|# (generaMov tipo i j (incf movHechos) tab))))   

		            (1 (cond((and  (<= (+ j 1) 7) (<= (+ i 1) 7) (EQ (nth (+ j 1) (nth (+ i 1) tablero)) 0)) (setq mov (list (+ i 1) (+ j 1) 1))) ;ADELANTE IZQUIERDA
		                    (t (cond((< tipo 0) (setq tab (reversed tab)))) #|(format t "movHechos en case1: ~D ~%" (+ movHechos 1))|#  (generaMov tipo i j (incf movHechos) tab))))

		            (2 (cond((and (EQ (abs tipo) 2) (>= (- j 1) 0) (>= (- i 1) 0) (EQ (nth (- j 2) (nth (- i 2) tablero) ) 0)) (setq mov (list (- i 1) (- j 1) 2))) ;ATRÁS DERECHA
		                    (t (cond((< tipo 0) (setq tab (reversed tab)))) #|(format t "movHechos en case2: ~D ~%" (+ movHechos 1))|# (generaMov tipo i j (incf movHechos) tab))))

		            (3 (cond((and (EQ (abs tipo) 2) (<= (+ j 1) 7) (<= (- i 1) 0) (EQ (nth (+ j 1) (nth (- i 1) tablero) ) 0)) (setq mov (list (- i 1) (+ j 1) 3))) ;ATRÁS IZQUIERDA
		                    (t (cond((< tipo 0) (setq tab (reversed tab))))  (setq mov nil))))) 
		   		

		   		(cond ((not (null mov))  (setq r (list (car mov) (cadr mov) (generaTablero tipo i j (car(last mov)) tab))) r)
		   			  (t nil)))

		   	(t nil)))
		
;mov=(i j movHecho)
;r=(i j tablero)
;res=(id padre movHecho tablero)
(defun generaTablero(tipo i j m tab)
	(cond((< tipo 0) (setq tab (reversed tab))))
	 (format t "tipo ~D ~%" tipo)
	 #|(format t "i: ~D  j: ~D ~%" i j )|#
	(case m
		;MOVIMIENTOS NORMALES
		(0 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (+ i 1) tab)) tipo))
		(1 (setf (nth j (nth i tab)) 0) (setf (nth (+ j 1) (nth (+ i 1) tab)) tipo))
		(2 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (- i 1) tab)) tipo))
		(3 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (+ i 1) tab)) tipo))
		;SALTOS
		(4 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (+ i 1) tab)) 0) (setf (nth (- j 2) (nth (+ i 2) tab)) tipo))
		(5 (setf (nth j (nth i tab)) 0) (setf (nth (+ j 1) (nth (+ i 1) tab)) 0) (setf (nth (+ j 2) (nth (+ i 2) tab)) tipo))
		(6 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (- i 1) tab)) 0) (setf (nth (- j 2) (nth (- i 2) tab)) tipo))
		(7 (setf (nth j (nth i tab)) 0) (setf (nth (- j 1) (nth (+ i 1) tab)) 0) (setf (nth (- j 2) (nth (+ i 2) tab)) tipo)))
	tab)

(defun generaNodo(nodo depth))

(defun calculaH()
	(setq h (+ (cuentaPiezasH) (posTab) #|(hMov) (runAwayH)|#)))


(defun reversed(l)
  (cond ((null l) nil )
        ((listp (car l)) (append (reversed (cdr l)) (list (reversed (car l)))))
        ((append (reversed(cdr l)) (list (car l))))))

(defun cuentaPiezasH() ;funciona
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
	

(defun posTab() ;biuen?
(loop for i from 0 to 7   ;x= primer elemento de lista Tablero (nil val1 nil val2 nil val3 nil val4)
  do (cond((EQ (mod i 2) 0) (loop for j from 1 to 7 by 2
  								do (cond((EQ (nth j (nth i tablero)) 0))				 ;pos vacia
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
  		do (cond(()))))

;(load #P"alfabeta.lisp" :external-format 'charset:iso-8859-1)

;checar si hay fichas de ambos jugadores, si ambos tienen fichas checar si tienen movimientos, si uno no tiene movimientos, fin de jueg