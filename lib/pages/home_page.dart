import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  void load() async {
    passwords = await getPasswords();
    setState(() {});
  }

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
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: passwords.length,
          itemBuilder: (context, index) {
            final pass = passwords[index];
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pass.service),
                    Spacer(),
                    Text(pass.phoneNumber),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(DateFormat.yMMMMd().format(pass.time)),
                    Text(" at "),
                    Text(DateFormat.Hm().format(pass.time)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
