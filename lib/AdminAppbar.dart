// ignore_for_file: file_names, prefer_const_constructors

import 'package:admin_site/donationHistory.dart';
import 'package:flutter/material.dart';
import 'AdminDashboard.dart';
import 'EditProfile.dart';
import 'main.dart';
import 'my_drawer_header.dart';
import 'ngo_reg.dart';

class HomePage extends StatefulWidget {
  final username;
  final email;

  const HomePage(this.username, this.email);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.AdminDashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.AdminDashboard) {
      container = AdminDashboard(widget.username);
    } else if (currentPage == DrawerSections.myprofile) {
      container = EditProfile(widget.username, widget.email);
    } else if (currentPage == DrawerSections.donations) {
      container = DonartionHistory();
    } else if (currentPage == DrawerSections.notifications) {
      container = DonartionHistory();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.1,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
          child: Text("E-Donation"),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(widget.email, widget.username),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "My Profile", Icons.image,
              currentPage == DrawerSections.myprofile ? true : false),
          menuItem(2, "Donations", Icons.dashboard,
              currentPage == DrawerSections.donations ? true : false),
          Divider(),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(4, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.myprofile;
            } else if (id == 2) {
              currentPage = DrawerSections.donations;
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
            } else if (id == 4) {
              currentPage = DrawerSections.notifications;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  myprofile,
  donations,
  settings,
  notifications,
  notes,
  AdminDashboard,
}
