import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/news_model.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<NewsArticle> _articles = [];
  List<NewsArticle> _savedArticles = [];
  bool _isLoading = false;
  String _selectedCategory = 'All';

  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get savedArticles => _savedArticles;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;

  NewsProvider() {
    _loadSavedArticles();
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await _newsService.fetchTopHeadlines();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNewsByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await _newsService.fetchNewsByCategory(category);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchNews(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await _newsService.searchNews(query);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadSavedArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved_articles') ?? [];
    _savedArticles = saved
        .map(
          (json) =>
              NewsArticle.fromJson(Map<String, dynamic>.from(jsonDecode(json))),
        )
        .toList();
    notifyListeners();
  }

  Future<void> saveArticle(NewsArticle article) async {
    if (!_savedArticles.any((a) => a.url == article.url)) {
      _savedArticles.add(article);
      await _saveToPrefs();
      notifyListeners();
    }
  }

  Future<void> unsaveArticle(NewsArticle article) async {
    _savedArticles.removeWhere((a) => a.url == article.url);
    await _saveToPrefs();
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  bool isArticleSaved(NewsArticle article) {
    return _savedArticles.any((a) => a.url == article.url);
  }

  void clearSearchResults() {
    _articles = [];
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = _savedArticles.map((a) => jsonEncode(a.toJson())).toList();
    await prefs.setStringList('saved_articles', saved);
  }
}
