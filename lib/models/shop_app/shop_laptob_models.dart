class ShopLaptobModel {
  String ? name;
  double ? price;
  String ? ram;
  String ? description;
  String ? image;
  String ? laptobId;
  String ? hardtype;
  String ? hardsize;
  String ? brand;


  ShopLaptobModel({
    required this.name,
    required this.price,
    required this.ram,
    required this.description,
    required this.image,
    required this.laptobId,
    required this.hardtype,
    required this.hardsize,
    required this.brand,

  });

  ShopLaptobModel.fromJson(Map<dynamic, dynamic> json)
  {
    name = json["name"];
    price = json["price"];
    ram = json["Ram"];
    description = json["description"];
    image = json["image"];
    laptobId = json["laptobId"];
    brand = json["brand"];
    hardtype = json["hardtype"];
    hardsize = json["hardsize"];
  }

  Map<String, dynamic> toMap() {
    return
      {
        'name': name,
        'price': price,
        'Ram': ram,
        'description': description,
        'image': image,
        'laptobId': laptobId,
        "hardsize": hardsize,
        'brand': brand,
        'hardtype': hardtype,


      };
  }

}