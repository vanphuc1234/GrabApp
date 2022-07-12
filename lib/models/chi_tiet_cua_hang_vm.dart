class ChiTietCuaHangVm {
  String id;
  String name;
  double rating;
  String image_url;
  List<String> photos;
  bool is_liked = false;

  ChiTietCuaHangVm({
    required this.id,
    required this.image_url,
    required this.name,
    required this.rating,
    required this.photos
    });

  factory ChiTietCuaHangVm.fromJson(Map<String, dynamic> json) {
    return ChiTietCuaHangVm(
        id: json['id'],
        name: json['name'],
        image_url: json['image_url'],
        rating: json['rating'],
        photos: json['photos']);
  }
}
