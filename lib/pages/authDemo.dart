import 'package:flutter/material.dart';

class AuthDemo extends StatefulWidget {
  const AuthDemo({Key? key}) : super(key: key);

  @override
  _AuthDemoState createState() => _AuthDemoState();
}

class _AuthDemoState extends State<AuthDemo> {
  final _formKey = GlobalKey<FormState>();
  dynamic colorTheme = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        backgroundColor: colorTheme,
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("CRIAR CONTA", style: TextStyle(fontSize: 15.0)),
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Número com DDD", focusColor: colorTheme),
                keyboardType: TextInputType.phone,
                validator: (text) {
                  if (text == null ||
                      text.isEmpty ||
                      text.length < 11 ||
                      text.length > 11) {
                    return "Número inválido!";
                  } else {
                    return null;
                  }
                }),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
                validator: (text) {
                  if (text == null || text.isEmpty || text.length < 6) {
                    return "A senha deve ter pelo menos 6 caracteres.";
                  } else {
                    return null;
                  }
                }),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: colorTheme,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
