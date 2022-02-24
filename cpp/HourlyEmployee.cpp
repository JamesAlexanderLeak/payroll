#include "HourlyEmployee.h"
#include <sstream>
#include <iomanip>

using namespace std;

HourlyEmployee::HourlyEmployee(){
	Hours = 0;
	HourlyRate = 0;
}
HourlyEmployee::HourlyEmployee(double hours,double rate){
	Hours = hours;
	HourlyRate = rate;		
}
HourlyEmployee::~HourlyEmployee(){
	
}
double HourlyEmployee::getEarning(){
	double total = 0;
	if(Hours < 40){
		total = Hours*HourlyRate;
	}
	else if(Hours > 50){
		total = 40*HourlyRate + (10 * (HourlyRate * 1.5)) + ((Hours - 50) * (HourlyRate * 2));
	}
	else if(Hours <= 50 && Hours >= 40){
		total = 40*HourlyRate + (Hours-40) * (HourlyRate * 1.5);
	}
	return total;
}
string HourlyEmployee::getInfo(){
	ostringstream streamObj;
	ostringstream streamObj2;
	streamObj << fixed << setprecision(2);
	streamObj << Hours; 
	streamObj2 << fixed << setprecision(2);
	streamObj2 << HourlyRate;
	string hourString = streamObj.str();
	string hourlyRateString = streamObj2.str();
	string returnString = "";
	returnString = "Hourly employee: " + firstname + " " + lastname + '\n';
	returnString = returnString + "hours worked: " + hourString + ", hourly rate: " + hourlyRateString;
	return returnString;
}
