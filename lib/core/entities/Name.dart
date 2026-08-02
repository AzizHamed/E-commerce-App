class Name{
    final String firstname;
  final String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });


  factory Name.fromJson(Map<String,dynamic> json){
    return Name(firstname: json["firstname"], lastname: json["lastname"]);
  }

}