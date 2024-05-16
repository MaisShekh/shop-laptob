class ShopCartModel {
  int  ? numberOfItem;
  int  ? totalPrice;
  String  ? cartId;
  List<String> ? laptobId ;


  ShopCartModel({
    required this.numberOfItem,
    required this.totalPrice,
    required this.cartId,
    required this.laptobId,

  });

  ShopCartModel.fromJson(Map<dynamic, dynamic> json)
  {
    numberOfItem = json["numberOfItem"];
    totalPrice = json["totalPrice"];
    cartId = json["cartId"];
    laptobId = json["laptobId"];
  }

  Map<String ,dynamic> toMap()
  {
    return
      {
        'numberOfItem':numberOfItem,
        'totalPrice':totalPrice,
        'cartId':cartId,
        'laptobId':laptobId,


      };
  }
}
