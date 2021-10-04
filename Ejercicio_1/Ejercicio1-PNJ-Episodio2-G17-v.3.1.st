!classDefinition: #CarolinaLaCuranderaDeSkyrimNPC category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrimNPC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrimNPC class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrimNPC class
	instanceVariableNames: 'frasesDesconocido frasesPrometedor cantidadDeInteraccionesConUnPersonaje'!

!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'interacciones' stamp: 'FL 10/2/2021 20:11:47'!
interactuarCon: unPersonajeJugadorAInteractuar
		self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
		^self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.! !

!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'interacciones' stamp: 'FL 10/2/2021 20:11:47'!
olvidar
	cantidadDeInteraccionesConUnPersonaje := Dictionary new! !


!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 10/3/2021 20:10:26'!
cambiarOpinionYReiniciarInteracciones: UnPersonajeAInteractuar
	cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar put: 0.
	PuebloRiverwoodDeSkyrim cambiarOpinionDelPuebloAPrometedor: UnPersonajeAInteractuar .
	TreborElGuardiaDeSkyrimNPC cambiarOpinionYReiniciarInteracciones: UnPersonajeAInteractuar.
	! !

!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 10/3/2021 14:03:42'!
recordarInteraccionCon: UnPersonajeAInteractuar
	| cantidadDeInteracciones2 |
	cantidadDeInteracciones2 := cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar ifAbsent: [0].
	cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar put: cantidadDeInteracciones2 + 1.! !

!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 10/3/2021 14:09:18'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	| cantidadDeInteracciones grupoDeFrasesCorrespondiente |
	cantidadDeInteracciones := cantidadDeInteraccionesConUnPersonaje at: unPersonajeJugadorAInteractuar.
	grupoDeFrasesCorrespondiente := PuebloRiverwoodDeSkyrim devolverOpinionDeUnPersonaje: unPersonajeJugadorAInteractuar .
	(grupoDeFrasesCorrespondiente = 'Desconocido')
	ifTrue: [
		(cantidadDeInteracciones  = 3) ifTrue: [self cambiarOpinionYReiniciarInteracciones: unPersonajeJugadorAInteractuar.] .
		^ frasesDesconocido at: (cantidadDeInteracciones min: frasesDesconocido size).
	]
	ifFalse: [^ frasesPrometedor at: (cantidadDeInteracciones min: frasesPrometedor size)].! !


!CarolinaLaCuranderaDeSkyrimNPC class methodsFor: 'as yet unclassified' stamp: 'FL 10/3/2021 21:09:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesConUnPersonaje := ((Dictionary new) add: (HamiltonPJ->0); add: (TirionPJ->0); yourself).! !


!classDefinition: #HamiltonPJ category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #HamiltonPJ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:09:06'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/30/2021 19:08:45'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Bienvenido aventurero!!'. ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FL 10/2/2021 20:40:45'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeSkyrimNPC ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FL 10/2/2021 20:40:56'!
hamilton
	^ HamiltonPJ ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FL 10/2/2021 17:46:57'!
tirion
	^TirionPJ ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FL 10/2/2021 17:35:24'!
treborElGuardia
	^ TreborElGuardiaDeSkyrimNPC ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/3/2021 20:03:48'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	| opinion |
	opinion := PuebloRiverwoodDeSkyrim devolverOpinionDeUnPersonaje: unPersonaje.
	^opinion = 'Prometedor' .
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 20:41:49'!
hacerQueLaCuranderaOlvideSusInteracciones
	^CarolinaLaCuranderaDeSkyrimNPC olvidar ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 20:42:30'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^PuebloRiverwoodDeSkyrim olvidarOpiniones ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 20:43:00'!
hacerQueRiverwoodVeaPrometedorAHamilton
	^PuebloRiverwoodDeSkyrim cambiarOpinionDelPuebloAPrometedor: HamiltonPJ ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FL 10/2/2021 17:36:59'!
hamilton
	^HamiltonPJ ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FL 10/2/2021 17:37:17'!
tirion
	^TirionPJ ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FL 10/2/2021 17:26:30'!
