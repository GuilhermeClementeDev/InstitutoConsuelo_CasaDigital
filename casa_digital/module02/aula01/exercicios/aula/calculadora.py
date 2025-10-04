#!/usr/bin/python3

def soma(a, b):
	print(f"{a} + {b} = ", a + b)

def sub(a, b):
	print(f"{a} - {b} = ", a - b)

def multi(a, b):
	print(f"{a} * {b} = ", a * b)

def div(a, b):
	if b == 0:
		print("Error, cannot divide by zero")
		return
	print(f"{a} / {b} = ", a / b)

def calc():
	try :
		a = int(input("Primeiro valor:"))
		b = int(input("Segundo valor:"))
		soma(a, b)
		sub(a, b)
		multi(a, b)
		div (a, b)
	except ValueError:
		print("Error: Invalid input")

if __name__ == "__main__":
	print("Bem vindo a calculadora")
	calc()



