!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'FL 11/2/2021 15:02:24'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'FL 11/2/2021 15:19:29'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'modularization - private' stamp: 'FL 11/4/2021 13:29:57'!
assertError: anError when: somethingHappens

	self
		should: [somethingHappens  value]
		raise: Error
		withExceptionDo: [ :error |
						self assert: error messageText = anError value].! !

!SentenceFinderByPrefixTest methodsFor: 'modularization - private' stamp: 'FL 11/4/2021 12:40:02'!
assertResultIsCorrectOf: listOfResults inPosition: aPosition equals: aString

	| individualResult |
	
	individualResult := listOfResults at: aPosition.
	self assert: (individualResult = aString).
	! !

!SentenceFinderByPrefixTest methodsFor: 'modularization - private' stamp: 'FL 11/4/2021 14:43:30'!
assertStackDoesNotChange: aStack

	| stackCollection base |
	
	self assert: (aStack size = 9).
	
	stackCollection  := aStack returnStack .
	
	base := stackCollection at: 1.
	self assert: (base isKindOf: BaseContainer).
	
	self assertStackIsCorrectOf: stackCollection inPosition: 2 equals: 'hola'.
	self assertStackIsCorrectOf: stackCollection inPosition: 3 equals: 'Hola'.
	self assertStackIsCorrectOf: stackCollection inPosition: 4 equals: 'Helado'.
	self assertStackIsCorrectOf: stackCollection inPosition: 5 equals: 'Hol and'.
	self assertStackIsCorrectOf: stackCollection inPosition: 6 equals: 'Holanda'.
	self assertStackIsCorrectOf: stackCollection inPosition: 7 equals: 'Chau'.
	self assertStackIsCorrectOf: stackCollection inPosition: 8 equals: 'auto'.
	self assertStackIsCorrectOf: stackCollection inPosition: 9 equals: 'automovil'.
	self assertStackIsCorrectOf: stackCollection inPosition: 10 equals: 'automoviles'.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'modularization - private' stamp: 'FL 11/4/2021 14:21:56'!
assertStackIsCorrectOf: stackCollection inPosition: aPosition equals: aString

	| individualResult |
	
	individualResult := stackCollection at: aPosition.
	self assert: (individualResult returnValue = aString).
	! !

!SentenceFinderByPrefixTest methodsFor: 'modularization - private' stamp: 'FL 11/4/2021 13:00:23'!
stackWithStrings

	| stack |

	stack := OOStack new.
	
	stack push: 'hola'.
	stack push: 'Hola'.
	stack push: 'Helado'.
	stack push: 'Hol and'.
	stack push: 'Holanda'.
	stack push: 'Chau'.
	stack push: 'auto'.
	stack push: 'automovil'.
	stack push: 'automoviles'.	
	
	^stack! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:04:52'!
test01SentenceFinderReturnsAnErrorIfStackIsEmpty

	| emptyStack sentenceFinder  |
	
	emptyStack := OOStack new.	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assertError: [OOStack stackEmptyErrorDescription] when: [ sentenceFinder find: 'H' in: emptyStack].
	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:25'!
test02SentenceFinderReturnsCorrectSentenceForExactMatch

	|  listOfResults stack sentenceFinder |
	
	stack := self stackWithStrings .
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	listOfResults := sentenceFinder find: 'Chau' in: stack. 
	self assert: (listOfResults size = 1).
	self assertResultIsCorrectOf: listOfResults inPosition: 1 equals: 'Chau'.
	
	self assertStackDoesNotChange: stack.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:11'!
test03SentenceFinderReturnsCorrectSentenceForPartialMatch

	|  listOfResults stack sentenceFinder |
	
	stack := self stackWithStrings .
	sentenceFinder := SentenceFinderByPrefix new.
	
	listOfResults := sentenceFinder find: 'Holand' in: stack. 
	self assert: (listOfResults size = 1).
	self assertResultIsCorrectOf: listOfResults inPosition: 1 equals: 'Holanda'.
	
	self assertStackDoesNotChange: stack.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:31'!
test04SentenceFinderReturnsNothingForWrongCasedOrSpacedMatches

	|  listOfResults stack sentenceFinder |
	
	stack := self stackWithStrings .
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	listOfResults := sentenceFinder find: 'chau' in: stack. 
	self assert: (listOfResults size = 0).
	self assert: (listOfResults isEmpty ).
	
	self assertStackDoesNotChange: stack.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:37'!
test05SentenceFinderReturnsACollectionForMultipleMatches

	|  listOfResults stack sentenceFinder |
	
	stack := self stackWithStrings .
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	listOfResults := sentenceFinder find: 'Hol' in: stack. 
	self assert: (listOfResults size = 3).
	self assertResultIsCorrectOf: listOfResults inPosition: 1 equals: 'Hola'.
	self assertResultIsCorrectOf: listOfResults inPosition: 2 equals: 'Hol and'.
	self assertResultIsCorrectOf: listOfResults inPosition: 3 equals: 'Holanda'.
	
	self assertStackDoesNotChange: stack.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:43'!
