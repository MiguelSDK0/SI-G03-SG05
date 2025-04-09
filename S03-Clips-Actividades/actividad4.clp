; Plantilla Pais con nombre y bandera (multislot)
(deftemplate Pais
   (slot Nombre)      ; Nombre del pais
   (multislot Bandera) ; Colores de la bandera
)

; Hechos de ejemplo con paises y sus banderas
(deffacts paises
   (Pais (Nombre "Peru")   (Bandera Blanco Rojo))
   (Pais (Nombre "Brasil") (Bandera Verde Amarillo Azul Blanco))
   (Pais (Nombre "Espana") (Bandera Rojo Amarillo))
   (Pais (Nombre "Francia") (Bandera Azul Blanco Rojo))
   (Pais (Nombre "Colombia") (Bandera Amarillo Azul Rojo))
   (Pais (Nombre "Argentina") (Bandera Celeste Blanco))
   (Pais (Nombre "Chile") (Bandera Rojo Blanco Azul))
   (Pais (Nombre "Italia") (Bandera Verde Blanco Rojo))
   (Pais (Nombre "EEUU") (Bandera Rojo Blanco Azul))
   (Pais (Nombre "Mexico") (Bandera Verde Blanco Rojo))
   (Pais (Nombre "Alemania") (Bandera Negro Rojo Amarillo))
   (Pais (Nombre "India") (Bandera Naranja Blanco Verde))
   (Pais (Nombre "Rusia") (Bandera Blanco Azul Rojo))
)

; Variables globales para el resultado y los colores buscados
(defglobal ?*resultado* = FALSE)
(defglobal ?*colores* = nil)

; Regla que busca paises con los colores especificados
(defrule buscar-colores
   ?p <- (Pais (Nombre ?nombre) (Bandera $?bandera))  ; Pais y su bandera
   (ColoresABuscar $?colores)  ; Colores a buscar
   =>
   (bind ?todos-colores-encontrados TRUE)  ; Inicializa como verdadero
   (foreach ?c $?colores  ; Itera sobre los colores a buscar
      (if (not (member$ ?c $?bandera)) then  ; Si el color no está en la bandera
         (bind ?todos-colores-encontrados FALSE)
      )
   )
   (if ?todos-colores-encontrados then  ; Si todos los colores fueron encontrados
      (printout t "- " ?nombre " tiene los colores buscados." crlf)
      (bind ?*resultado* TRUE)
   )
)

; Funcion que pide los colores y realiza la busqueda
(deffunction pedir-colores ()
   (bind ?*resultado* FALSE)
   (do-for-all-facts ((?f ColoresABuscar)) (retract ?f))  ; Borra cualquier hecho previo
   (printout t "Introduce los colores a buscar (separados por espacios, ej. Blanco Rojo): " crlf)
   (bind ?*colores* (read))  ; Lee los colores introducidos por el usuario
   (assert (ColoresABuscar ?*colores*))  ; Aserta el hecho de los colores a buscar
   (run)  ; Ejecuta las reglas
   (if (eq ?*resultado* FALSE) then  ; Si no se encontraron resultados
      (printout t "No se encontraron paises con los colores especificados" crlf)
   )
)

; Funcion que inicia el proceso
(deffunction iniciar ()
   (reset)
   (pedir-colores)
   (return)
)
