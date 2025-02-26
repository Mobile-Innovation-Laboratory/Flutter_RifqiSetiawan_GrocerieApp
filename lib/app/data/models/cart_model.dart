class CartModel {
  int? GrocerieId;
  String? image;
  double? price;
  int? quantity;
  String? title;

  CartModel({
    this.GrocerieId,
    this.image,
    this.price,
    this.quantity = 0,
    this.title,
  });
}