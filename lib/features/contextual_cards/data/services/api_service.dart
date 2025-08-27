import 'package:fam/core/constants/api_constant.dart';
import 'package:fam/features/contextual_cards/data/models/contextual_card_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ContextualCardModel>> fetchContextualCards() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print(data);
        return data.map((item) => ContextualCardModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load cards: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching cards: $e");
    }
  }
}
