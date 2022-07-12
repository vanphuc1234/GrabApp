import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/chi_tiet_cua_hang_vm.dart';
import '../models/cua_hang_listing_vm.dart';

class CuaHangRepository {
  final baseUrl = 'api.yelp.com';
  final client = http.Client();

  Future<CuaHangListingResponse> getCuaHangGanToiListing() async {
    final queryParameters = {
      'term': 'coffee',
      'latitude': '37.786882',
      'longitude': '-122.399972'
    };

    final uri = Uri.https(baseUrl, '/v3/businesses/search', queryParameters);

    final headers = {
      'Authorization':
          'Bearer YEx3jrT6Bx5ybkLEbqawmR8y4HQs6dJ4pipIV4P-uQHWQ6LJQ8YI3enZt2NDDgeOxEGhYk95BjzWOeTlugvNAzF8muwvu-6ECUJXkHEPLmiosaKotFHxcekkt-DCYnYx'
    };

    final response = await client.get(uri, headers: headers);
    final json = jsonDecode(response.body);

    return CuaHangListingResponse.fromJson(json);
  }

  Future<ChiTietCuaHangVm> getChiTietCuaHang(String cuaHangId) async {
    final uri = Uri.https(baseUrl, '/v3/businesses/$cuaHangId');
    final headers = {
      'Authorization':
          'Bearer YEx3jrT6Bx5ybkLEbqawmR8y4HQs6dJ4pipIV4P-uQHWQ6LJQ8YI3enZt2NDDgeOxEGhYk95BjzWOeTlugvNAzF8muwvu-6ECUJXkHEPLmiosaKotFHxcekkt-DCYnYx'
    };
    try {
      final response = await client.get(uri, headers: headers);
      final json = jsonDecode(response.body);
      return ChiTietCuaHangVm.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
