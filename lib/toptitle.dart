import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subsTitle;
  TopTitle({required this.subsTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 255,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subsTitle,
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 25, 20, 20),
                    height: 108,
                    width: 150,
                    child: Image.asset(
                      'assets/1.png',
                      fit: BoxFit.fitWidth,
                      height: 100,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
