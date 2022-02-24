#include "CommissionEmployee.h"
#include <sstream>
#include <iomanip>

using namespace std;

CommissionEmployee::CommissionEmployee(){
	MinimumSalary = 0;
	Sales = 0;
	CommissionRate = 0;	
}
CommissionEmployee::CommissionEmployee(double minSal,double sal, double comRate){
	MinimumSalary = minSal;
	Sales = sal;
	CommissionRate = comRate;
}
CommissionEmployee::~CommissionEmployee(){
		
}
string CommissionEmployee::getInfo(){
	ostringstream streamObj;
	ostringstream streamObj2;
	ostringstream streamObj3;
	streamObj << fixed << setprecision(2);
	streamObj << MinimumSalary;
	streamObj2 << fixed << setprecision(2);
	streamObj2 << Sales;
	streamObj3 << fixed << setprecision(2);
	streamObj3 << CommissionRate*100;
	string minSalString = streamObj.str();
	string salesString = streamObj2.str();
	string comRateString = streamObj3.str();
	string returnString = "";
	returnString = "Commission employee: " + firstname + " " + lastname + " " + '\n';
	returnString = returnString + "minimum salary: " + minSalString + ", sales amount: " + salesString + ", commission rate: " + comRateString + "%";
	return returnString;
}
double CommissionEmployee::getEarning(){
	if((Sales * CommissionRate) > MinimumSalary){
		return (Sales * CommissionRate);	
	}
	else
		return MinimumSalary;
}
