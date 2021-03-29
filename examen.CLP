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


=>

(retract ?f)
(assert (numeros $?rest1 (* ?x ?y))))



(defrule dividir
?f <- (numeros $?rest1 ?x ?y )

(test (=(mod ?x ?y) 0))


=>

(retract ?f)
(assert (numeros $?rest1 (div ?x ?y))))



(defrule restar
?f <- (numeros $?rest1 ?x ?y)
(test(>= ?x ?y))

=>

(retract ?f)
(assert (numeros $?rest1 (- ?x ?y))))




(defrule sumar
?f <- (numeros $?rest1 ?x ?y)

=>

(retract ?f)
(assert (numeros $?rest1 (+ ?x ?y))))




