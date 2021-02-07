import 'package:flutter/material.dart';

import 'register.dart';
import '../../../api/api.dart';
import '../panel/main_panel.dart';
import '../../widgets/logo.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildTextFormField({hintText, height = 10.0, formValue, hide = false}) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          controller: formValue,
          onChanged: (val) {
            setState(() {
              formValue = val;
            });
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Lütfen ${hintText.toString().toLowerCase()} alanını boş bırakmayın.';
            }
            formValue = value;
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
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _buildTextFormField(
              hintText: 'Email',
              formValue: _email,
            ),
            _buildTextFormField(
              hintText: 'Şifre',
              height: 50.0,
              formValue: _password,
              hide: true,
            ),
            ElevatedButton(
              child: Text('Giriş Yap'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  Api api = Api();
                  bool _isLoggedIn = await api.logIn(email: _email.text.toString(), password: _password.text.toString());
                  if (_isLoggedIn) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPanel(),
                      ),
                    );
                  }
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hesabınız yok mu?'),
                TextButton(
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
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Logo(width: deviceWidth * 0.5, height: deviceHeight * 0.5,),
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
