import 'package:cankurtaran/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_with_back.dart';

class ProfilePanel extends StatefulWidget {
  @override
  _ProfilePanelState createState() => _ProfilePanelState();
}

class _ProfilePanelState extends State<ProfilePanel> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildTextFormField({hintText, value, hide = false}) {
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
      ],
    );
  }

  Widget _buildProfileForm() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    var _name = '';
    var _address = '';
    var _blood = '';
    var _illness = '';

    List<String> _illnessList = ['Hastalık 1', 'Hastalık 2'];

    List<String> _bloodTypes = [
      'A Rh +',
      'A Rh -',
      'B Rh +',
      'B Rh -',
      '0 Rh +',
      '0 Rh -',
      'AB Rh +',
      'AB Rh -',
    ];

    String _selectedBlood;

    return Form(
      key: _formKey,
      child: Container(
        height: deviceHeight * 0.9,
        margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
        child: Column(
          children: [
            Container(
              width: deviceWidth * 0.3,
              height: deviceHeight * 0.3,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profilephoto.jpg'),
              ),
            ),
            _buildTextFormField(
              hintText: 'Harun Demir',
              value: _name,
            ),
            _buildTextFormField(
              hintText: 'ABC Sokak',
              value: _address,
            ),
            DropdownButtonFormField(
              hint: Text('Lütfen kan grubu seçin'),
              value: _selectedBlood,
              onChanged: (newValue) {
                setState(() {
                  _selectedBlood = newValue;
                });
              },
              items: _bloodTypes.map((bloodType) {
                return DropdownMenuItem(
                  child: Text(bloodType),
                  value: bloodType,
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Güncelle'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                  ),
                  ElevatedButton(
                    child: Container(
                      child: Text('İptal'),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.black54,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: deviceWidth * 0.65,
                  child: _buildTextFormField(
                    hintText: 'Hastalık',
                    value: _illness,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: deviceHeight * 0.02,),
            Container(
              height: deviceHeight * 0.2,
              child: ListView.builder(itemCount: _illnessList.length, itemBuilder: (context, index) {
                return Text(_illnessList[index]);
              }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: SingleChildScrollView(
        child: _buildProfileForm(),
      ),
    );
  }
}
