#ifndef _SALARIEDEMPLOYEE_H_
#define _SALARIEDEMPLOYEE_H_

#include "Employee.h"

class SalariedEmployee : public Employee{
	public:
		double WeeklySalary;	
		SalariedEmployee();
		SalariedEmployee(double);
		~SalariedEmployee();
		double getEarning();
		string getInfo();
}; 
#endif
