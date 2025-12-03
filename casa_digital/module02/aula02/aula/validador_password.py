#!/usr/bin/python3
import sys

def main():
	if len(sys.argv) != 2 or len(sys.argv[1]) < 8:
		return print("Error invalid password")
	if sys.argv[1].islower():
		return print("Erro all lower")
	if sys.argv[1].isupper():
		return print("Error all upper")
	number = 0
	especial = 0
	for i in range(len(sys.argv[1])):
		if (sys.argv[1][i]).isdigit():
			number = 1
		if not (sys.argv[1][i].isalnum()) or sys.argv[1][i] == 'ç' or sys.argv[1][i] == 'Ç':
			especial = 1
	if (number < 1):
		return print("Error must have a number")
	if (especial < 1):
		return print("Error must have a special char")
	print("Sucesso")

if __name__ == "__main__":
	main()
