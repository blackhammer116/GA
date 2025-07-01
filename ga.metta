! (bind! rand (py-atom numpy.random.rand))


(= (fitness $c $a $b)
    (let* 
        (
            ($CC (superpose $c))
            ($AA (superpose $a))
            ($BB (superpose $b))
        )
        ()
    )
)

(= (roulette-selection $P $F)
    (collapse (let*
        (
            ($max (max-atom $P))
            ($i (superpose $P))
            ($fi (superpose $F))
            ($r (rand))
        )
        (if (< $r (/ $fi $max))
            $i
            (empty)
        )
    ))
)

!(roulette-selection (0.9 0.9 0.0 0.8 0.2 0.9 0.7 0.7) (0.9 0.9 0.0 0.8 0.2 0.9 0.7 0.7))