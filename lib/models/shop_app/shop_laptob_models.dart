class ShopLaptobModel {
  String  ? name;
  int  ? price;
  String  ? details;
  String  ? description;
  String  ? image;
  String ? laptobId;



  ShopLaptobModel({
    required this.name,
    required this.price,
    required this.details,
    required this.description,
    required this.image,
    required this.laptobId,

  });

  ShopLaptobModel.fromJson(Map<dynamic, dynamic> json)
  {
    name = json["name"];
    price = json["price"];
    details = json["details"];
    description = json["description"];
    image = json["image"];
    laptobId = json["laptobId"];
  }

  Map<String ,dynamic> toMap()
  {
    return
      {
        'name':name,
        'price':price,
        'details':details,
        'description':description,
        'image':image,
        'laptobId':laptobId,

      };
  }
}
