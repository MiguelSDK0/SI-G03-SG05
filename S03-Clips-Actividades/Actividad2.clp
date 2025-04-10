(deftemplate numero
   (slot valor))

(deftemplate suma
   (slot total))

; Batería de pruebas: lista de números
(deffacts datos-prueba
   (numero (valor 5))
   (numero (valor 2))
   (numero (valor 8))
   (numero (valor 1))
   (numero (valor 4)))

; Inicializar la suma en cero
(defrule inicializar-suma
   (not (suma (total ?)))
   =>
   (assert (suma (total 0))))

; Regla para acumular la suma de los valores
(defrule acumular-suma
   ?n <- (numero (valor ?v))
   ?s <- (suma (total ?t))
   =>
   (retract ?n)
   (retract ?s)
   (assert (suma (total (+ ?t ?v)))))

; Regla para mostrar el total cuando ya no hay más números
(defrule mostrar-suma
   (suma (total ?total))
   (not (numero (valor ?)))
   =>
   (printout t crlf "La suma total es: " ?total crlf))