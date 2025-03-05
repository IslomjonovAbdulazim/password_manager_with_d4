import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../models/login_model.dart';

class CreatePage extends StatefulWidget {
  final PasswordModel? password;

  const CreatePage({super.key, this.password});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController serviceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
    mask: "(##) ### ##-##",
    filter: {"#": RegExp(r"[0-9]")},
  );

  @override
  void initState() {
    serviceController.text = widget.password?.service ?? "";
    phoneController.text = widget.password?.phoneNumber ?? "";
    emailController.text = widget.password?.email ?? "";
    passwordController.text = widget.password?.password ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class _FieldWidget extends StatelessWidget {
  final String name;
  final String hint;
  final TextEditingController controller;
  final FocusNode focus;
  final MaskTextInputFormatter formatter;
  final bool isNumberOnly;

  const _FieldWidget({
    super.key,
    required this.name,
    required this.hint,
    required this.controller,
    required this.focus,
    required this.formatter,
    required this.isNumberOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

    );
  }
}
