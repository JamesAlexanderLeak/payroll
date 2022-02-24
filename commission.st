Employee subclass: #CommissionEmployee
	instanceVariableNames: 'minimumSalary sales commissionRate'
	classVariableNames: ''
	poolDictionaries: ''!
!CommissionEmployee publicMethods !
new
	|r|
	r := super new.
	r init.
	^r!
minimumSalary: n
	minimumSalary := n !
minimumSalary
	^minimumSalary !
sales: n
	sales := n !
sales
	^sales !
commissionRate: n
	commissionRate := n !
commissionRate
	^commissionRate !
init
	minimumSalary := 0.
	sales := 0.
	commissionRate := 0!

earning
	|return|
	((sales * commissionRate) > minimumSalary) ifTrue: [return := (sales * commissionRate)].
	((sales * commissionRate) > minimumSalary) ifFalse: [return := minimumSalary].
	^return!
info
	|a b c d e f|
	Transcript nextPutAll: 'Commission employee: ',firstName,' ',lastName.
	Transcript cr.
	a := (minimumSalary asFloat) asScaledDecimal: 2.
	b := a asString.
	c := (sales asFloat) asScaledDecimal: 2.
	d := c asString.
	e := ((commissionRate * 100) asFloat) asScaledDecimal: 2.
	f := e asString.
	Transcript nextPutAll: 'minimum salary: ',b,', sales amount: ',d,', commission rate: ',f,'%'.
	Transcript cr.
	a := ((self earning) asFloat) asScaledDecimal: 2.
	b := a asString.
	Transcript nextPutAll: 'earned $',b.
	Transcript cr.
	Transcript cr!
!	
