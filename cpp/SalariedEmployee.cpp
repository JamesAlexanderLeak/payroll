#include "SalariedEmployee.h"
#include <sstream>
#include <iomanip>

using namespace std;

SalariedEmployee::SalariedEmployee(){
	WeeklySalary = 0;
}
SalariedEmployee::SalariedEmployee(double salary){
	WeeklySalary = salary;
}
SalariedEmployee::~SalariedEmployee(){

}
double SalariedEmployee::getEarning(){
	return WeeklySalary;
}
string SalariedEmployee::getInfo(){
	ostringstream streamObj;
	streamObj << fixed << setprecision(2);
	streamObj << WeeklySalary;
	string weeklySalString = streamObj.str();
	string returnString = "";
	returnString = "Salaried employee: " + firstname + " " + lastname + " " + '\n';
	returnString = returnString + "weekly salary: " + weeklySalString;
	return returnString;
}
