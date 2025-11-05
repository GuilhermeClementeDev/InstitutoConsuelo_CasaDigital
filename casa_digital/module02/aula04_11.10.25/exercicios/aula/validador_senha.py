#!/usr/bin/python3
#re = módulo de expressões regulares do Python, serve para procurar padrões em strings
import re

if __name__ == "__main__":
	print("Bem vindo ao validador de senhas ('exit' para sair)")
	print("Deve conter:\nMínimo de 8 caracteres\nPelo menos uma letra maiúscula\nPelo menos uma letra minúscula\nPelo menos um número\nPelo menos um caractere especial (@, #, $, %, etc.)")
	while True:
		user_input = input("Digite a senha que será validada: ")
		if user_input == 'exit':
			print("Finalizando programa...")
			break
		if len(user_input) < 8:
			print("Senha invalida.\nDeve conter ao menos 8 caracteres.")
			continue
		if not re.search(r"[A-Z]", user_input):
			print("Senha inválida.\nDeve conter pelo menos uma letra maiúscula.\n")
			continue
		if not re.search(r"[a-z]", user_input):
			print("Senha inválida.\nDeve conter pelo menos uma letra minúscula.\n")
			continue
		if not re.search(r"[0-9]", user_input):
			print("Senha inválida.\nDeve conter pelo menos um número.\n")
			continue
		if not re.search(r"[@#$%^&*!?]", user_input):
			print("Senha inválida.\nDeve conter pelo menos um caractere especial (@, #, $, %, ^, &, *, !, ?).\n")
			continue

		print("Senha válida!\n")
