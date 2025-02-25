import 'dart:convert';
import 'package:tubes_motion/app/data/models/groceries_model.dart';

DataGroceriesModel productFromJson(String str) => DataGroceriesModel.fromJson(json.decode(str));

String productToJson(DataGroceriesModel data) => json.encode(data.toJson());

class DataGroceriesModel {
  List<GroceriesModel>? products;
  int? total;
  int? skip;
  int? limit;

  DataGroceriesModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory DataGroceriesModel.fromJson(Map<String, dynamic> json) =>
      DataGroceriesModel(
        products: json["products"] == null ? [] : List<GroceriesModel>.from(json["products"]!.map((x) => GroceriesModel.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
