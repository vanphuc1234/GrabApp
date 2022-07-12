//{
// "businesses": [
//     {
//         "id": "Xg-FyjVKAN70LO4u4Z1ozg",
//         "alias": "hog-island-oyster-san-francisco-2",
//         "name": "Hog Island Oyster",
//         "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/4avfA7HWOW_Bl0J_8J60rg/o.jpg",
//         "is_closed": false,
//         "url": "https://www.yelp.com/biz/hog-island-oyster-san-francisco-2?adjust_creative=IO7Pk2bg_E-lyl_eDgbMBA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=IO7Pk2bg_E-lyl_eDgbMBA",
//         "review_count": 6499,

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

class CuaHangListingResponse {
  final List<CuaHangListingVm> cuaHangListingVm;

  CuaHangListingResponse({required this.cuaHangListingVm});

  factory CuaHangListingResponse.fromJson(Map<String, dynamic> json) {
    final cuaHangListingVm = (json['businesses'] as List)
        .map((listingJson) => CuaHangListingVm.fromJson(listingJson))
        .toList();
    return CuaHangListingResponse(cuaHangListingVm: cuaHangListingVm);
  }
}
