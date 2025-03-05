import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Password Detail"),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              PasswordModel password = PasswordModel(
                service: serviceController.text.trim(),
                phoneNumber: phoneController.text.trim(),
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                time: widget.password?.time ?? DateTime.now(),
              );
              createPassword(password);
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _FieldWidget(
                name: "Service",
                hint: "Service...",
                controller: serviceController,
                focus: FocusNode(),
                formatter: null,
                isNumberOnly: false,
              ),
              _FieldWidget(
                name: "Phone Number",
                hint: "Phone Number...",
                controller: phoneController,
                focus: FocusNode(),
                formatter: phoneMask,
                isNumberOnly: true,
              ),
              _FieldWidget(
                name: "Email",
                hint: "Email...",
                controller: emailController,
                focus: FocusNode(),
                formatter: null,
                isNumberOnly: false,
              ),
              _FieldWidget(
                name: "Password",
                hint: "Password...",
                controller: passwordController,
                focus: FocusNode(),
                formatter: null,
                isNumberOnly: false,
              ),
            ],
          ),
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
  final MaskTextInputFormatter? formatter;
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          TextField(
            controller: controller,
            focusNode: focus,
            onTapOutside: (value) => focus.unfocus(),
            maxLength: 100,
            autocorrect: false,
            keyboardType: isNumberOnly ? TextInputType.number : null,
            textInputAction: TextInputAction.next,
            inputFormatters: formatter != null ? [formatter!] : [],
            decoration: InputDecoration(
              counter: SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
