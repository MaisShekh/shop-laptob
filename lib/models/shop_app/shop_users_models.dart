class ShopUserModel {
  String  ? email;
  String  ? userId;
  String  ? firstName;
  String  ? lastName;
  String  ? phone;


  ShopUserModel({
    required this.email,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phone,

  });

  ShopUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json["email"];
    userId = json["userId"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    phone = json["phone"];
  }

  Map<String ,dynamic> toMap()
  {
    return
  {
      'email':email,
      'userId':userId,
      'firstName':firstName,
      'lastName':lastName,
      'phone':phone,


  };
}
}
