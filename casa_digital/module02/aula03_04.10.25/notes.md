### Python na Cozinha

#### POO Programação orientada a objeto
A programação orientada a objetos é um paradigma(um jeito de pensar código). A ideia principal é organizar o programa em "objetos" que representam coisas do mundo real - como usuários, carros, produtos, etc.
Cada objeto tem :
- Dados -> chamados de atributos (variaveis)
- Comportamentos -> chamados de métodos (função)
Exemplo intuitivo
```python
	#Pensa em um carro:

	#Conceito	No mundo real	Em POO
	#Objeto	Um carro específico	meu_carro
	#Classe	O modelo de carro (ex: “Carro”)	class Carro
	#Atributos	cor, marca, velocidade	cor, marca, #velocidade
	#Métodos	acelerar, frear	acelerar(), frear()

	class Carro:
    def __init__(self, marca, cor):
        self.marca = marca
        self.cor = cor
        self.velocidade = 0

    def acelerar(self):
        self.velocidade += 10
        print(f"O {self.marca} acelerou para {self.velocidade} km/h")

    def frear(self):
        self.velocidade -= 10
        print(f"O {self.marca} reduziu para {self.velocidade} km/h")

meu_carro = Carro("Toyota", "vermelho")
meu_carro.acelerar()
meu_carro.frear()

```
#### 3 Pilares fundamentais (Encapsulamento, Herança, Polimorfismo)

#### Encapsulamento
Proteger dados internos de um objeto.Em vez de deixar os atributos totalmente abertos, usamos métodos (getters e setters) para controlar o acesso.

- Público: self.atributo (Atributo/método pode ser acessado de qualquer lugar)
- Protegido: _atributo (Convenção: “não mexa fora da classe ou subclasses”)
- Privado: __atributo (Só pode ser acessado dentro da própria classe)

```python
	class ContaBancaria:
    def __init__(self, saldo_inicial):
        self.__saldo = saldo_inicial  # privado

    def depositar(self, valor):
        if valor > 0:
            self.__saldo += valor
        else:
            print("Valor inválido")

    def sacar(self, valor):
        if 0 < valor <= self.__saldo:
            self.__saldo -= valor
        else:
            print("Saldo insuficiente ou valor inválido")

    def get_saldo(self):
        return self.__saldo

conta = ContaBancaria(100)
conta.depositar(50)
print(conta.get_saldo())  # 150
conta.__saldo = 1000      # NÃO altera o saldo real
print(conta.get_saldo())  # 150

```

#### Herança
Herda caracteristicas de uma outra classe
Classe tem metodos, comportamento, função

#### Polimorfismo
Polimorfismo significa “mesmo nome, comportamentos diferentes”. O mesmo método pode agir de forma diferente dependendo da classe do objeto, sem que você precise escrever if ou checar tipos.

