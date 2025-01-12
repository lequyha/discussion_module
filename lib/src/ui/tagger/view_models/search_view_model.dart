import 'dart:async';
import 'package:core_module/core_module.dart';
import 'package:core_module/di/injection.dart';
import 'package:flutter/material.dart';

/// Search view model
final searchViewModel =
    SearchViewModel(controlRepository: getIt<ControlRepository>());

enum SearchResultView { users, none }

class SearchViewModel {
  final ControlRepository _controlRepository;

  late final ValueNotifier<List<UserModel>> _users = ValueNotifier([]);
  ValueNotifier<List<UserModel>> get users => _users;

  late final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  late final ValueNotifier<SearchResultView> _activeView =
      ValueNotifier(SearchResultView.none);

  Timer? _debounceTimer; // Timer for debounce

  SearchViewModel({
    required ControlRepository controlRepository,
  }) : _controlRepository = controlRepository;

  ValueNotifier<SearchResultView> get activeView => _activeView;

  void _setLoading(bool val) {
    if (val != _loading.value) {
      _loading.value = val;
    }
  }

  void searchUser(String query) {
    _activeView.value = SearchResultView.users;
    if (query.isEmpty) return;

    // Cancel any existing debounce timer
    _debounceTimer?.cancel();

    // Start a new debounce timer
    _debounceTimer = Timer(const Duration(milliseconds: 1000), () async {
      query = query.toLowerCase().trim();

      _users.value = [];
      _setLoading(true);

      final result =
          await _controlRepository.getUsers(type: 'user', keyword: query);

      _users.value = [...result];
      _setLoading(false);
    });
  }

  void dispose() {
    _debounceTimer?.cancel(); // Cancel timer when disposing the view model
    _users.dispose();
    _loading.dispose();
    _activeView.dispose();
  }
}
