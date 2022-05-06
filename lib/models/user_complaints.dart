import 'dart:convert';

List<User_complaints> modelUser_complaintsFromJson(String str) =>
    List<User_complaints>.from(
        json.decode(str).map((x) => User_complaints.fromJson(x)));
String modelUser_complaintsToJson(List<User_complaints> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User_complaints {
  String domain;
  String room_no;
  String complaint_id;
  String date;

  User_complaints(
      {required this.domain,
      required this.room_no,
      required this.complaint_id,
      required this.date});
  factory User_complaints.fromJson(Map<dynamic, dynamic> json) =>
      User_complaints(
        domain: json["domain"],
        room_no: json["room_no"],
        complaint_id: json["comlaintID"],
        date: json["time"],
      );
  Map<String, dynamic> toJson() => {
        "domain": domain,
        "room_no": room_no,
        "complaint_id": complaint_id,
        "date": date,
      };
}
