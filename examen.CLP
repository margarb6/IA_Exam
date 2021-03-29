(deffacts numeros-iniciales (numeros 5 3 8 14 7)
(resultado 21))



(defrule final
(declare (salience 100))
(resultado ?r)
(numeros ?n)

(test (= ?n ?r))
=>
(halt))



(defrule multiplicar
?f <- (numeros $?rest1 ?x ?y )
(test(not (and (= (length ?rest1) 0) (!= (* ?x ?y) 21))))


=>

(retract ?f)
(assert (numeros $?rest1 (* ?x ?y)))
(printout t "Lista: " numeros $?rest1 (* ?x ?y) crlf))




(defrule dividir
?f <- (numeros $?rest1 ?x ?y )

(test (=(mod ?x ?y) 0))
(test(not (and (= (length ?rest1) 0) (!= (div ?x ?y) 21))))

=>

(retract ?f)
(assert (numeros $?rest1 (div ?x ?y)))
(printout t "Lista: " numeros $?rest1 (div ?x ?y) crlf))



(defrule restar
?f <- (numeros $?rest1 ?x ?y)
(test(>= ?x ?y))
(test(not (and (= (length ?rest1) 0) (!= (- ?x ?y) 21))))
=>

(retract ?f)
(assert (numeros $?rest1 (- ?x ?y)))
(printout t "Lista: " numeros $?rest1 (- ?x ?y) crlf))




(defrule sumar
?f <- (numeros $?rest1 ?x ?y)

(test(not (and (= (length ?rest1) 0) (!= (+ ?x ?y) 21))))
=>

(retract ?f)
(assert (numeros $?rest1 (+ ?x ?y)))
(printout t "Lista: " numeros $?rest1 (+ ?x ?y) crlf))




