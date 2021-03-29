(deffacts numeros-iniciales (numeros 5 3 8 14 7)
(resultado 21)

(defrule multiplicar
?f <- (numeros $?rest1 ?x ?y $?rest2)

=>

(retract ?f)
(assert (numeros $?rest1 (* ?x ?y) $?rest2)))



(defrule restar
?f <- (numeros $?rest1 ?x ?y $?rest2)
(test(>= ?x ?y))

=>

(retract ?f)
(assert (numeros $?rest1 (- ?x ?y) $?rest2)))