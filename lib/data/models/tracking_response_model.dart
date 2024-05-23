import 'dart:convert';

class TrackingResponseModel {
    final List<Data> data;

    TrackingResponseModel({
        required this.data,
    });

    factory TrackingResponseModel.fromJson(String str) => TrackingResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TrackingResponseModel.fromMap(Map<String, dynamic> json) => TrackingResponseModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Data {
    final int id;
    final String username;
    final String date;
    final String time;
    final String lokasi;

    Data({
        required this.id,
        required this.username,
        required this.date,
        required this.time,
        required this.lokasi,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        date: json["date"],
        time: json["time"],
        lokasi: json["lokasi"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "date": time,
        "time": time,
        "lokasi": lokasi,
    };
}
