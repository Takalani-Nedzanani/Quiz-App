import 'package:flutter/material.dart';

void main() {
  runApp(SchoolQuizApp());
}

class SchoolQuizApp extends StatelessWidget {
  const SchoolQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.teal[900]),
        ),
      ),
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  final List<Question> _questions = [
    Question(
      questionText: "What is the capital of France?",
      options: ["Paris", "London", "Berlin", "Madrid"],
      correctAnswer: "Paris",
    ),
    Question(
      questionText: "What is 5 + 7?",
      options: ["10", "12", "14", "15"],
      correctAnswer: "12",
    ),
    Question(
      questionText: "Which planet is known as the Red Planet?",
      options: ["Earth", "Mars", "Jupiter", "Venus"],
      correctAnswer: "Mars",
    ),
    Question(
      questionText: "What is the boiling point of water?",
      options: ["90°C", "100°C", "120°C", "150°C"],
      correctAnswer: "100°C",
    ),
    Question(
      questionText: "Who wrote 'Romeo and Juliet'?",
      options: [
        "Charles Dickens",
        "William Shakespeare",
        "J.K. Rowling",
        "Mark Twain"
      ],
      correctAnswer: "William Shakespeare",
    ),
    Question(
      questionText: "What is the largest planet in our solar system?",
      options: ["Earth", "Saturn", "Jupiter", "Neptune"],
      correctAnswer: "Jupiter",
    ),
    Question(
      questionText: "What is the square root of 64?",
      options: ["6", "8", "10", "12"],
      correctAnswer: "8",
    ),
    Question(
      questionText: "Which country is known as the Land of the Rising Sun?",
      options: ["China", "Japan", "India", "South Korea"],
      correctAnswer: "Japan",
    ),
    Question(
      questionText: "What is the chemical symbol for water?",
      options: ["H2O", "CO2", "O2", "NaCl"],
      correctAnswer: "H2O",
    ),
    Question(
      questionText: "What is the capital of Italy?",
      options: ["Venice", "Rome", "Milan", "Naples"],
      correctAnswer: "Rome",
    ),
    Question(
      questionText: "What is 12 x 12?",
      options: ["120", "144", "150", "160"],
      correctAnswer: "144",
    ),
    Question(
      questionText: "Who painted the Mona Lisa?",
      options: ["Van Gogh", "Leonardo da Vinci", "Picasso", "Monet"],
      correctAnswer: "Leonardo da Vinci",
    ),
    Question(
      questionText: "What is the smallest prime number?",
      options: ["0", "1", "2", "3"],
      correctAnswer: "2",
    ),
    Question(
      questionText: "What is the main ingredient in guacamole?",
      options: ["Tomato", "Avocado", "Lettuce", "Cucumber"],
      correctAnswer: "Avocado",
    ),
    Question(
      questionText: "What is the capital of Australia?",
      options: ["Sydney", "Melbourne", "Canberra", "Brisbane"],
      correctAnswer: "Canberra",
    ),
    Question(
      questionText: "What is the speed of light?",
      options: ["3,000 km/s", "300,000 km/s", "3,000,000 km/s", "300 km/s"],
      correctAnswer: "300,000 km/s",
    ),
    Question(
      questionText: "What is the freezing point of water?",
      options: ["0°C", "10°C", "-10°C", "-20°C"],
      correctAnswer: "0°C",
    ),
    Question(
      questionText: "Who is the author of 'Harry Potter'?",
      options: ["J.R.R. Tolkien", "J.K. Rowling", "C.S. Lewis", "Stephen King"],
      correctAnswer: "J.K. Rowling",
    ),
    Question(
      questionText: "What is the currency of Japan?",
      options: ["Dollar", "Euro", "Yen", "Won"],
      correctAnswer: "Yen",
    ),
    Question(
      questionText: "What gas do plants absorb from the atmosphere?",
      options: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      correctAnswer: "Carbon Dioxide",
    ),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex].correctAnswer) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.teal[800],
      ),
      body: _currentQuestionIndex < _questions.length
          ? QuizQuestion(
              question: _questions[_currentQuestionIndex],
              onOptionSelected: _checkAnswer,
            )
          : QuizResult(
              score: _score,
              totalQuestions: _questions.length,
              onReset: _resetQuiz,
            ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizQuestion extends StatelessWidget {
  final Question question;
  final void Function(String) onOptionSelected;

  const QuizQuestion({
    required this.question,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.questionText,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          SizedBox(height: 20.0),
          ...question.options.map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal[300],
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                onPressed: () => onOptionSelected(option),
                child: Text(option),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizResult extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onReset;

  const QuizResult({
    required this.score,
    required this.totalQuestions,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!\nYour Score: $score / $totalQuestions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.teal[900],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal[600],
              textStyle: TextStyle(fontSize: 18.0),
            ),
            onPressed: onReset,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
