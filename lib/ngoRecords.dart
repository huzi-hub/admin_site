// ignore_for_file: file_names, unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'headingWidget.dart';
import 'package:http/http.dart' as http;

import 'models/ngoModels.dart';

class NGORecords extends StatefulWidget {
  @override
  _NGORecordsState createState() => _NGORecordsState();
}

class _NGORecordsState extends State<NGORecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeadingWidget('NGO Records'),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FutureBuilder<List<Ngos>>(
                future: fetchNgos(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          getcount(int.parse(snapshot.data![index].ngoId));
                          return Card(
                            color: Colors.blue,
                            child: ListTile(
                              leading: Text((index + 1).toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              title: Text(snapshot.data![index].ngoName,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              subtitle: Text(snapshot.data![index].address,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              trailing: Column(
                                children: [
                                  Text('Total Donations',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text(count.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ],
                              ),
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
      ),
    );
  }

  Future<List<Ngos>> fetchNgos(http.Client client) async {
    const String url = 'https://edonations.000webhostapp.com/api-allngos.php';

    var result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      final parsed = json.decode(result.body).cast<Map<String, dynamic>>();
      return parsed.map<Ngos>((json) => Ngos.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  getcount(ngoId) {
    donationCount(ngoId).then((value) {
      setState(() {
        count = value;
      });
    });
  }

  int count = 0;
  Future<int> donationCount(int ngoId) async {
    const String url =
        'https://edonations.000webhostapp.com/api-count-donations.php';
    var data = {'ngo_id': ngoId};

    var result = await http.post(Uri.parse(url), body: data);

    if (result.statusCode == 200) {
      final parsed = json.decode(result.body);
      setState(() {
        count = parsed[0]['count'];
      });
      return parsed[0]['count'];
    } else {
      throw Exception('Failed to load album');
    }
  }
}