test06SentenceFinderReturnsAnErrorWhenTheSentenceToFindIsEmpty

	|  stack sentenceFinder |
	
	stack := self stackWithStrings .
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assertError: [SentenceFinderByPrefix sentenceFinderInvalidSentenceError] when: [ sentenceFinder find: '' in: stack].
	
	self assertStackDoesNotChange: stack.

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 14:40:52'!
test07SentenceFinderReturnsAnErrorWhenTheSentenceToFindIsHasBlankSpaces

	|  stack sentenceFinder |
	
	stack := self stackWithStrings .
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self assertError: [SentenceFinderByPrefix sentenceFinderInvalidSentenceError] when: [ sentenceFinder find: ' ' in: stack].
	
	self assertStackDoesNotChange: stack.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FL 11/4/2021 15:08:32'!
test08SentenceFinderReturnsCorrectSentenceWhenPrefixIsLargerThanAStackElement

	|  listOfResults stack sentenceFinder |
	
	stack := self stackWithStrings .
	sentenceFinder := SentenceFinderByPrefix new.
	
	listOfResults := sentenceFinder find: 'automoviles' in: stack. 
	self assert: (listOfResults size = 1).
	self assertResultIsCorrectOf: listOfResults inPosition: 1 equals: 'automoviles'.
	
	self assertStackDoesNotChange: stack.
	
	
	! !


!classDefinition: #Container category: 'Stack-Exercise'!
Object subclass: #Container
	instanceVariableNames: 'valor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Container methodsFor: 'as yet unclassified' stamp: 'FL 11/2/2021 18:05:20'!
assignAValue: aValue
	self subclassResponsibility ! !

!Container methodsFor: 'as yet unclassified' stamp: 'FL 11/2/2021 13:06:40'!
initialize
	self subclassResponsibility ! !

!Container methodsFor: 'as yet unclassified' stamp: 'FL 11/2/2021 19:12:32'!
popContainer: unStack in: aStack
	self subclassResponsibility ! !

!Container methodsFor: 'as yet unclassified' stamp: 'FL 11/2/2021 19:05:53'!
returnTopElementIn: aStack
	self subclassResponsibility.! !


!classDefinition: #BaseContainer category: 'Stack-Exercise'!
Container subclass: #BaseContainer
	instanceVariableNames: 'emptyBaseValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseContainer methodsFor: 'initialization' stamp: 'FL 11/3/2021 17:40:56'!
initialize
	emptyBaseValue := nil.! !


!BaseContainer methodsFor: 'operations' stamp: 'FL 11/2/2021 19:24:43'!
popContainer: aStackOfElements in: aOOStack
	aOOStack raiseEmptyStackError ! !

!BaseContainer methodsFor: 'operations' stamp: 'FL 11/2/2021 19:24:59'!
returnTopElementIn: aOOStack
	aOOStack raiseEmptyStackError ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BaseContainer class' category: 'Stack-Exercise'!
BaseContainer class
	instanceVariableNames: ''!

!BaseContainer class methodsFor: 'as yet unclassified' stamp: 'FL 11/2/2021 18:17:05'!
initializeBase
	^self new initialize ! !


!classDefinition: #ContainerWithElements category: 'Stack-Exercise'!
Container subclass: #ContainerWithElements
	instanceVariableNames: 'containerValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContainerWithElements methodsFor: 'stack operations' stamp: 'FL 11/2/2021 19:23:47'!
popContainer: aStackOfElements in: aOOStack

	aStackOfElements removeLast .
	^containerValue .! !

!ContainerWithElements methodsFor: 'stack operations' stamp: 'FL 11/2/2021 19:23:55'!
returnTopElementIn: aOOStack

	^containerValue ! !


!ContainerWithElements methodsFor: 'container operations' stamp: 'FL 11/2/2021 19:23:36'!
assignAValue: aValue

	containerValue  := aValue.! !

!ContainerWithElements methodsFor: 'container operations' stamp: 'FL 11/3/2021 17:48:34'!
returnValue
	^containerValue ! !


!ContainerWithElements methodsFor: 'initialization' stamp: 'FL 11/2/2021 19:23:41'!
initialize
	containerValue = nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContainerWithElements class' category: 'Stack-Exercise'!
ContainerWithElements class
	instanceVariableNames: ''!

!ContainerWithElements class methodsFor: 'as yet unclassified' stamp: 'TD 11/1/2021 20:43:27'!
with: value
	self new initializeWith: value.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackOfElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'FL 11/2/2021 18:19:51'!
