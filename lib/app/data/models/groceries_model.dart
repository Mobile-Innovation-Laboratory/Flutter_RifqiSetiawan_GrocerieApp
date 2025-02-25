class GroceriesModel {
    int? id;
    String? title;
    String? description;
    double? price;
    String? thumbnail;
    bool isFavorite;
    double? stock;
    double? rating;

    GroceriesModel({
        this.id,
        this.title,
        this.description,
        this.price,
        this.thumbnail,
        this.rating,
        this.stock,
        this.isFavorite = false,
    });

    factory GroceriesModel.fromJson(Map<String, dynamic> json) => GroceriesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        stock: json["stock"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "stock": stock,
        "rating": rating,
        "thumbnail": thumbnail,
    };
}