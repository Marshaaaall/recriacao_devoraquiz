// ignore: file_names
class Question {
  late final int id, answer;
  late final String question;
  late final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

// ignore: constant_identifier_names
const List sample_data = [
  {
    "id": 1,
    "question": "Com qual situção você mais se identifica ao acordar?",
    "options": ['Insonia', 'Dormi bem', 'Dificuldade ao acordar'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question":
        "Com qual situção você mais se identifica ao tomar seu café da manhã?",
    "options": ['Não toma', 'Café com pão e manteiga', 'Café completo(Frutas)'],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "Com qual situção você mais se identifica ao se locomover?",
    "options": ['Ônibus', 'A pé', 'Carro'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Com qual situção você mais se identifica ao almoçar?",
    "options": [
      'Alimentação sem variedade',
      'Arroz + feijão + carne',
      'arroz, feijão, proteína, legumes e verduras'
    ],
    "answer_index": 4,
  },
  {
    "id": 5,
    "question": "Como é seu ambiente de trabalho/escolar no dia a dia",
    "options": ['ambiente tóxico', 'agradável', 'Sem trabalho'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Com qual afirmação você mais se identifica?",
    "options": [
      'Chego em casa e relaxo',
      'Tenho que cuidar da família e casa',
      'Eu saio do trabalho e vou estudar'
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Seu sono tem seguido qual das alternativas?",
    "options": [
      'Durmo menos que 7h',
      'Durmo mais que 10hrs',
      'Durmo 7hrs tranquilas'
    ],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "Ultimamente seu final de semana tem sido como?",
    "options": [
      'Muito cansativo, pois trabalho',
      'Consigo descansar bem',
      'Tenho que fazer faxina'
    ],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Como é o seu trabalho?",
    "options": ['Muito movimentado!', 'Eu trabalho parado o dia todo'],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question": "Você bebe muito?",
    "options": [
      'Sim, sempre que saio bebo mais que 5 doses',
      'Não bebo',
      'Não, bebo menos que 4 doses'
    ],
    "answer_index": 2,
  },
  {
    "id": 11,
    "question": "Fuma?",
    "options": ['Sim', 'Não'],
    "answer_index": 2,
  },
];
