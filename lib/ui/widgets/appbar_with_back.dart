import 'package:flutter/material.dart';

import 'package:cankurtaran/constants.dart';

class AppBarWithBack extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  AppBarWithBack({
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
        icon: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.black,),
          onPressed: () {},
        ),
      ],
    );
  }
}
