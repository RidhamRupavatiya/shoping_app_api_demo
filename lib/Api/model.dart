// To parse this JSON data, do
//
//     final shopingApi = shopingApiFromJson(jsonString);

import 'dart:convert';

List<ShopingApi> shopingApiFromJson(String str) => List<ShopingApi>.from(json.decode(str).map((x) => ShopingApi.fromJson(x)));

String shopingApiToJson(List<ShopingApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopingApi {
  ShopingApi({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });

  String name;
  String price;
  String image;
  String id;

  factory ShopingApi.fromJson(Map<String, dynamic> json) => ShopingApi(
    name: json["name"],
    price: json["price"],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
    "id": id,
  };
}
