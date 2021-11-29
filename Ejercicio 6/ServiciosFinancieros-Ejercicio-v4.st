!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/29/2021 08:58:35'!
test01PortfolioHasZeroAccountsWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio numberOfAccounts.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/23/2021 15:54:57'!
test02PortfolioBalanceIsZeroWhenCreated

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/29/2021 08:58:35'!
test03PortfolioCanAddAnAccount

	| account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	portfolio addAccount: account.

	self assert: 1 equals: portfolio numberOfAccounts.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/23/2021 16:01:53'!
test04PortfolioBalanceIsAccountBalanceWhenItOnlyHasOneAccount

	| account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.

	portfolio addAccount: account.

	self assert: 100 * peso equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/29/2021 08:58:35'!
test05PortfolioBalanceIsSumOfAccountBalancesWhenThereAreMoreThanOne

	| accountOne accountTwo portfolio |
	
	portfolio := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountOne .
	Deposit register: 100 * peso on: accountTwo .

	portfolio addAccount: accountOne .
	portfolio addAccount: accountTwo .

	self assert: 2 equals: portfolio numberOfAccounts.
	self assert: 200 * peso equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/27/2021 15:02:12'!
test06PortfolioCanFindATransactionInOneOfItsAccounts

	| deposit account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.

	portfolio addAccount: account.

	self assert: (portfolio hasRegistered: deposit)
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/27/2021 15:04:56'!
test07PortfolioCanNotFindATransactionThatDoesNotExist

	| deposit account portfolio |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.


	self deny: (portfolio hasRegistered: deposit)
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/27/2021 15:09:11'!
test08PortfolioCanFindATransactionInAnotherPortfolio

	| deposit account portfolioExterior portfolioInterior |
	
	portfolioExterior := Portfolio new.
	account := ReceptiveAccount new.
	portfolioInterior := Portfolio new.
	
	deposit := Deposit register: 100 * peso on: account.
	portfolioInterior addAccount: account.
	portfolioExterior addAccount: portfolioInterior. 
	
	self assert: (portfolioExterior hasRegistered: deposit)
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/27/2021 15:12:55'!
test09PortfolioCanReturnItsCorrectBalanceWhenItContainsAnotherPortfolio

	| deposit account portfolioExterior portfolioInterior |
	
	portfolioExterior := Portfolio new.
	account := ReceptiveAccount new.
	portfolioInterior := Portfolio new.
	
	deposit := Deposit register: 100 * peso on: account.
	portfolioInterior addAccount: account.
	portfolioExterior addAccount: portfolioInterior. 
	
	self assert: 100 * peso equals: portfolioExterior balance.
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/29/2021 14:08:02'!
test10PortfolioCanReturnAllItsTransactions

	| account portfolio portfolioTransactions |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.

	portfolio addAccount: account.

	portfolioTransactions := portfolio transactions. 

	self assert: (portfolioTransactions size = portfolio numberOfAccounts).
	self assert: ((portfolioTransactions at: 1) = account transactions ).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'FL 11/29/2021 16:16:21'!
test11PortfolioCanReturnItsTransactionCorrectlyWhenItHasAnotherPortfolioInsideIt 

	| account portfolio interiorPortfolio deposit portfolioTransactions interiorPortfolioTransactions accountTransactions|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	interiorPortfolio := Portfolio new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	interiorPortfolio addAccount: account.
	portfolio addAccount: interiorPortfolio.
	
	portfolioTransactions := portfolio transactions. 
	interiorPortfolioTransactions := portfolioTransactions at: 1 .
	accountTransactions :=	 interiorPortfolioTransactions at: 1.
	
	self assert: (portfolioTransactions size = portfolio numberOfAccounts ).
	self assert: (interiorPortfolioTransactions size = interiorPortfolio numberOfAccounts ).
	self assert: ((accountTransactions at: 1) = deposit )
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FL 11/27/2021 17:10:53'!
test08AccountCanTransferFromOneAccountToAnother
	
	| accountOne accountTwo |
	
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	
	Deposit register: 100 * peso on: accountOne .
	Transfer register: 50 * peso on: accountTwo from: accountOne.
	
	
	self assert: 50 * peso equals: accountOne balance.
	self assert: 50 * peso equals: accountTwo balance.
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FL 11/29/2021 12:22:03'!
test09AccountsCanRegisterATransfer

	| receivingAccount sendingAccount transfer |
	
	receivingAccount := ReceptiveAccount new.
	sendingAccount := ReceptiveAccount new.
	
	
	Deposit register: 100 * peso on: sendingAccount .
	transfer := Transfer register: 50 * peso on: receivingAccount from: sendingAccount.
	
	self assert: (receivingAccount hasRegistered: (transfer at: 2) ).
	self assert: (sendingAccount hasRegistered: (transfer at: 1) ).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FL 11/29/2021 12:17:32'!
