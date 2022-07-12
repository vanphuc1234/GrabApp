class CuaHangListingVm {
  String id;
  String name;
  double rating;
  String image_url;
  bool is_liked = false;
  int review_count;

  CuaHangListingVm({
    required this.id,
    required this.image_url,
    required this.name,
    required this.rating,
    required this.review_count,
  });

  factory CuaHangListingVm.fromJson(Map<String, dynamic> json) {
    return CuaHangListingVm(
      id: json['id'],
      name: json['name'],
      image_url: json['image_url'],
      rating: json['rating'],
      review_count: json['review_count'],
    );
  }
}
