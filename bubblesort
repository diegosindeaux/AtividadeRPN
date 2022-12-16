void main() {
  var cont = 0;
  var test = [8, 3, 2, 4, 10, 9, 7];
  for (var i = 0; i < test.length -1; i++){
    if (test[i] > test[i + 1]){
      var x = test[i + 1];
      test[i + 1] = test[i];
      test[i] = x;
      cont++;
      i = 0;
    }
    if (cont != 0){
      cont = 0;
      i = -1;
    }
  }  
  print(test);
}
