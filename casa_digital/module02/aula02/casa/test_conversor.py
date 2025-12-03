#!/usr/bin/python3

import pytest
from conversor import celsius_para_fahrenheit, fahrenheit_para_celsius, celsius_para_kelvin, kelvin_para_celsius

def test_celsius_para_fahrenheit():
	assert celsius_para_fahrenheit(0) == 32.0
	assert celsius_para_fahrenheit(100) == 212.0

def test_fahrenheit_para_celsius():
	assert fahrenheit_para_celsius(32) == 0.0
	assert fahrenheit_para_celsius(212) == 100.0

def test_celsius_para_kelvin():
	assert celsius_para_kelvin(-273.15) == 0.0
	assert celsius_para_kelvin(0) == 273.15

def test_kelvin_para_celsius():
	assert kelvin_para_celsius(0) == -273.15
	assert kelvin_para_celsius(273.15) == 0.0
