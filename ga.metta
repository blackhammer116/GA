! (bind! rand (py-atom numpy.random.rand))
! (bind! random-sample (py-atom random.sample))
! (bind! zip (py-atom zip))
! (bind! max (py-atom max))
! (bind! convert-to-list (py-atom ga_og.convert_to_list))
; ! (bind! tournament_selection (py-atom ga_new.tournament_selection))


(= (index $list $ctr $index)
    (if (== $list ())
        ()
        (let* (
                ($head (car-atom $list))
                ($tail (cdr-atom $list))
                ($rest (index $tail (+ 1 $ctr) $index))
            )
        (if (== $ctr $index)
            $head
            $rest
        )
)
)
)

(= (get-second <class 'zip'>) (empty))
(= (get-second $x)
    (index $x 0 1)
)

(= (cleanList $data)
    (if (or (== $data ()) (== (get-metatype $data) Symbol))
        ()  ; Base case: if the list is empty, return an empty list
        (let*
            (
                ($head (car-atom $data))  ; Get the first element
                ($tail (cdr-atom $data))  ; Get the rest of the list
            )
            (if (== $head <class 'zip'>)
                (cleanList $tail)  ; Skip the <class 'zip'> marker
                ((if (== (get-metatype $head) Grounded)
                        $head  ; If the head is an atom, keep it
                        (cleanList $head))  ; Recursively clean nested lists
                    (cleanList $tail))  ; Process the rest of the list
            )
        )
    )
)

(= (zipL $list1 $list2)
    (if (or (== $list1 ()) (== $list2 ()))
        ()  ; Base case: if either list is empty, return an empty list
        ( 
            ((car-atom $list1) (car-atom $list2))  ; Pair the first elements of both lists
            (zipL (cdr-atom $list1) (cdr-atom $list2))  ; Recursively zip the rest of the lists
        )
    )
)


(= (tornament-selection $P $F $k)
    (let*
        (
            ; ($selected (random-sample (py-list (zip $P $F)) $k))
            ($selected (random-sample (zip $P $F) $k))
            (() (println! $selected))
            ; ($new (cleanList (convert-to-list $selected)))
            ; (() (println! $new))
            ; ($ss (max $selected (get-second (collapse $selected))))
            ; ($s ((superpose ($selected))))
            ; (() (println! $ss))
        )
        ; $ss
        ; $selected
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
; !(roulette-selection (0.9 0.9 0.0 0.8 0.2 0.9 0.7 0.7) (0.9 0.9 0.0 0.8 0.2 0.9 0.7 0.7))

! (tornament-selection 
    ((0.5272476954503176 0.2918449009565066 0.43722768391519673 0.8669090158438948 0.9141275900431958 0.1498014749625739 0.947950564671726 0.028927849270227735) (0.1704752010940761 0.010257951778512742 0.13948820415291585 0.6770350122524923 0.6503753624725881 0.5231009507997271 0.7392879781740241 0.7357206317573957) (0.5645112066944183 0.7662716322091028 0.18018292813622883 0.2226175288514154 0.7644804321721395 0.13876929482045175 0.18487289035613186 0.4359713938282871) (0.9170306568749444 0.7413892641980436 0.6627647270514831 0.5523010863526678 0.8973090006130502 0.6351433280123675 0.4048698515480753 0.4106480357058985) (0.21449658062090993 0.408710821757453 0.9398245743459434 0.9865814796300149 0.04339401329728576 0.6562899586133418 0.32362302927295417 0.37088822321594217))
    (0.685822480564657 0.08403182909725015 0.8140528362181393 0.9760567977644669 0.9746436462362342)
    3
)

; !(max [
;     ([0.1, 0.2, 0.3, 0.4], 0.5),  
;     ([0.5, 0.6, 0.7, 0.8], 0.8),
;     ([0.9, 0.1, 0.2, 0.3], 0.6)]  lambda x: x[1])

; !(map-atom (
;     ((0.1 0.2 0.3 0.4) 0.5)  
;     ((0.5 0.6 0.7 0.8) 0.8)
;     ((0.9 0.1 0.2 0.3) 0.6)) $x (if (== (get-second $x) 0.8) $x ()) )
