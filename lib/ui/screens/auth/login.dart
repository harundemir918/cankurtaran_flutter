import 'package:flutter/material.dart';

import 'register.dart';
import '../panel/main_panel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextFormField({hintText, height = 10.0, value, hide = false}) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: (val) {
            setState(() {
              value = val;
            });
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Lütfen ${hintText.toString().toLowerCase()} alanını boş bırakmayın.';
            }
            return null;
          },
          obscureText: hide ? true : false,
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    var _username = '';
    var _password = '';

    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _buildTextFormField(
              hintText: 'Kullanıcı Adı',
              value: _username,
            ),
            _buildTextFormField(
              hintText: 'Şifre',
              height: 50.0,
              value: _password,
              hide: true,
            ),
            RaisedButton(
              child: Text('Giriş Yap'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPanel(),
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hesabınız yok mu?'),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text('Bize katılın.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/earthquake-icon.jpg',
              width: 300,
              height: 300,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: _buildLoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
