// ignore: file_names

// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  MyTextFormField({required this.title, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.blue,
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class MyButtonn extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  MyButtonn({required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Theme.of(context).primaryColor,
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class HaveAccountOrNot extends StatelessWidget {
  final String title, subTitle;
  final VoidCallback onTap;
  HaveAccountOrNot(
      {required this.onTap, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class MyPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  MyPasswordTextFormField({required this.title, required this.controller});

  @override
  _MyPasswordTextFormFieldState createState() =>
      _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText == true ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          fillColor: Colors.blue,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          hintText: widget.title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )),
    );
  }
}
