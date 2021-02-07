import 'package:flutter/material.dart';

class AppBarWithMenu extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String title;

  AppBarWithMenu({
    this.preferredSize = const Size.fromHeight(50.0),
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black,),
        onPressed: () {},
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
