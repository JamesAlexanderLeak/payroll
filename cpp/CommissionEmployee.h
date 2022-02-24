#ifndef _COMMISSIONEMPLOYEE_H_
#define _COMMISSIONEMPLOYEE_H_

#include "Employee.h"

class CommissionEmployee : public Employee{
	public:
		double MinimumSalary;
		double Sales;
		double CommissionRate;		
		CommissionEmployee();
		CommissionEmployee(double,double,double);
		~CommissionEmployee();
		double getEarning();
		string getInfo();
};
#endif
