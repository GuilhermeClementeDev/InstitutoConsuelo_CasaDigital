#!/usr/bin/python3

import sys
import json

data = {
	"total_palavras": 0,
	"palavras_grandes": 0,
	"porcentagem": 0.0
}

def reading(file_path):
	try:
		file = open(file_path)
		for i in file:
			if i.strip():
				data["total_palavras"] += 1
				if len(i) > 5:
					data["palavras_grandes"] +=1
		file.close
		data["porcentagem"] = round(data["palavras_grandes"] / data["total_palavras"] * 100, 2)
	except FileNotFoundError:
		print("Invalid file path")
		exit(-1)

def to_json():
	file = open("ativ01.json", "w")
	json.dump(data, file, indent=2)
	file.close()

if __name__ == "__main__":
	if (len(sys.argv) != 2):
		print("Invalid number of inputs")
		exit(-1)
	reading(sys.argv[1])
	to_json()
