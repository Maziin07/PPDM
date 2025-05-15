import 'package:flutter/material.dart';

void main() {
  // Ponto de entrada do app
  runApp(AnimalQuizApp());
}

// Widget raiz do aplicativo
class AnimalQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Que animal você seria?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color.fromARGB(255, 96, 236, 229),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: StartScreen(), // Tela inicial
    );
  }
}

// === StartScreen ===
// Tela de boas-vindas com botão para iniciar o quiz
class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descubra seu animal interior'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🐾 Você já se perguntou que animal reflete sua personalidade?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navega para QuizScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => QuizScreen()),
                  );
                },
                child: Text('Começar o Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}

// === QuizScreen ===
// Tela que apresenta perguntas e coleta respostas
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;                      // Índice da pergunta atual
  Map<String, int> _scores = {                 // Armazena pontuação por animal
    'Tigre': 0,
    'Gavião': 0,
    'Cachorro Caramelo': 0,
    'Urso Polar': 0,
    'Cabra': 0,
    'Pantera': 0,
  };

  // Lista de perguntas, cada uma com mapa de opções -> animal
  final _questions = [
    {
      'question': 'O que você prefere fazer no tempo livre?',
      'answers': {
        'Explorar e liderar': 'Tigre',
        'Ler ou estudar': 'Gavião',
        'Conversar e brincar': 'Cachorro Caramelo',
        'Descansar e relaxar': 'Urso Polar',
        'Praticar Esportes': 'Cabra',
        'Ouvir Musica': 'Pantera',
      }
    },
    {
      'question': 'Como você se descreveria?',
      'answers': {
        'Corajoso(a) e determinado(a)': 'Tigre',
        'Inteligente e observador(a)': 'Gavião',
        'Alegre e sociável': 'Cachorro Caramelo',
        'Calmo(a) e confiável': 'Urso Polar',
        'Confiante e competitivo': 'Cabra',
        'Tranquilo e Serio': 'Pantera',
      }
    },
    {
      'question': 'Qual ambiente você prefere?',
      'answers': {
        'Selva ou floresta': 'Tigre',
        'Lugar tranquilo para pensar': 'Gavião',
        'Praia ou mar': 'Cachorro Caramelo',
        'Cabana nas montanhas': 'Urso Polar',
        'Campo ou chácara': 'Cabra',
        'Parques Naturais': 'Pantera',
      }
    },
    {
    'question': 'Como você lida com desafios?',
    'answers': {
      'Enfrento de frente, com coragem': 'Tigre',
      'Analiso antes de agir': 'Gavião',
      'Busco apoio dos amigos': 'Cachorro Caramelo',
      'Com calma e paciência': 'Urso Polar',
      'Uso como motivação para vencer': 'Cabra',
      'Me adapto e sigo em frente': 'Pantera',
  }
},
{
  'question': 'Qual dessas atividades mais te atrai?',
  'answers': {
    'Tomar decisões importantes': 'Tigre',
    'Resolver enigmas ou puzzles': 'Gavião',
    'Participar de festas ou encontros': 'Cachorro Caramelo',
    'Assistir filmes ou séries': 'Urso Polar',
    'Subir montanhas ou correr': 'Cabra',
    'Ouvir músicas ou meditar': 'Pantera',
  }
},
{
  'question': 'Qual dessas palavras te define melhor?',
  'answers': {
    'Liderança': 'Tigre',
    'Sabedoria': 'Gavião',
    'Alegria': 'Cachorro Caramelo',
    'Tranquilidade': 'Urso Polar',
    'Energia': 'Cabra',
    'Misteriosidade': 'Pantera',
  }
},
{
  'question': 'O que você valoriza em um amigo?',
  'answers': {
    'Lealdade': 'Tigre',
    'Inteligência': 'Gavião',
    'Diversão': 'Cachorro Caramelo',
    'Fidelidade': 'Urso Polar',
    'Espontaneidade': 'Cabra',
    'Profundidade': 'Pantera',
  }
},
{
  'question': 'Qual dessas cores te atrai mais?',
  'answers': {
    'Dourado': 'Tigre',
    'Azul escuro': 'Gavião',
    'Turquesa': 'Cachorro Caramelo',
    'Marrom': 'Urso Polar',
    'Verde': 'Cabra',
    'Preto': 'Pantera',
  }
},
{
  'question': 'Como você prefere trabalhar?',
  'answers': {
    'Liderando uma equipe': 'Tigre',
    'Sozinho, com foco': 'Gavião',
    'Em grupo, colaborando': 'Cachorro Caramelo',
    'Com estabilidade e rotina': 'Urso Polar',
    'Com liberdade e movimento': 'Cabra',
    'No seu ritmo, com autonomia': 'Pantera',
  }
},
{
  'question': 'O que te motiva na vida?',
  'answers': {
    'Conquistar objetivos': 'Tigre',
    'Aprender constantemente': 'Gavião',
    'Relacionamentos e conexões': 'Cachorro Caramelo',
    'Bem-estar e segurança': 'Urso Polar',
    'Superar desafios': 'Cabra',
    'Buscar sentido e autenticidade': 'Pantera',
  }
},
  ];

  // Método chamado ao selecionar uma resposta
  void _answerQuestion(String animal) {
    setState(() {
      _scores[animal] = _scores[animal]! + 1;
      _questionIndex++;
    });

    // Se acabou as perguntas, navega para tela de resultado
    if (_questionIndex >= _questions.length) {
      String resultAnimal = _getResultAnimal();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(animal: resultAnimal),
        ),
      );
    }
  }

  // Retorna o animal com maior pontuação
  String _getResultAnimal() {
    return _scores.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  @override
  Widget build(BuildContext context) {
    var current = _questions[_questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${_questionIndex + 1} de ${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current['question'] as String,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ...(current['answers'] as Map<String, String>).entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(entry.value),
                  child: Text(entry.key),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === ResultScreen ===
// Tela que exibe o resultado final com emoji e descrição
class ResultScreen extends StatelessWidget {
  final String animal; // Animal definido

  ResultScreen({required this.animal});

  final _descriptions = {
    'Tigre': '🐯 Você é líder, corajoso(a) e determinado(a)!',
    'Gavião': '🦅 Você é sábio(a), observador(a) e ama aprender!',
    'Cachorro Caramelo': '🐶 Você é alegre, comunicativo(a) e divertido(a)!',
    'Urso Polar': '🐻‍❄️ Você é tranquilo(a), acolhedor(a) e confiável!',
    'Cabra': '🐐 Você é confiante, competitivo(a) e aventureiro(a)! GOAT',
    'Pantera': '𓃬 Você é tranquilo, sério e sereno!',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seu animal interior')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Emoji + descrição
              Text(
                _descriptions[animal]!,
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Reinicia o quiz
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => StartScreen()),
                  );
                },
                child: Text('Refazer o Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}