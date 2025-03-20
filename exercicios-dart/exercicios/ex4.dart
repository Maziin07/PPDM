import 'dart:io';

void compararNumeros() {
  print("Digite o primeiro número: ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Digite o segundo número: ");
  int num2 = int.parse(stdin.readLineSync()!);

  if (num1 > num2) {
    print("O maior número é: $num1");
  } else if (num2 > num1) {
    print("O maior número é: $num2");
  } else {
    print("Os números são iguais.");
  }
}


