(= (is-member $x ()) False)
(= (is-member $x (:: $head $tail))
	(if (== $x $head)
		True
		(is-member $x $tail)
	) 
)

!(is-member 2 ())
!(is-member 2 (:: 1 (:: 2 (:: 3 ()))))
!(is-member 5 (:: 1 (:: 2 (:: 3 ()))))

