import 'dart:convert';

import 'package:http/http.dart' as http;

import '../cua_hang_gan_toi/cubit/cua_hang_gan_toi_bloc.dart';
import '../models/chi_tiet_cua_hang_vm.dart';
import '../models/cua_hang_listing_vm.dart';

class CuaHangRepository {
  final baseUrl = 'api.yelp.com';
  final client = http.Client();

  Future<CuaHangListingResponse> getCuaHangGanToiListing(
      CuaHangGanToiState state) async {
    
    String? sortByStr;

    final queryParameters = {
      // 'term': 'coffee',
      'latitude': '37.786882',
      'longitude': '-122.399972',
      'limit': '15',
      'offset': (state.currentPage * 15).toString() ,
    };
  
    print('state ${state.toString()}');

    if (state.sortBy == 1) {
      sortByStr = 'best_match';
    } else if (state.sortBy == 2) {
      sortByStr = 'review_count';
    } else if (state.sortBy == 3) {
      sortByStr = 'rating';
    }
    
    if (sortByStr != null) {
      queryParameters['sort_by'] = sortByStr;
    }

    final uri = Uri.https(baseUrl, '/v3/businesses/search', queryParameters);

    print('Requesting to ${uri}');

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