treborElGuardia
	^ TreborElGuardiaDeSkyrimNPC ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 17:28:38'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrimNPC olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 20:04:07'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwoodDeSkyrim olvidarOpiniones .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FL 10/2/2021 20:03:55'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwoodDeSkyrim cambiarOpinionDelPuebloAPrometedor: HamiltonPJ .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloRiverwoodDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloRiverwoodDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloRiverwoodDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloRiverwoodDeSkyrim class
	instanceVariableNames: 'opinionesDePersonajesDeRiverwood'!

!PuebloRiverwoodDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FL 10/2/2021 16:34:55'!
cambiarOpinionDelPuebloAPrometedor: UnPersonajeAModificar
	opinionesDePersonajesDeRiverwood at: UnPersonajeAModificar put: 'Prometedor'.
	! !

!PuebloRiverwoodDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FL 10/2/2021 19:11:52'!
devolverOpinionDeUnPersonaje: UnPersonajeAAgregar
	| opinionDelPuebloDelPersonaje |
	opinionDelPuebloDelPersonaje := opinionesDePersonajesDeRiverwood at: UnPersonajeAAgregar ifAbsent: [
		opinionesDePersonajesDeRiverwood at: UnPersonajeAAgregar put: 'Desconocido'. 
		opinionDelPuebloDelPersonaje := 'Desconocido'.].
	^opinionDelPuebloDelPersonaje ! !

!PuebloRiverwoodDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FL 10/3/2021 21:09:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDePersonajesDeRiverwood := ((Dictionary new) add: (HamiltonPJ->'Prometedor'); yourself).! !

!PuebloRiverwoodDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FL 10/2/2021 18:43:26'!
olvidarOpiniones
	opinionesDePersonajesDeRiverwood := Dictionary new! !


!classDefinition: #TirionPJ category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TirionPJ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #TreborElGuardiaDeSkyrimNPC category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrimNPC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrimNPC class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrimNPC class
	instanceVariableNames: 'frasesDesconocido frasesPrometedor cantidadDeInteraccionesConUnPersonaje'!

!TreborElGuardiaDeSkyrimNPC class methodsFor: 'interacciones' stamp: 'FL 9/30/2021 14:34:13'!
interactuarCon: unPersonajeJugadorAInteractuar
		self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
		^self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.! !

!TreborElGuardiaDeSkyrimNPC class methodsFor: 'interacciones' stamp: 'FL 9/30/2021 14:19:55'!
olvidar
	cantidadDeInteraccionesConUnPersonaje := Dictionary new! !


!TreborElGuardiaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 10/3/2021 20:13:49'!
cambiarOpinionYReiniciarInteracciones: UnPersonajeAInteractuar
	cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar put: 0.! !

!TreborElGuardiaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 9/30/2021 14:16:57'!
recordarInteraccionCon: UnPersonajeAInteractuar
	| cantidadDeInteracciones2 |
	cantidadDeInteracciones2 := cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar ifAbsent: [0].
	cantidadDeInteraccionesConUnPersonaje at: UnPersonajeAInteractuar put: cantidadDeInteracciones2 + 1.! !

!TreborElGuardiaDeSkyrimNPC class methodsFor: 'interacciones - privado' stamp: 'FL 10/2/2021 20:00:29'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	| cantidadDeInteracciones grupoDeFrasesCorrespondiente |
	cantidadDeInteracciones := cantidadDeInteraccionesConUnPersonaje at: unPersonajeJugadorAInteractuar.
	grupoDeFrasesCorrespondiente := PuebloRiverwoodDeSkyrim devolverOpinionDeUnPersonaje: unPersonajeJugadorAInteractuar .
	(grupoDeFrasesCorrespondiente = 'Desconocido')
	ifTrue: [^ frasesDesconocido at: (cantidadDeInteracciones min: frasesDesconocido size)]
	ifFalse: [^ frasesPrometedor at: (cantidadDeInteracciones min: frasesPrometedor size)].! !


!TreborElGuardiaDeSkyrimNPC class methodsFor: 'as yet unclassified' stamp: 'FL 10/3/2021 21:09:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesConUnPersonaje := ((Dictionary new) add: (HamiltonPJ->2); yourself).! !

CarolinaLaCuranderaDeSkyrimNPC initializeAfterFileIn!
PuebloRiverwoodDeSkyrim initializeAfterFileIn!
TreborElGuardiaDeSkyrimNPC initializeAfterFileIn!