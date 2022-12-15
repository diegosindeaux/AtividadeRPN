import 'dart:io';

void main() {
  print('Digite sua expressão: ');
  String? express = stdin.readLineSync()!;
  var pilha1 = [];
  var pilha2 = [];
  List result = express.split(' ');
  for (var i = 0; i < result.length; i++) {
    var val1 = result[i];
    if (val1 != '+' && val1 != '-' && val1 != '*' && val1 != '/' && val1 != ')' && val1 != '(') {
        String num1 = val1.toString();
        pilha1 = push(pilha1, num1);
    }
    if (val1 == '+' || val1 == '-' || val1 == '*' || val1 == '/' || val1 == ')' || val1 == '(') {
        String num1 = val1.toString();
        pilha2 = push(pilha2, num1);
        if (pilha2.length > 1){
          if (priority(num1) < priority(pilha2[pilha2.length - 2])){
            for (var i = pilha2.length; i > 0; i--){
              pilha1 = push(pilha1, pilha2[i - 1]);
              pilha2 = pop(pilha2);
            }
          }
        }
    }
    if ( (i == result.length - 1) && pilha2.length != 0){
      while (pilha2.length != 0){
        for (var i = pilha2.length; i > 0; i--){
          pilha1 = push(pilha1, pilha2[i - 1]);
          pilha2 = pop(pilha2);
        }
      }
    }
  }
  print(pilha1);
  print(pilha2);
}

pop(expressao){
  var pexpressao = expressao;
  expressao = List<String>.filled(pexpressao.length-1, "z", growable: true);
  for (var i = 0; i < expressao.length; i++){
    expressao[i] = pexpressao[i];
  }
  return expressao;
}

push(expressao, number){
  var pexpressao = expressao;
  expressao = List<String>.filled(pexpressao.length + 1, "z", growable: true);
  expressao[pexpressao.length] = number;
  for (var i = 0; i < expressao.length - 1; i++){
    expressao[i] = pexpressao[i];
  }
  return expressao;
}

int priority(x){
  if(x == "(" ){
    return 0;
  }
  if(x == "+" || x == "-" ){
    return 1;
  }
  if(x == "*" || x == "/" ){
    return 2;
  }
  return 0;
}
