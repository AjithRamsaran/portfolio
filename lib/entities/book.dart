class Book {
  final String name;
  final String image;
  final String url;
  final String author;
  final String authorUrl;
  final String asin;
  final String isbn10;
  final bool read;
  final double rating;

  Book({
    required this.name,
    required this.image,
    required this.url,
    required this.author,
    required this.authorUrl,
    required this.asin,
    required this.isbn10,
    required this.read,
    required this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name']  ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      author: json['author'] ?? '',
      authorUrl: json['author_url'] ?? '',
      asin: json['asin'] ?? '',
      isbn10: json['isbn10'] ?? '',
      read: json['read'] ?? false,
      rating: json['rating'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'url': url,
      'author': author,
      'author_url': authorUrl,
      'asin': asin,
      'isbn10': isbn10,
      'read': read,
      'rating': rating,
    };
  }
}
