import 'package:fam/features/contextual_cards/data/models/contextual_card_model.dart';
import 'package:fam/features/contextual_cards/data/services/api_service.dart';
import 'package:flutter/material.dart';

class ContextualCardsViewModel extends ChangeNotifier {
  final ApiService apiService;

  ContextualCardsViewModel(this.apiService);

  List<ContextualCardModel> _cards = [];
  bool _loading = false;
  String? _error;

  List<ContextualCardModel> get cards => _cards;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> loadCards() async {
    _loading = true;
    notifyListeners();

    try {
      _cards = await apiService.fetchContextualCards();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
