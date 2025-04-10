(deftemplate numero
   (slot valor))

(deftemplate minimo
   (slot valor))

; Batería de pruebas
(deffacts datos-prueba
   (numero (valor 5))
   (numero (valor 2))
   (numero (valor 8))
   (numero (valor 1))
   (numero (valor 4)))

; Regla para insertar el primer valor como mínimo
(defrule inicializar-minimo
   ?n <- (numero (valor ?v))
   (not (minimo (valor ?)))
   =>
   (assert (minimo (valor ?v))))

; Regla para actualizar si se encuentra un número menor
(defrule actualizar-minimo
   ?n <- (numero (valor ?v1))
   ?m <- (minimo (valor ?v2))
   (test (< ?v1 ?v2))
   =>
   (retract ?m)
   (assert (minimo (valor ?v1))))

; Regla para imprimir el resultado
(defrule mostrar-minimo
   (minimo (valor ?v))
   =>
   (printout t crlf "El valor mínimo es: " ?v crlf))