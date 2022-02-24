#ifndef _EMPLOYEE_H_
#define _EMPLOYEE_H_

#include <vector>
#include <string>
using namespace std;

class Employee{
	public:
		string firstname;
		string lastname;
		Employee(string,string);
		Employee();
		virtual ~Employee();
		virtual string getInfo();
		virtual double getEarning();
};
#endif
