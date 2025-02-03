(= (max-value ()) ())
(= (max-value (:: $head $tail)) 
	(is-max $head $tail)
)

(= (is-max $x ()) $x)
(= (is-max $x (:: $head $tail))
	(if (> $x $head)
		(is-max $x $tail)
		(is-max $head $tail)
	)
)

!(max-value (:: 10 (:: 20 (:: 15 ()))))
