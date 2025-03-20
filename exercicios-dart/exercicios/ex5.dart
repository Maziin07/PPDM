import 'dart:io';

void notaConceito() {
  stdout.write("Digite a nota (0-100): ");
  int nota = int.parse(stdin.readLineSync()!);

  String conceito;

  if (nota >= 90) {
    conceito = "A";
  } else if (nota >= 80) {
    conceito = "B";
  } else if (nota >= 70) {
    conceito = "C";
  } else if (nota >= 60) {
    conceito = "D";
  } else {
    conceito = "F";
  }

  print("O conceito correspondente é: $conceito");
}
