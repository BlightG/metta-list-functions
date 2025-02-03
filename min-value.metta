
(= (min-value ()) ())
(= (min-value (:: $head $tail)) 
	(is-min $head $tail)
)

(= (is-min $x ()) $x)
(= (is-min $x (:: $head $tail))
	(if (< $x $head)
		(is-min $x $tail)
		(is-min $head $tail)
	)
)

!(min-value (:: 20 (:: 10 (:: 15 ()))))
