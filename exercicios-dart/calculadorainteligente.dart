import 'dart:io';

void main() {
print("1-Exibir olá, Dart!");
print("2-Calcular a área de um retângulo");
print("3-Verificar se um número é par ou ímpar");
print("4-Comparar dois números");
print("5-Converter nota para conceito");
print("6-Exibir contagem progressiva");
print("7-Somar todos os números até um valor específicado");
print("8-Exibir a tabuada de um número");
print("9-sair do programa");

print("Escolha uma opção:");
  int opcao = int.parse(stdin.readLineSync()!);

  switch (opcao) {
    case 1:
      print("Olá, Dart!");
      break;
      case 2:
      print("Digite a base:");
  double base = double.parse(stdin.readLineSync()!);

  print("Digite a altura:");
   double altura = double.parse(stdin.readLineSync()!);
  print("A área é:");
   print(base * altura);
      break;
      case 3:
       print("Digite um número inteiro:");
  int numero = int.parse(stdin.readLineSync()!);
  
  if(numero % 2 ==0){
    print("O número $numero é par.");
  }else{
    print("O número $numero é ímpar.");
  }
  break;
  case 4:
  print("Digite o primeiro número:");
  int numero = int.parse(stdin.readLineSync()!);

  print("Digite o segundo número:");
  int numero2 = int.parse(stdin.readLineSync()!);

   if(numero > numero2){
    print("$numero mair que $numero2");
  } else if(numero2 > numero){
    print("$numero menor que $numero2");
  }else{
    print("os números são iguais");
  }
  break;
  case 5:
  print("Digite sua nota:");
  int nota = int.parse(stdin.readLineSync()!);

  if(nota >= 90 &&  nota <= 100 ){
   print("Sua classificação é A");
  }
  else if (nota >= 80 &&  nota <= 89 ){
   print("Sua classificação é B");
  }
  else if (nota >= 70 &&  nota <= 79 ){
   print("Sua classificação é C");
  }
  else if (nota >= 60 &&  nota <= 69 ){
   print("Sua classificação é D");
  }
  else{
    print("Nota inferior a 60");
  }
  break;
  case 6:
   print("Digite um número:");
  int numero = int.parse(stdin.readLineSync()!);

  for(int i=1; i <= numero; i++){
    print(i);
  }
  break;
  case 7:
   print("Digite um número:");
  int numero = int.parse(stdin.readLineSync()!);

  int soma = 0;
  int contador =1;

   while (contador <= numero){
    soma += contador;
    contador++;
  }
  print("A soma de 1 até $numero é $soma");
  break;
  case 8:
  print("Digite um número:");
  int numero = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    print("$numero x $i = ${numero * i}");
  }
  break;
  case 9:
  print("Sair do programa");
   break;
    default:
    print("Opção inválida");
    }
}