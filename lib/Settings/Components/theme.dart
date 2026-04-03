import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
import 'package:sajha_bookstore/Widgets/box.dart';
import 'package:sajha_bookstore/Widgets/mybutton.dart';
import 'package:sajha_bookstore/themes/themeprovider.dart';

class theme extends StatelessWidget {
  const theme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(
            'Theme',
            style: TextStyle(fontSize: 20, fontFamily: bold, color: color1),
          ),
          leading: BackButton(
            color: color1,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: MyBox(
              color: Theme.of(context).colorScheme.primary,
              child: MyButton(
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              )),
        ));
  }
}
