(deftemplate cadena
   (multislot lista)  ; Define un template para la estructura de las cadenas
)

(deftemplate union
   (multislot elementos)  ; Define un template para almacenar la union
)

(deffacts datos-iniciales
   (cadena (lista B C A D E E B C E))  ; Hecho con el primer vector
   (cadena (lista E E B C A F E))  ; Hecho con el segundo vector
)

(defrule calcular-union
   ?c1 <- (cadena (lista $?l1))  ; Se obtiene el primer vector
   ?c2 <- (cadena (lista $?l2))  ; Se obtiene el segundo vector
   (not (union (elementos $?)))  ; Evita crear mas de una union
   =>
   (bind ?res (create$))  ; Inicializa el vector vacio para la union
   (foreach ?x ?l1  ; Itera sobre los elementos del primer vector
      (if (and (member$ ?x ?l2) (not (member$ ?x ?res))) then  ; Verifica si el elemento esta en el segundo vector y si no ha sido agregado
         (bind ?res (create$ ?res ?x))  ; Agrega el elemento a la union
      )
   )
   (printout t "union = " ?res crlf)  ; Imprime la union calculada
   (assert (union (elementos ?res)))  ; Almacena el resultado en la base de hechos
)