initialize

	| emptyBase |
	
	stackOfElements := OrderedCollection new.
	emptyBase := BaseContainer initializeBase .
	
	stackOfElements add: emptyBase.! !


!OOStack methodsFor: 'testing' stamp: 'FL 11/4/2021 13:38:34'!
isEmpty

	^(self size = 0)! !


!OOStack methodsFor: 'accessing' stamp: 'FL 11/4/2021 13:12:02'!
returnStack
	^stackOfElements ! !


!OOStack methodsFor: 'errors' stamp: 'FL 11/2/2021 18:08:34'!
raiseEmptyStackError

	self error: self class stackEmptyErrorDescription ! !


!OOStack methodsFor: 'operations' stamp: 'FL 11/2/2021 19:12:50'!
pop

	| poppedElement poppedValue |

	poppedElement  := stackOfElements at: (stackOfElements size) .
	
	poppedValue := poppedElement popContainer: stackOfElements in: self.
	
	^poppedValue ! !

!OOStack methodsFor: 'operations' stamp: 'FL 11/2/2021 18:20:11'!
push: aValue

	| newElement |
	
	newElement := ContainerWithElements new.
	newElement assignAValue: aValue.
	
	stackOfElements addLast: newElement.! !

!OOStack methodsFor: 'operations' stamp: 'FL 11/2/2021 18:18:53'!
size

	^stackOfElements size - 1.! !

!OOStack methodsFor: 'operations' stamp: 'FL 11/2/2021 18:19:07'!
top

	| topElement |

	topElement := stackOfElements at: (stackOfElements size ).
	^topElement returnTopElementIn: self.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'filters' stamp: 'FL 11/4/2021 15:45:33'!
filterList: listToFilter with: prefixChar at: aPosition

	| elementChar listaResultados |
	
	listaResultados := OrderedCollection new.

	listToFilter do: [: element |
							((element size) >= aPosition ) ifTrue: [
									elementChar := element at: aPosition .		
									(elementChar = prefixChar) ifTrue:[
															listaResultados add: element.
															]
												]
				].
	
	^listaResultados.! !

!SentenceFinderByPrefix methodsFor: 'filters' stamp: 'FL 11/4/2021 14:47:18'!
filterListRecursively: aPrefix with: position with: listOfResults

	| PrefixChar newPosition newListOfResults |
	
	newPosition := position + 1.
	((aPrefix size) < newPosition ) ifTrue: [^listOfResults ].
	PrefixChar := aPrefix at: newPosition. 
	
	newListOfResults := self filterList: listOfResults with: PrefixChar at: newPosition .
	
	 ^self filterListRecursively: aPrefix with: newPosition with: newListOfResults.
	
	! !

!SentenceFinderByPrefix methodsFor: 'filters' stamp: 'FL 11/4/2021 14:48:02'!
filterStack: aStack with: prefixChar in: position

	| elementChar  realStack listOfResults stackBase |
	
	listOfResults := OrderedCollection new.
	realStack  := aStack returnStack .
	stackBase := realStack at: 1. 
	realStack removeFirst.
	
	realStack do: [: element |
								elementChar := element returnValue .
								elementChar := elementChar at: position .		
								(elementChar = prefixChar) ifTrue:[
														elementChar := element returnValue .
														listOfResults add: elementChar .
														]
			].
	realStack addFirst: stackBase.
	^listOfResults.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'FL 11/4/2021 12:24:36'!
assertStackNotEmpty: aStack

		aStack top.! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'FL 11/4/2021 13:07:31'!
checkForInvalidLetters: aPrefix

	((aPrefix includesSubString:' ') or: (aPrefix = '')) ifTrue:[ self error: self class sentenceFinderInvalidSentenceError ].! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'FL 11/4/2021 13:22:47'!
find: aPrefix in: aStack

	| position charPrefix listsOfResults |
	
	self checkForInvalidLetters: aPrefix .
	
	position := 1.
	charPrefix  := aPrefix at: position .	
	
	self assertStackNotEmpty: aStack.

	listsOfResults  := self filterStack: aStack with: charPrefix in: position.
	
	listsOfResults  := self filterListRecursively: aPrefix with: position with: listsOfResults.
	
	^listsOfResults ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TD 11/3/2021 14:05:21'!
sentenceFinderEmptySentenceError
	^'Empty finder error'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FL 11/4/2021 11:33:29'!
sentenceFinderEmptyStack
	^'Stack is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FL 11/3/2021 18:56:40'!
sentenceFinderInvalidSentenceError
	^'Prefix has an invalid character'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'TD 11/3/2021 13:53:09'!
with: string with: stack
	self new initializeWith: string with: stack.! !
