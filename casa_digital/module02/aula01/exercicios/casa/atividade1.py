#!/usr/bin/python3

import sys
import json

list = []
data = {
    "total_palavras": 0,
    "palavras_grandes": 0,
    "porcentagem": 0.0
}

def counting(list):
	big_words = 0
	data["total_palavras"] = len(list)
	for i in list:
		if len(i) > 5:
			big_words += 1
	data["palavras_grandes"] = big_words
	data["porcentagem"] = round((big_words / data["total_palavras"])* 100, 1)

def read(file_path):
	try:
		file = open(file_path, "r")
		for i in file:
			linha = i.strip()
			if linha:
				list.append(linha)
		file.close()
	except FileNotFoundError:
		print("Error reading file")
		exit(-1)

def create_json():
	file = open("atividade1.json", "w")
	json.dump(data, file, indent=4)
	file.close()

if __name__ == "__main__":
	read(sys.argv[1])
	counting(list)
	create_json()
