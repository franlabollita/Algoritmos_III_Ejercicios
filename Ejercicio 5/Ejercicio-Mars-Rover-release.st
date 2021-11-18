!classDefinition: #MarsRoverTest category: 'Ejercicio-Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:46:42'!
test01ARoverCanReturnItsPosition

	| aRover assertion |
	
	aRover := MarsRover new.
	assertion := (aRover roverPosition = (0 @ 0)).
	self assert: (assertion).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:47:53'!
test02ARoverCanReturnItsDirection

	| aRover |
	
	aRover := MarsRover new.
	self assert: (aRover roverDirection isKindOf: North )! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:48:39'!
test03ARoverCanRotateToTheLeft

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'l'.
	self assert: (aRover roverDirection isKindOf: West)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:49:49'!
test04ARoverCanRotateToTheRight

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'r'.
	self assert: (aRover roverDirection isKindOf: East)! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:50:33'!
test05ARoverCanGoForward

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'f'.
	self assert: (aRover roverPosition = (0 @ 1))
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:51:07'!
test06ARoverCanGoBackwards

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'b'.
	self assert: (aRover roverPosition = (0 @ -1))
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:52:37'!
test07ARoverWontOperateAnInvalidInstruction

	| aRover |
	
	aRover := MarsRover new.
	self
		should: [ aRover operate: 'g'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover errorInvalidInstruction]
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:54:06'!
test08ARoverCanTurnLeftAndGoFoward

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'r'.
	aRover operate: 'f'.
	self assert: (aRover roverPosition = (1 @ 0))
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:54:45'!
test09ARoverCanTurnTwice

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'r'.
	aRover operate: 'r'.
	self assert: (aRover roverDirection isKindOf: South)
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:55:37'!
test10ARoverCanUnderstandAStringWithTwoCharacters

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'ff'.
	self assert: (aRover roverPosition = (0 @ 2))! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:59:04'!
test11ARoverCanUnderstandAStringWithTwoDifferentCharacters

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'rf'.
	self assert: (aRover roverPosition = (1 @ 0))! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 13:59:59'!
test12ARoverCanUnderstandAStringWithThreeDifferentCharacters

	| aRover |
	
	aRover := MarsRover new.
	aRover operate: 'brf'.
	self assert: (aRover roverPosition = (1 @ -1))! !

!MarsRoverTest methodsFor: 'testing' stamp: 'FL 11/18/2021 14:02:10'!
test13ARoverStopsInTheMiddleOfAStringIfItDetectsAnInvalidCharacter

	| aRover |
	
	aRover := MarsRover new.
	self
		should: [aRover operate: 'bgf'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover errorInvalidInstruction.
			self assert: (aRover roverPosition = (0 @ -1))]

	
	! !


!classDefinition: #Compass category: 'Ejercicio-Mars-Rover'!
Object subclass: #Compass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Compass methodsFor: 'operations' stamp: 'FL 11/18/2021 13:00:16'!
backward: aRover with: aPosition with: aStringOfOperations
	
		self subclassResponsibility ! !

!Compass methodsFor: 'operations' stamp: 'FL 11/18/2021 13:05:39'!
forward: aRover with: aPosition with: aStringOfOperations
	
		self subclassResponsibility ! !

!Compass methodsFor: 'operations' stamp: 'FL 11/18/2021 13:14:47'!
left: aRover with: aPosition with: aStringOfOperations
	
		self subclassResponsibility ! !

!Compass methodsFor: 'operations' stamp: 'FL 11/18/2021 13:19:49'!
right: aRover with: aPosition with: aStringOfOperations
	
		self subclassResponsibility ! !


!classDefinition: #East category: 'Ejercicio-Mars-Rover'!
Compass subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!East methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:02'!
backward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (-1 @ 0).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!East methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
forward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (1 @ 0).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!East methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
left: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassNorth.
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!East methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
right: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassSouth .
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !


!classDefinition: #North category: 'Ejercicio-Mars-Rover'!
Compass subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!North methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
backward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (0 @ -1).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!North methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
forward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (0 @ 1).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!North methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:04'!
left: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: (aRover compassWest). 
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!North methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
right: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: (aRover compassEast ). 
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !


!classDefinition: #South category: 'Ejercicio-Mars-Rover'!
Compass subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!South methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
backward: aRover with: aPosition with: aStringOfOperations


	aRover changePosition: (0 @ 1).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!South methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:04'!
forward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (0 @ -1).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!South methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:04'!
left: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassEast .
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!South methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
right: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassWest.
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !


!classDefinition: #West category: 'Ejercicio-Mars-Rover'!
Compass subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!West methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:04'!
backward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (1 @ 0).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!West methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:04'!
forward: aRover with: aPosition with: aStringOfOperations

	aRover changePosition: (-1 @ 0).
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!West methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
left: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassSouth .
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !

