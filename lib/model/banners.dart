class BannersList {
  final int id;
  final String imageUrl;

  BannersList(this.id, this.imageUrl);

  factory BannersList.fromJson(Map<String, dynamic> jsonOnject) {
    return BannersList(
      jsonOnject['id'],
      jsonOnject['image'],
    );
  }
}
