(= (map $f ()) ())
(= (map $f (:: $head $tail)) 
	(:: ($f $head) (map $f $tail))
)

(= (add2 ()) ())
(= (add2 $x) (+ 2 $x))

!(map add2 (:: 10 (:: 20 (:: 15 ()))))
