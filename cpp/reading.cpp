#include "Employee.h"
#include "HourlyEmployee.h"
#include "SalariedEmployee.h"
#include "CommissionEmployee.h"
#include "reading.h"
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
using namespace std;
vector<Employee*> *readFrom(string fileName){
	vector<Employee*> *list = new vector<Employee*>;
	string line;
	string fname;
	string lname;
	string doubleHolder1;
	string doubleHolder2;
	string doubleHolder3;
	ifstream myfile(fileName);
	if(myfile.is_open()){
		while(getline(myfile,line,' ')){
			if(line == "salaried"){
				double salary = 0;
				getline(myfile,fname,' ');
				getline(myfile,lname,' ');
				getline(myfile,doubleHolder1);
			//	cout << "firstname " << fname << '\n' << "lastname " << lname << '\n' << "doubleHolder " << doubleHolder1 << '\n';
				salary = stod(doubleHolder1);
				SalariedEmployee *newSal = new SalariedEmployee(salary);
				newSal->firstname = fname;
				newSal->lastname = lname;
				list->push_back(newSal);
			}
			if(line == "hourly"){
				double hours;
				double hourlyRate;
				getline(myfile,fname,' ');
				getline(myfile,lname,' ');
				getline(myfile,doubleHolder1,' ');
				getline(myfile,doubleHolder2);
				hours = stod(doubleHolder1);
				hourlyRate = stod(doubleHolder2);
				HourlyEmployee *newHour = new HourlyEmployee(hours,hourlyRate);
				newHour->firstname = fname;
				newHour->lastname = lname;
				list->push_back(newHour);
			}
			if(line == "commission"){
				double minSal;
				double sales;
				double comRate;
				getline(myfile,fname,' ');
				getline(myfile,lname,' ');
				getline(myfile,doubleHolder1,' ');
				getline(myfile,doubleHolder2,' ');
				getline(myfile,doubleHolder3);
				minSal = stod(doubleHolder1);
				sales = stod(doubleHolder2);
				comRate = stod(doubleHolder3);
				CommissionEmployee *newCom = new CommissionEmployee(minSal,sales,comRate);
				newCom->firstname = fname;
				newCom->lastname = lname;
				list->push_back(newCom);	
			}
		//	cout << "line " << line << '\n';
		}
	myfile.close();
	}
	else{
		cout << "Unable to open file";
	}
	return list;
}
