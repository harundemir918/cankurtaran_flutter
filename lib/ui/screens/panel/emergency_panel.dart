import 'package:cankurtaran/models/emergency_model.dart';
import 'package:cankurtaran/ui/screens/panel/find_me.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';

class EmergencyPanel extends StatefulWidget {
  static const routeName = '/emergency-panel';

  @override
  _EmergencyPanelState createState() => _EmergencyPanelState();
}

class _EmergencyPanelState extends State<EmergencyPanel> {
  Api api = Api();
  List<EmergencyModel> _emergencyList = [];

  void initState() {
    super.initState();
    _fetchEmergency();
  }

  _fetchEmergency() async {
    _emergencyList = await api.fetchEmergency();
    setState(() {});
  }

  Widget _buildListElement({name, picture, message, lat, lng}) {
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
                    child: Image.network(picture),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(name),
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
                    message,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindMe(
                            latitude: lat,
                            longitude: lng,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Beni Bul',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
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
      child: ListView.builder(
          itemCount: _emergencyList.length,
          itemBuilder: (context, index) {
            return _buildListElement(
              name: _emergencyList[index].user.name,
              picture: _emergencyList[index].user.profilePicture,
              message: _emergencyList[index].message,
              lat: _emergencyList[index].lat,
              lng: _emergencyList[index].lng,
            );
          }),
    );
  }
}
