#!/usr/bin/python3

import sys
import json
import csv

students = []
report = {
	'students_approved': 0,
	'students_reproved': 0,
	'class_average': 0.0,
	'highest_grade': 0.0,
	'lowest_grade': 10.0
}


def reading():
	file = open(sys.argv[1], "r")
	read = csv.DictReader(file)
	for i in read:
		students.append(i)
	file.close()

def average():
	try:
		for i in students:
			i['average'] = round((float(i['nota1']) + float(i['nota2']) + float(i['nota3'])) / 3, 2)
			if i['average'] >= 7.0:
				i['approved'] = True
			else:
				i['approved'] = False
	except ValueError:
		print ("Invalid grade (not a int or float)")
		exit(-1)
def report_generation():
	grades = 0
	for i in students:
		if i['approved'] == True:
			report['students_approved'] += 1
		else:
			report['students_reproved'] += 1
		if report['highest_grade'] < float(i['average']):
			report['highest_grade'] = round(float(i['average']), 2)
		if report['lowest_grade'] > float(i['average']):
			report['lowest_grade'] = round(float(i['average']), 2)
		grades += round(float(i['average']), 2)
	report['class_average'] = round(grades / len(students), 2)

def to_json():
	file = open("ativ02.json", "w")
	json.dump(report, file, indent=2)
	file.close()

if __name__ == "__main__":
	if len(sys.argv) != 2:
		print("Invalid number of inputs")
		exit(-1)
	reading()
	average()
	report_generation()
	to_json()
	print (report)
