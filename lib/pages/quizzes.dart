// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:recriacao_devoraquiz/questions/dcnt1.dart';
import 'package:recriacao_devoraquiz/pages/questionsCarbs.dart';
import 'package:recriacao_devoraquiz/pages/questionsDCNTS.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipIns.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipSat.dart';
import 'package:recriacao_devoraquiz/questionscarbo/carbo1.dart';

// Questionário de Carboidratos
class Carboidratos extends StatefulWidget {
  const Carboidratos({Key? key}) : super(key: key);

  @override
  State<Carboidratos> createState() => _CarboidratosState();
}

class _CarboidratosState extends State<Carboidratos> {
  //Manipular áudio

  late final AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  var carbotext = 'Carboidratos';

  var titlesize = 30.0;

  var textfontsize = 24.0;

  var intro =
      'Bora falar dele, esse importantíssimo elemento das nossas vidas: o carboidrato. Já te adianto que, às vezes, vou chamá-lo de carbo, hidrato de carbono, glicídios ou até mesmo AÇÚCAR. E o açúcar também pode ser chamado de glucose de milho, lactose, xarope de malte, sacarose, maltodextrina, melaço ou melado, mel, entre muitos outros.Assim como tem muitos nomes, também está em muitos lugares escondidos e que podem passar despercebidos na nossa alimentação. Está na fruta, na coxinha, no leite, no refrigerante, nas bolachas.  E em diferentes quantidades também. Vamos ver se você está atento aos alimentos em que nosso amigo carbo está presente?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            carbotext,
            style: TextStyle(
              fontSize: titlesize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    intro,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textfontsize,
                    ),
                  ),
                ),
                elevatedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: ElevatedButton.icon(
          label: const Text('Responder'),
          icon: const Icon(CupertinoIcons.play_arrow),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(240, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            _audioCache.play('pop_sound.mp3');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CARBO1()),
            );
          },
        ),
      ),
    );
  }
}

// Questionário de lipídeos saturados

class LipideosSat extends StatefulWidget {
  @override
  State<LipideosSat> createState() => _LipideosSatState();
}

class _LipideosSatState extends State<LipideosSat> {
  // Manipular áudio

  late final AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  var liptext = 'Lipídeos Saturados';

  var titlesize = 30.0;

  var textfontsize = 24.0;

  var intro =
      'Sabe aquele biscoitinho amanteigado que a gente adora? Então, ele tem aproximadamente 0,5 grama de gordura saturada e isso é bastante para um biscoitinho! E é aí onde queríamos chegar. A gordura saturada é um tipo de lipídio controverso porque em poucas quantidades é tolerado pelo nosso organismo. Mas, quando está disponível aos montes na nossa alimentação pode causar muitos estragos, como doenças cardiovasculares (infarto), AVC e aumenta o colesterol "ruim" (LDL). Vamos descobrir um pouco mais onde os lipídios estão na nossa alimentação e quais deles são preferíveis para mantermos um equilíbrio alimentar?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            liptext,
            style: TextStyle(
              fontSize: titlesize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    intro,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textfontsize,
                    ),
                  ),
                ),
                elevatedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: ElevatedButton.icon(
          label: const Text('Responder'),
          icon: const Icon(CupertinoIcons.play_arrow),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(240, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            _audioCache.play('pop_sound.mp3');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => lipsat_screen()),
            );
          },
        ),
      ),
    );
  }
}

// Questionário de lipídeos insaturados

class LipideosIns extends StatefulWidget {
  @override
  State<LipideosIns> createState() => _LipideosInsState();
}

class _LipideosInsState extends State<LipideosIns> {
  // Manipular áudio

  late final AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  var liptext = 'Lipídeos Insaturados';

  var titlesize = 30.0;

  var textfontsize = 24.0;

  var intro =
      'Agora vamos falar de uma prima das gorduras saturadas: as gorduras insaturadas e poli-insaturadas. Este tipo de lipídio nos traz muitos benefícios e são as gorduras melhor aceitas pelo nosso organismo. Estão presentes em alimentos como abacate, castanhas, amendoim, azeite de oliva e alguns peixes. Mas, não se engane, não é porque faz bem que devemos exagerar! Vamos descobrir um pouco mais onde os lipídios estão na nossa alimentação e quais deles são preferíveis para mantermos um equilíbrio alimentar?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            liptext,
            style: TextStyle(
              fontSize: titlesize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    intro,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textfontsize,
                    ),
                  ),
                ),
                elevatedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: ElevatedButton.icon(
          label: const Text('Responder'),
          icon: const Icon(CupertinoIcons.play_arrow),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(240, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            _audioCache.play('pop_sound.mp3');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => lipins_screen()),
            );
          },
        ),
      ),
    );
  }
}

class dcnts extends StatefulWidget {
  @override
  State<LipideosIns> createState() => _LipideosInsState();
}

class _dcntsInsState extends State<LipideosIns> {
  // Manipular áudio

  late final AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  var dcntstext = 'Doenças Crônicas não Transmissíveis';

  var titlesize = 30.0;

  var textfontsize = 24.0;

  var intro =
      'Agora vamos falar de uma prima das gorduras saturadas: as gorduras insaturadas e poli-insaturadas. Este tipo de lipídio nos traz muitos benefícios e são as gorduras melhor aceitas pelo nosso organismo. Estão presentes em alimentos como abacate, castanhas, amendoim, azeite de oliva e alguns peixes. Mas, não se engane, não é porque faz bem que devemos exagerar! Vamos descobrir um pouco mais onde os lipídios estão na nossa alimentação e quais deles são preferíveis para mantermos um equilíbrio alimentar?';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            dcntstext,
            style: TextStyle(
              fontSize: titlesize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    intro,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textfontsize,
                    ),
                  ),
                ),
                elevatedButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: ElevatedButton.icon(
          label: const Text('Responder'),
          icon: const Icon(CupertinoIcons.play_arrow),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(240, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            _audioCache.play('pop_sound.mp3');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => dcnts_screen()),
            );
          },
        ),
      ),
    );
  }
}

class sidebar extends StatelessWidget {
  var titletext = 'Lista de questionários';
  var carbotext = 'Carboidratos';
  var lipsattext = 'Lipídeos Saturados';
  var lipinstext = 'Lipídeos Insaturados';
  var dcntstext = 'Doenças Crônicas não Transmissíveis';
  var titlesize = 25.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              titletext,
              style: TextStyle(
                color: Colors.white,
                fontSize: titlesize,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text(carbotext),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Carboidratos()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text(lipsattext),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LipideosSat()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text(lipinstext),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LipideosIns()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text(dcntstext),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dcnts()),
              );
            },
          ),
        ],
      ),
    );
  }
}
