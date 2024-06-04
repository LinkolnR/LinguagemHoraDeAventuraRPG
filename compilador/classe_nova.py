from abc import ABC, abstractmethod 

SUB  = 'MINUS'
SOMA = 'PLUS'
MULT = 'MULT'
DIV  = 'DIV'
PARE = '('
PARD = ')'
END = ''
EOF = 'EOF'
ASS = '='
PRINT = 'print'
QUEBRA = '\n'
IDENTIFIER = 'identifier'
ATRIBUICAO = 'atribuicao'

symbols = [SOMA, SUB, MULT, DIV, PARE, PARD, 'int','=','==','>','<']
# symbols_tokens = ["+","-","*","/","=","(",")"]


# especial_words = ['sessao', 'npc', 'npc_fala', 'jogador', 'jogador_fala', 'jogador_responde', 'mestre', 'mestre_fala', 'round', 'charada', 'combate', 'combate_on', 'monstro', 'criar_jogador', 'nome', 'vida', 'arma', 'certo', 'errado']
especial_words = ['print','while','do','end','if','else','then','or','and','read','not','local','function','return',","]

# Tokenizer Class
class Tokenizer():
    def __init__(self, source):
        self.source = source
        self.position = 0
        self.next = self.select_next()

    def select_next(self):
        if self.position >= len(self.source):
            self.next = Token("EOF", "")
            return self.next
        
        while self.source[self.position] == ' ' or self.source[self.position] == '\t':
            if self.position == len(self.source)-1:
                self.next = Token("EOF", "")
                return self.next
            self.position += 1
        
        aux = []
        if self.source[self.position].isdigit():
            while self.source[self.position].isdigit():
                aux.append(self.source[self.position])
                self.position += 1
                if self.position >= len(self.source):
                    break
            num = int(''.join(aux))
            self.next = Token('int', num)
            return self.next
        
        if aux == []:
            if self.source[self.position] == '+':
                self.next = Token('PLUS', SOMA)
                self.position += 1
            elif self.source[self.position] == '-':
                self.next = Token('MINUS', SUB)
                self.position += 1
            elif self.source[self.position] == '*':
                self.next = Token('MULT', MULT)
                self.position += 1
            elif self.source[self.position] == '/':
                self.next = Token('DIV', DIV)
                self.position += 1
            elif self.source[self.position] == '(':
                self.next = Token('(', PARE)
                self.position += 1
            elif self.source[self.position] == ')':
                self.next = Token(')', PARD)
                self.position += 1
            elif self.source[self.position] == '\n':
                self.next = Token('QUEBRA', QUEBRA)
                self.position += 1
            elif self.source[self.position] == '=':
                self.position += 1
                if self.source[self.position] == '=':
                    self.next = Token('==', '==')
                    self.position += 1
                else:
                    self.next = Token(ATRIBUICAO, '=')
            elif self.source[self.position] == '>':
                self.next = Token('>', '>')
                self.position += 1
            elif self.source[self.position] == '<':
                self.next = Token('<', '<')
                self.position += 1
            elif self.source[self.position] == '.':
                self.position += 1
                if self.source[self.position] == '.':
                    self.next = Token('..', '..')
                    self.position += 1
                else:
                    raise "Concatenation incomplete"
            elif self.source[self.position] == '"':
                self.position += 1
                while self.source[self.position] != '"':
                    aux.append(self.source[self.position])
                    self.position += 1
                self.position += 1
                string = ''.join(aux)
                self.next = Token('string', string)
            else:
                while (self.source[self.position].isalpha() or self.source[self.position].isdigit() or self.source[self.position] == "_" or self.source[self.position] == ","):
                    if self.source[self.position] == "," and len(aux) > 0:
                        break
                    elif self.source[self.position] == "," and len(aux) == 0:
                        aux.append(self.source[self.position])
                        self.position += 1
                        break
                    aux.append(self.source[self.position])
                    self.position += 1
                    if self.position == len(self.source):
                        self.position -= 1
                        break
                if aux == []:
                    raise "Syntax Error - Not a valid token"
                palavra = ''.join(aux)
                if palavra in especial_words:
                    self.next = Token(palavra, palavra)
                    return self.next
                self.next = Token('identifier', ''.join(aux))
                return self.next
        return self.next
