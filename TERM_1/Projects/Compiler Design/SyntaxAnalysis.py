class SyntaxAnalyzer:
    def __init__(self, input_string):
        self.input_string = input_string
        self.current_token = None
        self.current_position = 0

    def get_next_token(self):
        if self.current_position < len(self.input_string):
            self.current_token = self.input_string[self.current_position]
            self.current_position += 1
            return self.current_token
        else:
            return None

    def parse_expression(self):
        self.get_next_token()  # Initialize the current_token
        result = self.parse_term()
        while self.current_token in ['+', '-']:
            op = self.current_token
            self.get_next_token()
            term = self.parse_term()
            if op == '+':
                result += term
            elif op == '-':
                result -= term
        return result

    def parse_term(self):
        result = self.parse_factor()
        while self.current_token in ['*', '/']:
            op = self.current_token
            self.get_next_token()
            factor = self.parse_factor()
            if op == '*':
                result *= factor
            else:
                result /= factor
        return result

    def parse_factor(self):
        if self.current_token.isdigit():
            value = int(self.current_token)
            self.get_next_token()
            return value
        else:
            raise SyntaxError("Unexpected token: {}".format(self.current_token))


if __name__ == "__main__":
    input_string = "3+5*6+2-4"
    syntax_analyzer = SyntaxAnalyzer(input_string)
    try:
        result = syntax_analyzer.parse_expression()
        print("Parsing successful. Result:", result)
    except SyntaxError as e:
        print("Syntax Error:", e)
