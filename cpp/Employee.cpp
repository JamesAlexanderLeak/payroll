#include "Employee.h"

using namespace std;

Employee::Employee(){
	firstname = "NULL";
	lastname = "NULL";
}
Employee::Employee(string fname, string lname){
	firstname = fname;
	lastname = lname;
}
Employee::~Employee(){

}
double Employee::getEarning(){
	return 1;
}
string Employee::getInfo(){
	return "";
}
