import 'dart:convert';

class LoginResponseModel {
    final String message;
    final String username;
    final String email;
    final String token;

    LoginResponseModel({
        required this.message,
        required this.username,
        required this.email,
        required this.token,
    });

    factory LoginResponseModel.fromJson(String str) => LoginResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
        message: json["message"],
        username: json["username"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "username": username,
        "email": email,
        "token": token,
    };
}
