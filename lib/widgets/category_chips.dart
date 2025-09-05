import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  final List<String> categories = const [
    'All',
    'Business',
    'Technology',
    'Sports',
    'Health',
    'Science',
    'Entertainment',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = newsProvider.selectedCategory == category;

              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(
                    category,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF1E3A8A),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    newsProvider.setSelectedCategory(category);
                    if (category == 'All') {
                      newsProvider.fetchNews();
                    } else {
                      newsProvider.fetchNewsByCategory(category.toLowerCase());
                    }
                  },
                  backgroundColor: Colors.white,
                  selectedColor: const Color(0xFF1E3A8A),
                  checkmarkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? const Color(0xFF1E3A8A)
                          : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  elevation: isSelected ? 4 : 0,
                  shadowColor: const Color(0xFF1E3A8A).withOpacity(0.3),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
