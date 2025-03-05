import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager_with_d4/models/login_model.dart';
import 'package:password_manager_with_d4/pages/create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PasswordModel> passwords = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CupertinoButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(),
                ),
              );
              load();
            },
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
