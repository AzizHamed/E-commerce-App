import 'Address.dart';
import 'Name.dart';

class User {
  final int? id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;
  final int v;

  User({
     this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: Name.fromJson(json['name']),
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      v: json['__v'],
    );
  }


}

