import 'package:cankurtaran/ui/widgets/appbar_with_menu.dart';
import 'package:flutter/material.dart';

class EmergencyPanel extends StatefulWidget {
  static const routeName = '/emergency-panel';

  @override
  _EmergencyPanelState createState() => _EmergencyPanelState();
}

class _EmergencyPanelState extends State<EmergencyPanel> {
  Widget _buildListElement() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text('İS'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('İsim Soyisim'),
                      Text('Şehir / Bölge'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    'xx,yy koordinatlarındayım. Yardım edin.',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Beni Bul',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Bilgilerimi Gör',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          _buildListElement(),
          _buildListElement(),
          _buildListElement(),
          _buildListElement(),
          _buildListElement(),
        ],
      ),
    );
  }
}
