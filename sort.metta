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

(= (remove $x ()) ())
(= (remove $x (:: $head $tail)) 
	(if (== $x $head)
		$tail
		(:: $head(remove $x $tail))	
	)
)

(= (sort ()) ())
(= (sort (:: $head $tail))
	(let* (
			($min (min-value (:: $head $tail)))
		    ($removed_list (remove $min (:: $head $tail)))
		  )
		  (:: $min (sort $removed_list))
)
)



!(sort (:: 30 (:: 20 (:: 15 ()))))
