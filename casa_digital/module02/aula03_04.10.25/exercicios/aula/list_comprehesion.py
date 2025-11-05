#!/usr/bin/python3

'''
Crie um programa que:

Gere uma lista com os números de 1 a 50
Use list comprehension para filtrar apenas os múltiplos de 3 e 5
Calcule a soma desses números
Mostre quantos números foram encontrados
'''

list = [i + 1 for i in range(50)]
multi = [i for i in list if i % 3 == 0 or i % 5 == 0]

print(f"Lista: {multi}")
print(f"Soma: {sum(multi)}")
print(f"Tamanho: {len(multi)}")
