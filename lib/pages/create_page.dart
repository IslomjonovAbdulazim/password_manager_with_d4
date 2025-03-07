import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  bool hidePassword = true;

  @override
  void initState() {
    serviceController.text = widget.password?.service ?? "";
    phoneController.text = widget.password?.phoneNumber ?? "";
    emailController.text = widget.password?.email ?? "";
    passwordController.text = widget.password?.password ?? "";
    super.initState();
  }

  void toggleEye() {
    hidePassword = !hidePassword;
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
          "Password Detail",
          style: GoogleFonts.ubuntuMono(
            color: Color(0xff1C1C1C),
            fontWeight: FontWeight.w600,
          ),
        ),
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
            child: Text(
              "Save",
              style: GoogleFonts.ubuntuMono(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                isHidden: hidePassword,
                toggleEye: toggleEye,
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
  final bool? isHidden;
  final void Function()? toggleEye;

  const _FieldWidget({
    super.key,
    required this.name,
    required this.hint,
    required this.controller,
    required this.focus,
    required this.formatter,
    required this.isNumberOnly,
    this.isHidden,
    this.toggleEye,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            controller: controller,
            focusNode: focus,
            onTapOutside: (value) => focus.unfocus(),
            maxLength: 100,
            autocorrect: false,
            keyboardType: isNumberOnly ? TextInputType.number : null,
            textInputAction: TextInputAction.next,
            inputFormatters: formatter != null ? [formatter!] : [],
            obscureText: isHidden == false,
            style: GoogleFonts.ubuntuMono(
              color: Color(0xff1C1C1C),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              counter: SizedBox.shrink(),
              filled: true,
              suffixIcon: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: toggleEye,
                child: isHidden == null
                    ? SizedBox.shrink()
                    : Image.asset(
                        "assets/eye${isHidden == true ? "_hidden" : ""}.png",
                        height: 24,
                        width: 24,
                        color: Color(0xff758393),
                      ),
              ),
              fillColor: Color(0xffF9F9F9),
              hintText: hint,
              hintStyle: GoogleFonts.ubuntuMono(
                color: Color(0xff758393),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
