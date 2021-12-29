// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './headingWidget.dart';
import './main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'models/donationsModel.dart';

// ignore: must_be_immutable
class DonartionHistory extends StatefulWidget {
  //DonartionHistory(this.donations);
  @override
  _DonartionHistoryState createState() => _DonartionHistoryState();
}

late TooltipBehavior _tooltipBehavior;

class _DonartionHistoryState extends State<DonartionHistory> {
  final List data = [];
  @override
  void initState() {
    super.initState();
  }

  late int ngoId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeadingWidget('Donation History'),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: const Text(
              'Donation History',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder<List<Donations>>(
              future: fetchDonations(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          elevation: 1.0,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 10),
                                color: Colors.blue,
                                child: Row(
                                  children: [
                                    Text('Donor Name: ',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 18,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Text(
                                      snapshot.data![index].username,
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 20,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Expanded(
                                      child:
                                          Text(snapshot.data![index].ngoName)),
                                ),
                                title: Text(
                                  snapshot.data![index].name,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text('${snapshot.data![index].date}'),
                                trailing: Column(children: [
                                  Text('Quantity'),
                                  Text(snapshot.data![index].quantity),
                                ]),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Donations>> fetchDonations(http.Client client) async {
    const String url =
        'https://edonations.000webhostapp.com/api-adimin-donationhistory.php';

    var result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      final parsed = json.decode(result.body).cast<Map<String, dynamic>>();
      return parsed.map<Donations>((json) => Donations.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
