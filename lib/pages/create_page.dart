import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
    return TextField();
  }
}
