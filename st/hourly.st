Employee subclass: #HourlyEmployee
	instanceVariableNames: 'hours hourlyRate'
	classVariableNames: ''
	poolDictionaries: ''!
!HourlyEmployee publicMethods!
new
	|r|
	r := super new.
	r init.
	^r !
hours: n
	hours := n !
hours
	^hours !
hourlyRate: n
	hourlyRate := n !
hourlyRate
	^hourlyRate !
init
	hours := 0.
	hourlyRate := 0.
	^super init!
earning
	|return|
	(hours < 40) ifTrue: [return := (hours * hourlyRate)].
	(hours > 50) ifTrue: [return := (40 * hourlyRate + (10 * (hourlyRate * 1.5)) + ((hours - 50) * (hourlyRate * 2)))].
	((hours <= 50) & (hours >= 40)) ifTrue: [return := ((40 * hourlyRate) + ((hours - 40) * (hourlyRate * 1.5)))].
	^return!
info
	|a b c d|
	Transcript nextPutAll: 'Hourly employee: ', firstName, ' ', lastName.
	Transcript cr.
	a := (hours asFloat) asScaledDecimal: 2.
	b := a asString.
	c := (hourlyRate asFloat) asScaledDecimal: 2.
	d := c asString.
	Transcript nextPutAll: 'hours worked: ',b,', hourly rate: ',d. 
	a := ((self earning) asFloat) asScaledDecimal: 2.
	b := a asString.
	Transcript cr.
	Transcript nextPutAll: 'earned $',b.
	Transcript cr.
	Transcript cr!
!
