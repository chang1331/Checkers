(defvar h)
(setq q pila nil)

(defun ab(node depth a b player)
	
	(cond ((or (EQ depth 0) fin) (calculaH) (cond((< a b) (cond((EQ player 1)(cond((a<h)(setq a h))
																		(t)))
													(t (cond((b>h)(setq b h))
																  (t)))) (generaNodo))
											(t(poda))))
			(t ()   ) )
		
	
	)





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