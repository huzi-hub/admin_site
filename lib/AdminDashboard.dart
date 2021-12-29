// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'donationHistory.dart';
import 'ngo_reg.dart';
import 'ngoRecords.dart';

class AdminDashboard extends StatefulWidget {
  final username;
  AdminDashboard(this.username);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 45,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images.png'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                                height: 80,
                                width: 190,
                                child: ListTile(
                                  title: Text(
                                    'Hello ${widget.username}',
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Container(
                height: 550,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              child: Container(
                                height: 130,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 120,
                                      color: Colors.white,
                                      width: 250,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      'assets/pic2.jpg',
                                                    ))),
                                          ),
                                          InkWell(
                                            child: Text(
                                              'Donation Record',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DonartionHistory();
                                              }));
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ), //food doation
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 130,
                              width: 280,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    height: 120,
                                    color: Colors.white,
                                    width: 240,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 90,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    'assets/pic3.jpg',
                                                  ))),
                                        ),
                                        InkWell(
                                          child: Text(
                                            'NGOs Record',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NGORecords()));
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 150,
                            width: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.white,

                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  height: 140,

                                  //color if needed

                                  width: 240,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 110,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  'assets/pic.jpg',
                                                ))),
                                      ),
                                      InkWell(
                                        child: Text(
                                          'NGO Registration',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NGO_Reg()));
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ), //book Donation
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
