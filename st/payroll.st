"Employees subclass"
Object subclass: #Employees
	instanceVariableNames: 'employees'
	classVariableNames: ''
	poolDictionaries: ''!
!Employees publicMethods!
new
	|r|
	r := super new.
	^r!
init
	^employees := OrderedCollection new!
add: n
	employees add: n!
count
	Transcript nextPutAll: 'There are ',(employees size) asString,' employees'.
	Transcript cr!
"	^employees size!"
printOn: stream
	^super printOn: stream!
print
	1 to: (employees size) do: [:x| (employees at: x) info.]!
size
	^employees size!
at: n
	^employees at: n!
max
	|maxEarning tempEarning tempObj returnObj|
	maxEarning := -1.
	tempEarning := -1.
	tempObj := employees at: 1.
	returnObj := employees at: 1.
	1 to: (employees size) do: [:x| tempObj := employees at: x.
	tempEarning := (employees at: x) earning.
	(tempEarning > maxEarning) ifTrue: [returnObj := employees at: x. maxEarning := tempEarning.].
	].
	returnObj info.
	^returnObj!
min
	|minEarning tempEarning tempObj returnObj|
	minEarning := (employees at: 1) earning.
	tempEarning := (employees at: 1) earning.
	tempObj := employees at: 1.
	returnObj := employees at: 1.
	1 to: (employees size) do: [:x| tempObj := employees at: x.
	tempEarning := (employees at: x) earning.
	(tempEarning < minEarning) ifTrue: [returnObj := employees at: x. minEarning := tempEarning.].
	].
	returnObj info.
	^returnObj!
total
	|sum a b|
	sum := 0.
	1 to: (employees size) do: [:x| sum := sum + (employees at: x) earning.].
	a := (sum asFloat) asScaledDecimal: 2.
	b := a asString.
	Transcript nextPutAll: 'Total payment is $',b.
	Transcript cr.
	^sum!
average
	|total number a b|
	total := 0.
	number := 0.
	1 to: (employees size) do: [:x| total := total + (employees at: x) earning.
	number := number + 1.].
	a := ((total/number) asFloat) asScaledDecimal: 2.
	b := a asString.
	Transcript nextPutAll: 'Average payment per employee is $',b.
	Transcript cr.
	^(total/number)!
errorMessage
	Transcript nextPutAll: 'Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st employee_file action'.
	Transcript cr.
	Transcript nextPutAll: 'or'.
	Transcript cr.
	Transcript nextPutAll: 'Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st employee_file action operator threshold'.
	Transcript cr.
	Transcript cr.
	Transcript nextPutAll: 'Valid actions: count print min max total avg'.
	Transcript cr.
	Transcript nextPutAll: 'Valid operators: eq ne gt ge lt le'.
	Transcript cr.
	ObjectMemory quit: 1!
!

"Start of Program"

numArgs := Smalltalk getArgc.
employeesList := Employees new.
employeesList init.
"checks number of args and prints error message if incorrect"
((numArgs ~= 2) & (numArgs ~= 4)) ifTrue: [employeesList errorMessage.].
(numArgs > 1) ifTrue: [
	((Smalltalk arguments at: 1)asFile isReadable) ifFalse: [
		Transcript nextPutAll: 'Unable to open '.
		Transcript nextPutAll: (Smalltalk arguments at: 1) asString, ' for reading.'.
		Transcript cr.
		ObjectMemory quit: 1.
	].
].
f := FileStream open: (Smalltalk arguments at: 1) mode: FileStream read.

"This reads in different objects into the data structure"
line := ' '.
[line ~= nil] whileTrue: [
	line := f nextLine.
	parts := nil.
	(line isString) ifTrue: [parts := line substrings].
	(parts notNil) ifTrue:[
		((parts at: 1) = 'salaried') ifTrue: [
			S := SalariedEmployee new.
			S init.
			S firstName: (parts at: 2).
			S lastName: (parts at: 3).
			S salary: (parts at: 4) asNumber.
			employeesList add: S.
		].
		((parts at: 1) = 'hourly') ifTrue: [
			H := HourlyEmployee new.
			H init.
			H firstName: (parts at: 2).
			H lastName: (parts at: 3).
			H hours: (parts at: 4) asNumber.
			H hourlyRate: (parts at: 5) asNumber.
			employeesList add: H.
		].
		((parts at: 1) = 'commission') ifTrue: [
			C := CommissionEmployee new.
			C init.
			C firstName: (parts at: 2).
			C lastName: (parts at: 3).
			C minimumSalary: (parts at: 4) asNumber.
			C sales: (parts at: 5) asNumber.
			C commissionRate: (parts at: 6) asNumber.	
			employeesList add: C.
		].
	].
].
((employeesList size) < 1) ifTrue: [
	Transcript nextPutAll: 'There are no employees.'.
	Transcript cr.
	ObjectMemory quit: 1.
].
"This creates a new Employees object that holds all employees with the operator and threshold"
tempList := Employees new.
tempList init.
(numArgs == 4) ifTrue: [
	operator := (Smalltalk arguments at: 3).
	threshold := (Smalltalk arguments at: 4) asNumber.
	((operator = 'eq') | (operator = 'ne') | (operator = 'gt') | (operator = 'ge') | (operator = 'lt') | (operator = 'le')) ifFalse: [employeesList errorMessage.].
	(operator = 'eq') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) = threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
	(operator = 'ne') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) ~= threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
	(operator = 'gt') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) > threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
	(operator = 'ge') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) >= threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
	(operator = 'lt') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) < threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
	(operator = 'le') ifTrue:[
		1 to: (employeesList size) do: [:x| (((employeesList at: x) earning) <= threshold) ifTrue: [tempList add: (employeesList at: x).].].
	].
].
"This takes care of the actions"
(numArgs > 2) ifTrue: [employeesList := tempList.].
action := Smalltalk arguments at: 2.
((employeesList size) < 1) ifTrue: [
	Transcript nextPutAll: 'There are no employees satisfied the specified condition.'.
	Transcript cr.
	ObjectMemory quit: 1
].
((action = 'count') | (action = 'print') | (action = 'min') | (action = 'max') | (action = 'total') | (action = 'avg')) ifFalse: [employeesList errorMessage.].
(action = 'count') ifTrue: [employeesList count.].
(action = 'print') ifTrue: [employeesList print.].
(action = 'min') ifTrue: [employeesList min.].
(action = 'max') ifTrue: [employeesList max.].
(action = 'total') ifTrue: [employeesList total.].
(action = 'avg') ifTrue: [employeesList average.].