test10AccountsCanFindTheCounterpartOfATransfer

	| receivingAccount sendingAccount transfer transferDeposit transferWithdraw |
	
	receivingAccount := ReceptiveAccount new.
	sendingAccount := ReceptiveAccount new.
	
	
	Deposit register: 100 * peso on: sendingAccount .
	transfer := Transfer register: 50 * peso on: receivingAccount from: sendingAccount.
	transferWithdraw := transfer at: 1.
	transferDeposit := transfer at: 2.
	
	self assert: (transferDeposit assertCounterpartIs: sendingAccount ).
	self assert: (transferWithdraw assertCounterpartIs: receivingAccount ).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

!Deposit methodsFor: 'value' stamp: 'FL 11/18/2021 21:39:29'!
valueWithSign

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'private' stamp: 'FL 11/29/2021 12:20:03'!
registerCounterpart: aCounterpartAccount

	counterpart := aCounterpartAccount .! !


!Transfer methodsFor: 'comparing' stamp: 'FL 11/29/2021 12:15:56'!
assertCounterpartIs: anAccount

	^counterpart = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'FL 11/29/2021 12:19:16'!
register: aValue on: aReceivingAccount from: aSendingAccount	

	|transfer transferWithdraw transferDeposit|
	transferWithdraw := TransferWithdraw register: aValue on: aSendingAccount with: aReceivingAccount .
	transferDeposit := TransferDeposit register: aValue on: aReceivingAccount with: aSendingAccount .
	
	transfer := OrderedCollection new.
	transfer add: transferWithdraw .
	transfer add: transferDeposit .
	
	^transfer.
	! !

!Transfer class methodsFor: 'instance creation' stamp: 'FL 11/29/2021 12:19:31'!
register: aValue on: anAccount with: aCounterpartAccount

	| transaction |
	
	transaction := self for: aValue.
	transaction registerCounterpart: aCounterpartAccount.
	anAccount register: transaction.
	
		
	^ transaction

	! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'FL 11/23/2021 15:14:27'!
initializeFor: aValue

	value := aValue ! !


!TransferDeposit methodsFor: 'value' stamp: 'FL 11/23/2021 15:14:51'!
value

	^ value! !

!TransferDeposit methodsFor: 'value' stamp: 'FL 11/23/2021 15:15:16'!
valueWithSign

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'FL 11/23/2021 15:14:06'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'FL 11/23/2021 15:14:37'!
initializeFor: aValue

	value := aValue ! !


!TransferWithdraw methodsFor: 'value' stamp: 'FL 11/23/2021 15:15:04'!
value

	^ value! !

!TransferWithdraw methodsFor: 'value' stamp: 'FL 11/23/2021 15:15:26'!
valueWithSign

	^ value negated ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'FL 11/23/2021 15:14:15'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'FL 11/18/2021 21:35:52'!
initializeFor: aValue

	value := aValue! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'FL 11/18/2021 21:39:52'!
valueWithSign

	^ value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'operations' stamp: 'FL 11/23/2021 15:57:19'!
addAccount: anAccount

	accounts add: anAccount.

	! !

!Portfolio methodsFor: 'operations' stamp: 'FL 11/23/2021 16:02:24'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'operations' stamp: 'FL 11/29/2021 08:58:35'!
numberOfAccounts
	^ accounts size.! !

!Portfolio methodsFor: 'operations' stamp: 'FL 11/29/2021 13:57:22'!
portfolioTransactions
	
	|ListOfTransactions|
	
	
	accounts do: [:anAccount | anAccount]! !

!Portfolio methodsFor: 'operations' stamp: 'FL 11/29/2021 13:59:39'!
transactions
	
	|aListOfTransactions|
	
	aListOfTransactions := OrderedCollection new.
	
	accounts do: [:anAccount | aListOfTransactions add: anAccount transactions ].
	
	^aListOfTransactions ! !


!Portfolio methodsFor: 'initialization' stamp: 'FL 11/23/2021 15:59:00'!
initialize
	
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'operations - private' stamp: 'FL 11/29/2021 09:05:34'!
hasRegistered: aTransaction

	accounts do: [:anAccount |
							(anAccount hasRegistered: aTransaction ) ifTrue: [^true	]
		].
	
	^false
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FL 11/29/2021 13:36:47'!
errorAccountNotFound

	^'Account is not in the Portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FL 11/18/2021 21:40:57'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueWithSign ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FL 11/23/2021 15:22:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FL 11/18/2021 21:33:36'!
register: aTransaction

	transactions add: aTransaction
	 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
