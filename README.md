# 📰 NewsHub - Flutter News App

A modern, beautiful Flutter news application that delivers breaking news and headlines from around the world using the NewsAPI.

## 📱 Features

### ✨ Core Features

- **Breaking News Banner** - Highlight the latest breaking news
- **Headlines Carousel** - Swipe through top headlines with beautiful images
- **Category Filtering** - Filter news by categories (Business, Technology, Sports, etc.)
- **Search Functionality** - Search for specific news articles
- **Save Articles** - Save favorite articles for later reading
- **Pull-to-Refresh** - Refresh news with smooth pull gesture
- **Responsive Design** - Works perfectly on all screen sizes

### 🎨 UI/UX Features

- **Modern Material Design** - Clean and intuitive interface
- **Smooth Animations** - Fluid transitions and interactions
- **Loading States** - Skeleton loading for better UX
- **Error Handling** - Graceful error states and messages
- **Image Optimization** - Efficient image loading with fallbacks

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/padukadafa/news.git
   cd news
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**

   - Create a `.env` file in the root directory
   - Add your NewsAPI key:
     ```
     NEWS_API=your_news_api_key_here
     ```
   - Get your API key from [NewsAPI.org](https://newsapi.org/)

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Screenshots

### Home Screen

<img src="https://github.com/padukadafa/news/blob/master/screenshots/screenshot1.png?raw=true" alt="Halaman Utama" width="400">
_Main screen with breaking news banner, headlines carousel, and news feed_

### Search Screen

<img src="https://github.com/padukadafa/news/blob/master/screenshots/screenshot2.png?raw=true" alt="Halaman Utama" width="400">_Dedicated search screen with real-time results_

### News Detail

<img src="https://github.com/padukadafa/news/blob/master/screenshots/screenshot4.png?raw=true" alt="Halaman Utama" width="400">_Full article view with save functionality_

### Saved Articles

<img src="https://github.com/padukadafa/news/blob/master/screenshots/screenshot3.png?raw=true" alt="Halaman Utama" width="400">_Collection of saved articles for offline reading_

## 🏗️ Architecture

### State Management

- **Provider Pattern** - For state management across the app
- **ChangeNotifier** - Reactive updates for UI components

### Project Structure

```
lib/
├── models/
│   └── news_model.dart          # News article data model
├── providers/
│   └── news_provider.dart       # News state management
├── screens/
│   ├── home_screen.dart         # Main screen with news feed
│   ├── search_screen.dart       # Search functionality
│   ├── news_detail_screen.dart  # Article detail view
│   └── saved_news_screen.dart   # Saved articles
├── services/
│   └── news_service.dart        # API communication
└── widgets/
    ├── breaking_news_banner.dart # Breaking news component
    ├── headlines_carousel.dart   # Headlines carousel
    ├── category_chips.dart       # Category filters
    ├── news_card.dart            # News article card
    └── news_card_skeleton.dart   # Loading skeleton
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1 # HTTP requests
  provider: ^6.1.2 # State management
  flutter_dotenv: ^5.1.0 # Environment variables
  shared_preferences: ^2.2.3 # Local storage
  shimmer: ^3.0.0 # Loading animations
  carousel_slider: ^5.0.0 # Image carousel
```

## 🔧 API Integration

This app uses [NewsAPI](https://newsapi.org/) for fetching news data:

- **Top Headlines**: `/v2/top-headlines`
- **Everything Search**: `/v2/everything`
- **Category Filtering**: By country and category
- **Search**: Full-text search across all articles

## 🎨 Design System

### Colors

- **Primary**: `#1E3A8A` (Blue)
- **Secondary**: `#3B82F6` (Light Blue)
- **Background**: `#F8FAFC` (Light Gray)
- **Text**: `#1E293B` (Dark Gray)

### Typography

- **Headline**: 24px, Bold
- **Title**: 18px, Semi-bold
- **Body**: 16px, Regular
- **Caption**: 14px, Regular

## 🚀 Build & Deploy

### Android APK

```bash
flutter build apk --release
```

### iOS Build

```bash
flutter build ios --release
```

### Web Build

```bash
flutter build web --release
```

## 🧪 Testing

Run tests:

```bash
flutter test
```

## 📋 TODO / Future Enhancements

- [ ] Dark mode support
- [ ] Offline reading
- [ ] Push notifications
- [ ] Social sharing
- [ ] Article bookmarking with categories
- [ ] News source filtering
- [ ] Text-to-speech
- [ ] Multi-language support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [NewsAPI](https://newsapi.org/) for providing news data
- [Flutter](https://flutter.dev/) for the amazing framework
- [Material Design](https://material.io/) for design inspiration

## 📞 Contact

**Padu Kadafa**

- GitHub: [@padukadafa](https://github.com/padukadafa)
- Email: padukadafa@example.com

---

⭐ **Star this repo** if you found it helpful!
