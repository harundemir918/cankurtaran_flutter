import 'package:cankurtaran/ui/screens/panel/call_for_help_panel.dart';
import 'package:cankurtaran/ui/screens/panel/emergency_panel.dart';
import 'package:cankurtaran/ui/screens/panel/last_earthquakes_panel.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_with_menu.dart';

class MainPanel extends StatefulWidget {
  static const routeName = '/main-panel';

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    CallForHelpPanel(),
    EmergencyPanel(),
    LastEarthquakesPanel(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithMenu(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 20,
          ),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Yardım Çağır',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Acil Durumdakiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Son Depremler',
          ),
        ],
      ),
    );
  }
}
