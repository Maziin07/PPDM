
import 'dart:io';

void tabuadaAutomatica() {
  print("Digite um numero:");
  int numero = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    print("numero x $i = ${numero * i}");
  }
}