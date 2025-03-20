import 'dart:io';
import 'dart:math';

void numeroSecreto() {
  int numeroSecreto = Random().nextInt(100) + 1;
  int tentativas = 0;
  int palpite = 0;

  print("Tente advinhar o número entre 1 e 100!");

  while (palpite != numeroSecreto) {
    print("Digite seu palpite:");
    palpite = int.parse(stdin.readLineSync()!);
    tentativas++;

    if (palpite > numeroSecreto) {
      print("O número é menor!");
    }
      else if (palpite < numeroSecreto) {
        print("O número é maior!");
    } else {
      print("Parabéns! Você acertou em $tentativas tentativas.");
    }

    }
  }
