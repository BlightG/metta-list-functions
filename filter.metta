 ; takes a function from type t to bool and a list then return a list
(: filter (-> (-> $t Bool) (List $t) (List $t)))
 ;basecase
(= (filter $f ()) ())
 ; now we define the recursive case
(= (filter $f (:: $h $t))
    (if ($f $h)
        (:: $h (filter $f $t))
        (filter $f $t)))

(: greateThan0 (-> Number Bool))
(= (greateThan0 ()) ())
(= (greateThan0 $x ) (> $x 0))

(greateThan0 -2)
!(filter greateThan0 (:: 1 (:: -2 (:: 3 ()))))
