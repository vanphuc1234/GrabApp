import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cua_hang_listing_vm.dart';

class CuaHangRepository {
  final baseUrl = 'api.yelp.com';
  final client = http.Client();

  Future<CuaHangListingResponse> getCuaHangGanToiListing() async {
    final queryParameters = {
      'latitude': '37.786882',
      'longitude': '-122.399972'
    };

    final uri = Uri.https(baseUrl, '/v3/businesses/search', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return CuaHangListingResponse.fromJson(json);
  }

  // List<CuaHangListingVm> cuaHangListFromJson(Map<String, dynamic> json) {
  //   final List<CuaHangListingVm> cuaHangList = (json['businesses'] as List)
  //       .map((listingJson) => CuaHangListingVm.fromJson(listingJson))
  //       .toList();
  //   return cuaHangList;
  // }
}
