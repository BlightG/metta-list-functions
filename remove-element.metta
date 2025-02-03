(= (remove $x ()) ())
(= (remove $x (:: $head $tail)) 
	(if (== $x $head)
		(remove $x $tail)
		(:: $head(remove $x $tail))	
	)
)

!(remove 10 (:: 10(:: 20(:: 10 ()))))
