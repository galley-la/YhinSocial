// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yhinsocial/utility/my_constant.dart';
import 'package:yhinsocial/widgets/show_text.dart';

class ShowForm extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool? obscue;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    required this.label,
    required this.iconData,
    this.obscue,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      height: 40,
      child: TextFormField(onChanged: changeFunc,
        obscureText: obscue ?? false,
        decoration: InputDecoration(fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          label: ShowText(
            label: label,
          ),
          prefixIcon: Icon(
            iconData,
            color: MyConstant.dark,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.dark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.active),
          ),
        ),
      ),
    );
  }
}
