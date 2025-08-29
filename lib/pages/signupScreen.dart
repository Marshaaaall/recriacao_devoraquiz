// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const SignupScreen({
    Key? key,
    required this.showLoginScreen,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //* text controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _zoneController = TextEditingController();
  final _scoreController = TextEditingController();
  final edulvlValue = ValueNotifier('');
  final edulvlOptions = [
    'Superior completo',
    'Superior incompleto',
    'Ensino Médio completo',
    'Ensino Médio incompleto',
    'Ensino Fundamental completo',
    'Ensino Fundamental incompleto',
    'Alfabetizado',
    'Sem escolaridade'
  ];

  final sexValue = ValueNotifier('');
  final sexOptions = [
    'Masculino',
    'Feminino',
    'Outro',
    'Prefiro não responder'
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _zoneController.dispose();
    edulvlValue.dispose();
    sexValue.dispose();
    super.dispose();
  }

  Future signUp() async {
    //* loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      //* creating user
      if (passConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim(),
        );

        //* adding user details
        addUserDetails(
          _nameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),
          _zoneController.text.trim(),
          edulvlValue.value.trim(),
          sexValue.value.trim(),
        );
      }

      //* pop loading circle
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      //* pop loading circle
      Navigator.of(context).pop();
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Future addUserDetails(
    String nome,
    String email,
    int idade,
    String regiao,
    String escolaridade,
    String genero,
  ) async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'nome': nome,
      'email': email,
      'idade': idade,
      'regiao': regiao,
      'escolaridade': escolaridade,
      'genero': genero,
      'scoredcnt': '0',
      'scorecarb': '0',
      'scorelipsat': '0',
      'scorelipins': '0',
    });
  }

  bool passConfirmed() {
    if (_passController.text.trim() == _confirmpassController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // *title
                Text(
                  'Devora Quiz',
                  style: GoogleFonts.teko(
                    fontSize: 52,
                  ),
                ),
                Text(
                  'Registre-se preenchendo os campos abaixo.',
                  style: GoogleFonts.teko(
                    color: Color.fromARGB(255, 81, 187, 136),
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 40),

                //* name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Nome',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'E-mail',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* pass textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Senha',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* confirm pass textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmpassController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirmar Senha',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* age textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Idade',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* zone textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _zoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Região',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //* education field
                ValueListenableBuilder(
                  valueListenable: edulvlValue,
                  builder: (BuildContext context, String value, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        hint: const Text('Selecione sua escolaridade'),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (escolhaedu) =>
                            edulvlValue.value = escolhaedu.toString(),
                        items: edulvlOptions
                            .map(
                              (opedu) => DropdownMenuItem(
                                value: opedu,
                                child: Text(opedu),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),

                //* sex field
                ValueListenableBuilder(
                  valueListenable: sexValue,
                  builder: (BuildContext context, String value, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        hint: const Text('Selecione seu gênero'),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (escolhasex) =>
                            sexValue.value = escolhasex.toString(),
                        items: sexOptions
                            .map(
                              (opsex) => DropdownMenuItem(
                                value: opsex,
                                child: Text(opsex),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),

                //* sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                //* not registered?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já sou cadastrado! ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginScreen,
                      child: Text(
                        'Logar agora',
                        style: TextStyle(
                          color: Color.fromARGB(255, 81, 187, 136),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
