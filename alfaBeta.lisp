(defvar h finJuego)
(setq tablero nil pila nil cerrado nil nodo nil poda nil)
;nodo=(id padre cMov ini fin v)

(defun ab(node depth a b)

	(cond ((or (EQ depth 0) (finJuego)) (calculaH) (setf (nth 5 node) h) (revierteTab node) (cond((< a b) (cond((EQ (mod depth 2) 0 ) (cond((a<h)     )
																		(t)))
													(t (cond((b>h)(setq b h))
																  (t)))) (generaNodo))
											(t (setq poda t))))
			(t (cond(((> (nth 3 node) 8)) (push (pop pila) cerrado) (revierteTab node) (setq nodo (sigMov)) (push nodo pila)  (ab nodo depth a b))
					(t (cond((>= a b) (push (pop pila) cerrado) (ab  (car pila) (incf depth) a b))
						(t(setq nodo (sigMov node)) (push nodo pila) (ab nodo (decf depth) a b)))))))
	)

(defun sigMov(nodo))

(defun generanodo())

(defun calculaH())

(defun revierteTab())

(defun finJuego())





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