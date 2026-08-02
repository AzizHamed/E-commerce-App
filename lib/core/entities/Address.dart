import 'GeoLocation.dart';

class Address{
    final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

 factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      geolocation: Geolocation.fromJson(json['geolocation']),
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
    );
  }

}