import 'package:flutter/material.dart';

class FormFieldComponet extends StatelessWidget {
  String? hiddenText;
  FormFieldComponet({super.key, required this.hiddenText});

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
