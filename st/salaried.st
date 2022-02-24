Employee subclass: #SalariedEmployee
	instanceVariableNames: 'salary'
	classVariableNames: ''
	poolDictionaries: ''!
!SalariedEmployee publicMethods !
new
	|r|
	r := super new.
	r init.
	^r !
salary: n
	salary := n !
salary
	^salary !
init
	salary := 0.
	^super init !
earning
	^salary!
info
	|a b|
	Transcript nextPutAll: 'Salaried employee: ', firstName, ' ', lastName.
	Transcript cr.
	Transcript nextPutAll: 'weekly salary: '.
	a := (salary asFloat) asScaledDecimal: 2.
	b := a asString.
	Transcript nextPutAll: b.
	Transcript cr.
	Transcript nextPutAll: 'earned $', b.
	Transcript cr.
	Transcript cr!
!
