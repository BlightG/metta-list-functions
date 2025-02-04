(: list Type)
(: () list)
(: :: (-> Number list list))

(: filter (-> (-> $t Bool) list list))
(= (filter $f ()) ())
(= (filter $f (:: $h $t))
    (if ($f $h)
        (:: $h (filter $f $t))
        (filter $f $t)))

(: greateThan0 (-> Number Bool))
(= (greateThan0 ()) ())
(= (greateThan0 $x ) (> $x 0))

!(filter greateThan0 (:: 1 (:: -2 (:: 3 ()))))
