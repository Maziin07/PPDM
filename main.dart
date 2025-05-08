import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(HepatitisAQuizApp());
}

class HepatitisAQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Hepatite A',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<List<dynamic>> _loadQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/questions.json');
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz sobre Hepatite A',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  final questions = await _loadQuestions();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizPage(questions: questions),
                    ),
                  );
                },
                child: Text('Iniciar Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<dynamic> questions;
  QuizPage({required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == widget.questions[_currentIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentIndex++;
    });

    if (_currentIndex >= widget.questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: _score, total: widget.questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= widget.questions.length) return SizedBox();

    final question = widget.questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${_currentIndex + 1}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['question'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ...List.generate(question['options'].length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => _answerQuestion(index),
                  child: Text(question['options'][index]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você acertou $score de $total!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: Text('Voltar ao Início'),
              )
            ],
          ),
        ),
      ),
    );
  }
}