Object subclass: #Employee
	instanceVariableNames: 'firstName lastName'
	classVariableNames: ''
	poolDictionaries: ''
	category: nil !
Employee comment: 'I represent an employee' !
!Employee publicMethods!
new
	|r|
	r:= super new.
	r init.
	^r!
firstName: n
	firstName := n !
firstName
	^firstName !
lastName: n
	lastName := n !
lastName
	^lastName !
init
	firstName := ' '.
	lastName := ' '!
printOn: stream	
	super printOn: stream
!!
