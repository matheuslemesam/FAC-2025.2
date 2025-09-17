# Como inicializar variáveis, atribuir valores, imprimir e ler dados em Assembly

## 1. Inicialização de Variáveis

Em Assembly, variáveis geralmente são declaradas na seção de dados (`.data`). Exemplos:

```asm
section .data
    numero      db  10      ; variável do tipo byte, valor inicial 10
    mensagem    db  "Olá, mundo!", 0
    valor       dw  1234    ; variável do tipo word (2 bytes), valor inicial 1234
```

- `db` (define byte): reserva 1 byte.
- `dw` (define word): reserva 2 bytes.
- Strings geralmente terminam com 0 (null terminator) para facilitar operações de saída.

## 2. Atribuição de Valores

A atribuição é feita usando instruções como `mov`:

```asm
mov al, 5          ; coloca o valor 5 no registrador AL
mov [numero], al   ; armazena o valor de AL na variável 'numero'
```

Para variáveis de 2 bytes:

```asm
mov ax, 1234
mov [valor], ax
```

## 3. Imprimir (Print) Valores

Para imprimir valores ou mensagens, normalmente usamos interrupções do sistema operacional (exemplo: INT 21h no DOS) ou funções específicas do simulador/ambiente.

Exemplo para imprimir uma string (em NASM para DOS):

```asm
mov ah, 09h         ; função de imprimir string
mov dx, mensagem    ; endereço da string
int 21h             ; chamada de interrupção
```

Para imprimir um número, normalmente é necessário converter o valor para string antes.

## 4. Ler (Scan) Valores

Para ler valores do teclado, também usamos interrupções ou funções do ambiente.

Exemplo para ler um caractere:

```asm
mov ah, 01h         ; função de ler caractere
int 21h
mov [numero], al    ; armazena o caractere lido em 'numero'
```

Para ler strings ou números, pode ser necessário um loop para processar cada caractere.

---

## Resumo

- **Inicialização:** feita na seção `.data` com `db`, `dw`, etc.
- **Atribuição:** usando `mov` entre registradores e variáveis.
- **Print:** via interrupções (ex: `int 21h` com função 09h para strings).
- **Scan:** via interrupções (ex: `int 21h` com função 01h para caractere).

Essas operações podem variar conforme o ambiente (DOS, Linux, simuladores educacionais), mas a lógica geral permanece semelhante.

Se quiser exemplos específicos para um ambiente ou simulador, por favor, informe qual está utilizando!
