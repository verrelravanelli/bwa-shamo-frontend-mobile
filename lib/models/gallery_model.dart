class Galleries {
  final int id;
  final int products_id;
  final String url;

  Galleries({
    required this.id,
    required this.products_id,
    required this.url,
  });

  factory Galleries.fromJson(Map<String, dynamic> json) {
    return Galleries(
      id: json['id'],
      products_id: json['products_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "products_id": products_id,
      "url": url,
    };
  }
}
