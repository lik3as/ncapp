import 'dart:developer';

class User {
  final String name;
  final String psw;
  final String contact;
  final String cep;
  final String role;
  final int pk;

  User({required this.name, required this.psw, required this.contact,
    required this.cep, required this.role, required this.pk});

  factory User.fromJson(Map json){
    log(json.toString());
    return User(
      pk: json['pkUser'],
      name: json['nameUser'],
      psw: json['pswUser'],
      role: json['roleUser'],
      cep: json['cepUser'],
      contact: json['contactUser']
    );
  }

  Map toJson({required String name, required String psw, required String contact,
    required String cep, required String role}) {
    return {
      'name': name,
      'psw': psw,
      'contact': contact,
      'cep': cep,
      'role': role
    };
  }
}