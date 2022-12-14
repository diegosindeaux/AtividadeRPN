import 'dart:io';

void main() {
  print('Digite sua expressão: ');
  String? express = stdin.readLineSync()!;
  var resp = [];
  var presp = 0;
  var stop = "";
  List result = express.split(' ');
  for (var i = 0; i < result.length; i++) {
    var val1 = result[i];
    if (i == result.length - 1 && resp.length == 1 && (val1 == '+' || val1 == '-' || val1 == '*' || val1 == '/')) {
      stop = "stop";
    } 
    else {
      if (val1 != '+' && val1 != '-' && val1 != '*' && val1 != '/') {
        var num1 = int.parse(val1);
        resp = push(resp, num1);
      } 
      else {
        if (val1 == '+') {
          presp = resp[resp.length - 2] + resp[resp.length - 1];
        }
        if (val1 == '-') {
          presp = resp[resp.length - 2] - resp[resp.length - 1];
        }
        if (val1 == '*') {
          presp = resp[resp.length - 2] * resp[resp.length - 1];
        }
        if (val1 == '/') {
          presp = resp[resp.length - 2] / resp[resp.length - 1];
        }
        resp = pop(resp);
        resp = pop(resp);
        resp = push(resp, presp);
      }
    }
  }
  if (resp.length != 1 || stop == "stop") {
    print('ERRO!');
  } 
  else {
    print(resp);
  }
}

pop(expressao){
  var pexpressao = expressao;
  expressao = List<int>.filled(pexpressao.length-1, 0, growable: true);
  for (var i = 0; i < expressao.length; i++){
    expressao[i] = pexpressao[i];
  }
}
push(expressao, number){
  var pexpressao = expressao;
  expressao = List<int>.filled(pexpressao.length + 1, 0, growable: true);
  expressao[pexpressao.length] = number;
  for (var i = 0; i < expressao.length - 1; i++){
    expressao[i] = pexpressao[i];
  }
}
