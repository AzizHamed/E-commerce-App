class Geolocation {
   final String lat;
  final String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String,dynamic> json){
    return Geolocation(lat: json["lat"], long: json["long"]);
  }
}