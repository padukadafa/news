import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import '../widgets/news_card_skeleton.dart';
import '../widgets/category_chips.dart';
import '../widgets/headlines_carousel.dart';
import '../widgets/breaking_news_banner.dart';
import 'saved_news_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📰 NewsHub'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? RefreshIndicator(
              onRefresh: () =>
                  Provider.of<NewsProvider>(context, listen: false).fetchNews(),
              child: CustomScrollView(
                slivers: [
                  // Breaking News Banner
                  const SliverToBoxAdapter(child: BreakingNewsBanner()),
                  // Headlines Carousel
                  const SliverToBoxAdapter(child: HeadlinesCarousel()),
                  // Category Chips
                  const SliverToBoxAdapter(child: CategoryChips()),
                  // News List
                  Consumer<NewsProvider>(
                    builder: (context, newsProvider, child) {
                      if (newsProvider.isLoading) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => const NewsCardSkeleton(),
                            childCount: 5,
                          ),
                        );
                      }

                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final article = newsProvider.articles[index];
                          return NewsCard(article: article);
                        }, childCount: newsProvider.articles.length),
                      );
                    },
                  ),
                ],
              ),
            )
          : const SavedNewsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
