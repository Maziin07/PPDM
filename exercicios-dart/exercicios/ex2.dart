import 'dart:io';

void areaRetangulo() {
  stdout.write("Informe a base do retângulo: ");
  double base = double.parse(stdin.readLineSync()!);

  stdout.write("Informe a altura do retângulo: ");
  double altura = double.parse(stdin.readLineSync()!);

  double area = base * altura;
  print("A área do retângulo é: $area");
}
