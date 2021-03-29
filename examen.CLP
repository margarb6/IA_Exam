(deffacts numeros-iniciales (numeros 5 3 8 14 7 profundidad 10)
(resultado 21))



(defrule final
(declare (salience 100))
(numeros ?n profundidad ?p)
(resultado ?r)
(test ( = ?r ?n))
=>
(halt))



(defrule multiplicar
?f <- (numeros ?x ?y $?rest1 profundidad ?p)
(test(> ?p 0))

=>


(assert (numeros (* ?x ?y) $?rest1 profundidad (- ?p 1)))
(printout t "Lista: " numeros (* ?x ?y) $?rest1 crlf))




(defrule dividir
?f <- (numeros  ?x ?y $?rest1 profundidad ?p)
(test(> ?p 0))
(test (=(mod ?x ?y) 0))

=>


(assert (numeros (div ?x ?y) $?rest1 profundidad (- ?p 1)))
(printout t "Lista: " numeros (div ?x ?y) $?rest1 crlf))



(defrule restar
?f <- (numeros  ?x ?y $?rest1 profundidad ?p)
(test(> ?p 0))
(test(>= ?x ?y))
=>


(assert (numeros (- ?x ?y) $?rest1 profundidad (- ?p 1)))
(printout t "Lista: " numeros (- ?x ?y) $?rest1 crlf))




(defrule sumar
?f <- (numeros  ?x ?y $?rest1 profundidad ?p)
(test(> ?p 0))
=>


(assert (numeros (+ ?x ?y) $?rest1 profundidad (- ?p 1)))
(printout t "Lista: " numeros (+ ?x ?y) $?rest1 crlf))




