#!/usr/bin/python3

def celsius_para_fahrenheit(celsius):
	'''Retorna valor em fahrenheit'''
	return ((celsius * 1.8) + 32)

def fahrenheit_para_celsius(fahrenheit):
	'''Retorna valor em celsius'''
	return ((fahrenheit - 32) / 1.8)

def celsius_para_kelvin(celsius):
	'''Retorna valor em kelvin'''
	kelvin = celsius + 273.15
	if kelvin < 0:
		raise ValueError("Kelvin não pode ser menor que 0")
	return (kelvin)

def kelvin_para_celsius(kelvin):
	'''Retorna valor em celsius'''
	if kelvin < 0:
		raise ValueError("Kelvin não pode ser menor que 0")
	return (kelvin - 273.15)
