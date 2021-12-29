// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'myTextformFieldtwo.dart';
import 'toptitle.dart';
import 'Login.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  Future userRegistration() async {
    setState(() {
      visible = true;
    });

    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String address = addressController.text;
    String contact = contactController.text;

    var url = 'https://edonations.000webhostapp.com/admin-signup.php';

    var data = {
      'username': name,
      'email': email,
      'password': password,
      'address': address,
      'contact': contact
    };
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool isLoading = false;

  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {} on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => Login(),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() {
    if (emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        nameController.text.isEmpty &&
        addressController.text.isEmpty &&
        contactController.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (nameController.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("FullName Is Empty"),
        ),
      );
    } else if (emailController.text.isEmpty) {
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(emailController.text)) {
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (passwordController.text.length < 8) {
      scaffold.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password Is Too Short"),
        ),
      );
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  Widget _buildAllTextFormField() {
    return Container(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            controller: nameController,
            title: "FullName",
          ),
          MyTextFormField(
            controller: emailController,
            title: "Email",
          ),
          // SizedBox(
          //   height: 20,
          // ),
          MyTextFormField(
            controller: passwordController,
            title: "Password",
          ),
        ],
      ),
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButtonn(
            name: "Sign Up",
            onPressed: () {
              userRegistration();

              vaildation();
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveAccountOrNotPart() {
    return HaveAccountOrNot(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => Login(),
          ),
        );
      },
      subTitle: "Login",
      title: "I Have Already An Account?",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopTitle(
                  title: "SignUp",
                  subsTitle: "Create an Account",
                ),
                _buildAllTextFormField(),
                _buildButtonPart(),
                _buildHaveAccountOrNotPart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
