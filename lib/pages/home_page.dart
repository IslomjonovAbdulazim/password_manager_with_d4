import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Passwords",
          style: GoogleFonts.ubuntuMono(
            fontWeight: FontWeight.w600,
          ),
        ),
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
            child: Icon(
              CupertinoIcons.add,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: passwords.length,
          itemBuilder: (context, index) {
            final pass = passwords[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        await deletePassword(pass);
                        load();
                      },
                      icon: CupertinoIcons.delete,
                      borderRadius: BorderRadius.circular(15),
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
                child: CupertinoButton(
                  color: Color(0xffF8F8F8),
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePage(
                          password: pass,
                        ),
                      ),
                    );
                    load();
                  },
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pass.service,
                          style: GoogleFonts.ubuntuMono(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          pass.phoneNumber,
                          style: GoogleFonts.ubuntuMono(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          DateFormat.yMMMMd().format(pass.time),
                          style: GoogleFonts.ubuntuMono(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          " at ",
                          style: GoogleFonts.ubuntuMono(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          DateFormat.Hm().format(pass.time),
                          style: GoogleFonts.ubuntuMono(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
