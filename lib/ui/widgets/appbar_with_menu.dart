import 'package:flutter/material.dart';

import '../screens/panel/profile_panel.dart';
import '../../constants.dart';

class AppBarWithMenu extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  AppBarWithMenu({
    this.preferredSize = const Size.fromHeight(50.0),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appName,
        style: Theme.of(context).textTheme.headline5,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePanel(),
              ),
            );
          },
        ),
      ],
    );
  }
}
