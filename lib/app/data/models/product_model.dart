
import 'dart:ffi';

class ProductModel {
    int? id;
    String? title;
    String? description;
    double? price;
    String? thumbnail;
    bool isFavorite;
    int? stock;
    double? rating;

    ProductModel({
        this.id,
        this.title,
        this.description,
        this.price,
        this.thumbnail,
        this.rating,
        this.isFavorite = false,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "rating": rating,
        "thumbnail": thumbnail,
    };
}