class ProductSort {
  static const int latest = 0;
  static const int popular = 1;
  static const int priceHight = 2;
  static const int priceLow = 3;
}

class ProductsList {
  final String title;
  final String imageUrl;
  final int id;
  final int price;
  final int discount;
  final int privoucePrice;

  ProductsList(this.title, this.imageUrl, this.id, this.price, this.discount,
      this.privoucePrice);

  factory ProductsList.fromJson(Map<String, dynamic> jsonObject) {
    return ProductsList(
        jsonObject['title'],
        jsonObject['image'],
        jsonObject['id'],
        jsonObject['price'],
        jsonObject['discount'],
        jsonObject['previous_price'] ?? jsonObject['price']);
  }
}