!West methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:03'!
right: aRover with: aPosition with: aStringOfOperations

	aRover changeDirection: aRover compassNorth.
	^aRover operateACharacterIn: aStringOfOperations with: aPosition + 1! !


!classDefinition: #MarsRover category: 'Ejercicio-Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction N E S W'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'FL 11/18/2021 13:36:39'!
initialize

	
	N := North new.
	E := East new.
	S := South new.
	W := West new.
	
	direction := N.
	position := (0 @ 0).
	! !


!MarsRover methodsFor: 'operations' stamp: 'FL 11/18/2021 13:39:50'!
changeDirection: aDirection
	direction := aDirection .! !

!MarsRover methodsFor: 'operations' stamp: 'FL 11/18/2021 13:40:10'!
changePosition: aCoordenate
	position := position + aCoordenate .! !

!MarsRover methodsFor: 'operations' stamp: 'FL 11/18/2021 13:41:50'!
operate: aStringOfOperations

	^self operateACharacterIn: aStringOfOperations with: 1. ! !

!MarsRover methodsFor: 'operations' stamp: 'FL 11/18/2021 13:45:10'!
operateACharacterIn: aStringOfOperations with: aPosition

	| anOperation selectedSubclass selectedOperation |
	
	(aPosition > aStringOfOperations size) ifTrue: [^self class operacionFinalizada].
	
	anOperation := aStringOfOperations at: aPosition .
	
	selectedSubclass := Operacion subclasses detect: [:subclass | (subclass canOperate: anOperation )] ifNone: [^self error: self class errorInvalidInstruction.].
	
	selectedOperation := selectedSubclass new.
	
	^selectedOperation operateIn: direction with: self and: aPosition and: aStringOfOperations.
! !


!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:36:04'!
compassEast
	^E ! !

!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:36:09'!
compassNorth
	^N! !

!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:36:14'!
compassSouth
	^S! !

!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:36:20'!
compassWest
	^W! !

!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:33:49'!
roverDirection
	^direction ! !

!MarsRover methodsFor: 'instances' stamp: 'FL 11/18/2021 13:33:36'!
roverPosition
	^position ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'TD 11/16/2021 11:44:40'!
errorInvalidInstruction
	^'Invalid instruction, command processing interrupted'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FL 11/16/2021 12:54:12'!
operacionFinalizada
	^'Se realizo la operacion con exito.'! !


!classDefinition: #Operacion category: 'Ejercicio-Mars-Rover'!
Object subclass: #Operacion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Operacion methodsFor: 'operations' stamp: 'FL 11/18/2021 13:26:51'!
operateIn: aDirection with: aRover and: aPosition and: aStringOfOperations
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Operacion class' category: 'Ejercicio-Mars-Rover'!
Operacion class
	instanceVariableNames: ''!

!Operacion class methodsFor: 'as yet unclassified' stamp: 'FL 11/18/2021 12:47:00'!
canOperate: operation
	self subclassResponsibility ! !


!classDefinition: #Back category: 'Ejercicio-Mars-Rover'!
Operacion subclass: #Back
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Back methodsFor: 'operations' stamp: 'FL 11/18/2021 13:27:52'!
operateIn: aDirection with: aRover and: aPosition and: aStringOfOperations
	^aDirection backward: aRover with: aPosition with: aStringOfOperations.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Back class' category: 'Ejercicio-Mars-Rover'!
Back class
	instanceVariableNames: ''!

!Back class methodsFor: 'as yet unclassified' stamp: 'FL 11/18/2021 12:19:04'!
canOperate: operation
	^(operation = $b)! !


!classDefinition: #Forward category: 'Ejercicio-Mars-Rover'!
Operacion subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Forward methodsFor: 'operations' stamp: 'FL 11/18/2021 13:30:08'!
operateIn: aDirection with: aRover and: aPosition and: aStringOfOperations
	^aDirection forward: aRover with: aPosition with: aStringOfOperations.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Ejercicio-Mars-Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'FL 11/18/2021 12:19:19'!
canOperate: operation
	^(operation = $f)! !


!classDefinition: #Left category: 'Ejercicio-Mars-Rover'!
Operacion subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Left methodsFor: 'operations' stamp: 'FL 11/18/2021 13:30:21'!
operateIn: aDirection with: aRover and: aPosition and: aStringOfOperations
	^aDirection left: aRover with: aPosition with: aStringOfOperations.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'Ejercicio-Mars-Rover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'FL 11/18/2021 12:19:26'!
canOperate: operation
	^(operation = $l)! !


!classDefinition: #Right category: 'Ejercicio-Mars-Rover'!
Operacion subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-Mars-Rover'!

!Right methodsFor: 'operations' stamp: 'FL 11/18/2021 13:30:33'!
operateIn: aDirection with: aRover and: aPosition and: aStringOfOperations
	^aDirection right: aRover with: aPosition with: aStringOfOperations.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Ejercicio-Mars-Rover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'FL 11/18/2021 12:19:35'!
canOperate: operation
	^(operation = $r)! !
