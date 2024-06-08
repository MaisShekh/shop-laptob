class ShopCartModel {
  int  ? itemscount;
  int? totalprice;

  List<dynamic> ? products ;


  ShopCartModel({
    required this.itemscount,
    required this.totalprice,
    required this.products,

  });

  ShopCartModel.fromJson(Map<dynamic, dynamic> json)
  {
    itemscount = json["itemscount"];
    totalprice = json["totalprice"];
    products = json["products"];
  }

  Map<String ,dynamic> toMap()
  {
    return
      {
        'itemscount':itemscount,
        'totalprice':totalprice,

        'products':products,


      };
  }
}
