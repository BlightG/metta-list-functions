(: list Type)
(: () list)
(: :: (-> Number list list))

(: remove (-> Number list list))
(= (remove $x ()) ())
(= (remove $x (:: $head $tail)) 
	(if (== $x $head)
		(remove $x $tail)
		(:: $head(remove $x $tail))	
	)
)

!(remove 10 (:: 10(:: 20(:: 10 ()))))
