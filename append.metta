(: list Type)
(: () list)
(: :: (-> Number list list))
(: append (-> list Number list))
(= (append () $x) (:: $x ()))
(= (append (:: $h $t) $x) (:: $h (append $t $x)))

!(append (:: 1 (:: 2 ())) 5)
