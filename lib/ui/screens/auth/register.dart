import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextFormField({hintText, height = 10.0}) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _buildTextFormField(hintText: 'Kullanıcı Adı'),
            _buildTextFormField(hintText: 'Şifre'),
            _buildTextFormField(hintText: 'Şifre (Tekrar)', height: 50.0),
            RaisedButton(
              child: Text('Giriş Yap'),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hesabınız var mı?'),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text('Giriş yapın.'),
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
      body: Column(
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
            child: _buildRegisterForm(),
          ),
        ],
      ),
    );
  }
}
