# 🐍 Python no Comando: Scripts que Encantam

## 🎯 Objetivos de Aprendizagem
Meu resumo:
- ✳ Compreender e aplicar funções (parâmetros, retornos e escopo).
- 📦 Organizar código com modularização.
- ✅ Aplicar boas práticas (PEP 8, docstrings e nomes significativos).
- 🛡 Tratar e validar dados corretamente.
- 🧪 Criar testes unitários básicos.
- 🛠 Integrar tudo em um mini projeto modular e testável.



### O que é modularização?
Dividir um código em partes menores e reutilizáveis chamadas **módulos**.

✅ Benefícios:
| Vantagem | Explicação |
|----------|------------|
| 🔧 Manutenção | Correções mais fáceis |
| 🔁 Reutilização | Mesmas funções em vários projetos |
| 🧪 Testabilidade | Testes em partes isoladas |
| 📚 Legibilidade | Código organizado |
| 🤝 Trabalho em equipe | Cada um cuida de um módulo |

### 📏 Princípios importantes
| Princípio | Significado |
|-----------|-------------|
| SRP | Uma função = uma responsabilidade |
| DRY | Evitar duplicação de código |
| KISS | Mantenha simples |
| Funções puras | Sem efeitos colaterais |

### 🆚 Exemplo

❌ Código único → difícil de manter
✅ Código modular → reutilizável e limpo (exemplo com `calculadora.py`, `entrada.py` e `main.py`)

---

## 📁 Estrutura sugerida de projeto
projeto/
├── src/
│ ├── main.py
│ ├── utils/
│ ├── models/
│ ├── services/
├── tests/
├── data/
├── README.md
└── requirements.txt

---

## ✅ Boas práticas em funções
❌ Funções longas com muitas responsabilidades
✅ Separar em funções pequenas como:
- `validar_usuario()`
- `formatar_dados_usuario()`
- `salvar_usuario()`
- `processar_novo_usuario()`

---

## 2️⃣ Tratamento de Dados e Boas Práticas

### 📍 Tratamento envolve:
| Etapa | O que faz |
|-------|-----------|
| ✅ Validação | Confere se os dados são válidos |
| 🧼 Limpeza | Remove inconsistências |
| 🔁 Transformação | Converte para formatos adequados |
| 📏 Normalização | Padroniza dados |

### ❌ Problemas comuns:
- Dados faltando
- Duplicados
- Formatos incorretos
- Valores inválidos

✅ Exemplo de validações: `validar_email()`, `validar_cpf()`, `validar_data()`
✅ Transformações: remover acentos, formatar CPF e telefone.

---

## 🧪 Sistema completo de processamento
Uso de classes como `ProcessadorDados` para:
- Processar usuário individual
- Processar lotes com estatísticas de sucesso/falha
- Organizar erros e avisos

---

## 💎 Boas práticas de código

### 📛 Nomes significativos
| Ruim | Bom |
|------|-----|
| `f(x,y)` | `calcular_media(valores)` |

### 📝 Docstrings no padrão
- Descrevem o que faz, parâmetros, retorno, erros e exemplos

### ⚠ Tratamento de erros
❌ `except:` genérico
✅ `except ValueError:` descritivo

---


✍ *Próximo passo*: iniciar os testes unitários com `pytest` ou `unittest` 🎯
