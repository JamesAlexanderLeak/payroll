#ifndef _HOURLYEMPLOYEE_H_
#define _HOURLYEMPLOYEE_H_

#include "Employee.h"

class HourlyEmployee : public Employee{
	public:
		double Hours;
		double HourlyRate;
		HourlyEmployee();
		HourlyEmployee(double,double);
		~HourlyEmployee();
		double getEarning();
		string getInfo();
};
#endif
