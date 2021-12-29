// ignore_for_file: file_names
// To parse this JSON data, do
//
//     final donations = donationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Donations> donationsFromJson(String str) =>
    List<Donations>.from(json.decode(str).map((x) => Donations.fromJson(x)));

String donationsToJson(List<Donations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donations {
  Donations({
    required this.username,
    required this.ngoName,
    required this.name,
    required this.quantity,
    required this.date,
    required this.donationId,
  });

  String username;
  String ngoName;
  String name;
  String quantity;
  String date;
  String donationId;

  factory Donations.fromJson(Map<String, dynamic> json) => Donations(
        username: json["username"],
        ngoName: json["ngo_name"],
        name: json["name"],
        quantity: json["quantity"],
        date: json["date"],
        donationId: json["donation_id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "ngo_name": ngoName,
        "name": name,
        "quantity": quantity,
        "date": date,
        "donation_id": donationId,
      };
}
