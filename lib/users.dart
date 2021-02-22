// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.empid,
    this.empname,
    this.pswd,
    this.degree,
  });

  String empid;
  String empname;
  String pswd;
  String degree;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        empid: json["empid"],
        empname: json["empname"],
        pswd: json["pswd"],
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "empid": empid,
        "empname": empname,
        "pswd": pswd,
        "degree": degree,
      };
}
