// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'headingWidget.dart';

class NGO_Reg extends StatefulWidget {
  @override
  State<NGO_Reg> createState() => _NGO_RegState();
}

final _formKey = GlobalKey<FormState>();

var name = "";
var address = "";
var cell = "";

// Create a text controller and use it to retrieve the current value
// of the TextField.
final ngonameController = TextEditingController();
final addressController = TextEditingController();
final cellController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController storageController = TextEditingController();
TextEditingController passwordController = TextEditingController();
// AuthenticationServices _auth = AuthenticationServices();

clearText() {
  ngonameController.clear();
  emailController.clear();
  addressController.clear();
  passwordController.clear();
  cellController.clear();
}

class _NGO_RegState extends State<NGO_Reg> {
  String? value;
  final items = ['Karachi', 'Lahore', 'Islamabad', 'Quetta'];
  String city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        key: _formKey,
        child: Container(
          child: ListView(
            children: [
              HeadingWidget('NGO Registration'),
              Center(
                child: Container(
                  height: 450,
                  width: 300,
                  child: Column(
                    children: [
                      buildTextFormField('NGOs Name', ngonameController),
                      SizedBox(height: 15),
                      buildTextFormField('Address', addressController),
                      SizedBox(height: 15),
                      buildTextFormField('Email', emailController),
                      SizedBox(height: 15),
                      Form(
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              fillColor: Color(0xff8CA1A5),
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            print(textController);
                          },
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      Form(
                        child: TextFormField(
                          controller: cellController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Color(0xff8CA1A5),
                              filled: true,
                              hintText: 'Contact',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            print(textController);
                          },
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      Form(
                        child: TextFormField(
                          controller: storageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Color(0xff8CA1A5),
                              filled: true,
                              hintText: 'Storage',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            print(textController);
                          },
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff8CA1A5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              child: DropdownButton<String>(
                                  hint: Text(
                                    'Select City',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  dropdownColor: Color(0xff8CA1A5),
                                  value: value,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) {
                                    city = value!;
                                    setState(() => {this.value = value});
                                    print(city);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                height: 50,
                width: 06,
                child: ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    regNgo();
                    setState(() {
                      name = ngonameController.text;
                      address = addressController.text;
                      cell = cellController.text;

                      clearText();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController textController = TextEditingController();
  Form buildTextFormField(hintname, textController) {
    return Form(
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
            fillColor: Color(0xff8CA1A5),
            filled: true,
            hintText: hintname,
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
          print(textController);
        },
      ),
    );
  }

  Future regNgo() async {
    String ngoname = ngonameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String address = addressController.text;
    String contact = cellController.text;
    int storage = int.parse(storageController.text);
    String cities = city;
    var data = {
      'ngoname': ngoname,
      'email': email,
      'password': password,
      'address': address,
      'contact': contact,
      'storage': storage,
      'city': cities
    };
    String url = 'https://edonations.000webhostapp.com/api-ngo-reg.php';
    final response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ngo Registered Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: Not Registered!!')));
    }
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
