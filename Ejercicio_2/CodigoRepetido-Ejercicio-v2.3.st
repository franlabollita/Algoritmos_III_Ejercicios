!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'FL 10/13/2021 20:12:58'!
testCommonErrorsOf: typeOfError checks: anAssertion for: blockWithError

			
		blockWithError
		on: typeOfError
		do: anAssertion! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'FL 10/13/2021 20:48:20'!
testCreateAndAddCustomerToBook: aNewCustomerName in: customerBook

	| aNewCustomer |
	
	aNewCustomer := aNewCustomerName.
	customerBook addCustomerNamed: aNewCustomerName.
	^aNewCustomer! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'FL 10/13/2021 20:32:36'!
testCustomer: aCustomerName in: customerBook

	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: aCustomerName) ! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'FL 10/13/2021 20:28:51'!
testNumberOfCustomersAfter: operationsToDo with: listOfNumbers with: lastTest

	| customerBook paulMcCartney numberActual |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	operationsToDo value: paulMcCartney  value: customerBook .
	
	numberActual := listOfNumbers at: 1.
	self assert: numberActual equals: customerBook numberOfActiveCustomers.
	
	numberActual := listOfNumbers at: 2.
	self assert: numberActual equals: customerBook numberOfSuspendedCustomers.
	
	numberActual := listOfNumbers at: 3.
	self assert: numberActual equals: customerBook numberOfCustomers.
	
	lastTest value: customerBook value: paulMcCartney .! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'FL 10/14/2021 16:15:05'!
testTimeOfOperacionIn: tiempoAMedir of: unBloque with: condicionesPrevias

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	condicionesPrevias .
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	unBloque .
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (tiempoAMedir * millisecond)
	! !


!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/12/2021 19:38:02'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self testTimeOfOperacionIn: 50 of: [customerBook addCustomerNamed: 'John Lennon'] with: nil.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/12/2021 19:38:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self testTimeOfOperacionIn: 100 of: [customerBook removeCustomerNamed: 'paulMcCartney'] with: [customerBook addCustomerNamed: 'paulMcCartney'.].


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:16:03'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self testCommonErrorsOf: Error checks:	 [ :anError |
											self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 															
											self assert: customerBook isEmpty 
								]
								for: [
									customerBook addCustomerNamed: ''
								]


! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:16:47'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := self testCreateAndAddCustomerToBook: 'johnLennon' in: customerBook .
	
	self testCommonErrorsOf:  NotFound checks:	[
											self testCustomer: johnLennon in: customerBook 
									] 
									for: [ 
											customerBook removeCustomerNamed: 'Paul McCartney'.
											self fail.
									] 

	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:17:14'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| listOfNumbers |
	listOfNumbers := #(0 1 1).
	
	self testNumberOfCustomersAfter: [: customer :customerBook |
									customerBook addCustomerNamed: customer .
									customerBook suspendCustomerNamed: customer .
							] 
						with: listOfNumbers 
						with: [: customerBook :paulMcCartney | 
									self assert: (customerBook includesCustomerNamed: paulMcCartney ).
						]
	
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:17:33'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| listOfNumbers |
	listOfNumbers := #(0 0 0).
	

	self testNumberOfCustomersAfter: [: customer :customerBook |
									customerBook addCustomerNamed: customer .
									customerBook suspendCustomerNamed: customer .
									customerBook removeCustomerNamed: customer.
							] 
						with: listOfNumbers 
						with: [:customerBook : paulMcCartney | 
									self deny: (customerBook includesCustomerNamed: paulMcCartney).
							]
							
	


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:18:29'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := self testCreateAndAddCustomerToBook: 'johnLennon' in: customerBook .
	
	self testCommonErrorsOf: CantSuspend checks:	 [
												self testCustomer: johnLennon in: customerBook 
										] 
									      for: [ 
												customerBook suspendCustomerNamed: 'Ringo Starr'.
												self fail.
										] 
	

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'FL 10/14/2021 16:28:43'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := self testCreateAndAddCustomerToBook: 'johnLennon' in: customerBook .
	customerBook suspendCustomerNamed: johnLennon.
	
	self testCommonErrorsOf: CantSuspend checks: [
												self testCustomer: johnLennon in: customerBook 
										]
										for: [ 
												customerBook suspendCustomerNamed: johnLennon .
												self fail.
										]
					   

! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'FL 10/13/2021 17:33:15'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self  numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'FL 10/13/2021 17:46:49'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
