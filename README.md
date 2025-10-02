<img width="1080" height="2400" alt="Screenshot_1759416359" src="https://github.com/user-attachments/assets/59825f0a-b93e-4887-878d-1bd855132b06" /># 🎬 Movies App

A modern Flutter application for browsing and managing movies using The Movie Database (TMDB) API. Built with Clean Architecture principles and BLoC pattern for state management.

 <img width="1080" height="2400" alt="Screenshot_1759416359" src="https://github.com/user-attachments/assets/b7d92d9d-d60a-41fc-988e-a30ca6d08f1a" />


<img width="1080" height="2400" alt="Screenshot_1759416366" src="https://github.com/user-attachments/assets/4a7d1d92-587f-4652-8f60-5e5711df9bb1" />

<img width="1080" height="2400" alt="Screenshot_1759416374" src="https://github.com/user-attachments/assets/3f96cd3a-445a-4262-b7b7-c8a07c553923" />

<img width="1080" height="2400" alt="Screenshot_1759416381" src="https://github.com/user-attachments/assets/7747ffc2-deb0-43ff-b8f8-0e27ed5fc453" />




## ✨ Features

- 🎥 **Now Playing Movies** - Browse currently playing movies in theaters
- 🔥 **Popular Movies** - Discover trending and popular films
- ⭐ **Top Rated Movies** - Explore highest-rated movies of all time
- 📖 **Movie Details** - View comprehensive information about each movie
- 💡 **Recommendations** - Get movie suggestions based on selected films
- ❤️ **Favorites** - Add and manage your favorite movies
- 🎨 **Modern UI** - Clean and intuitive interface with smooth animations
- 📱 **Responsive Design** - Optimized for various screen sizes

## 📸 Screenshots

*Add your app screenshots here*

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── core/
│   ├── error/              # Exception and failure handling
│   ├── network/            # API constants and network models
│   ├── services/           # Dependency injection (GetIt)
│   ├── usecase/            # Base use case definitions
│   └── utils/              # App constants, strings, enums
│
├── features/
│   └── movies/
│       ├── data/
│       │   ├── datasources/     # Remote data sources
│       │   ├── models/          # Data models
│       │   └── repositories/    # Repository implementations
│       │
│       ├── domain/
│       │   ├── entities/        # Business entities
│       │   ├── repositories/    # Repository interfaces
│       │   └── usecases/        # Business logic use cases
│       │
│       └── presentation/
│           ├── bloc/            # BLoC state management
│           ├── pages/           # UI screens
│           └── widgets/         # Reusable widgets
│
└── main.dart
```

### Architecture Layers

1. **Presentation Layer** - UI components and BLoC for state management
2. **Domain Layer** - Business logic, entities, and use cases
3. **Data Layer** - API integration and data models

## 🛠️ Technologies & Packages

| Package | Version | Purpose |
|---------|---------|---------|
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | ^9.1.1 | State management |
| [dio](https://pub.dev/packages/dio) | ^5.9.0 | HTTP client |
| [get_it](https://pub.dev/packages/get_it) | ^8.2.0 | Dependency injection |
| [dartz](https://pub.dev/packages/dartz) | ^0.10.1 | Functional programming (Either) |
| [equatable](https://pub.dev/packages/equatable) | ^2.0.7 | Value equality |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | ^3.4.1 | Image caching |
| [carousel_slider](https://pub.dev/packages/carousel_slider) | ^5.1.1 | Carousel widget |
| [animate_do](https://pub.dev/packages/animate_do) | ^4.2.0 | Animations |
| [shimmer](https://pub.dev/packages/shimmer) | ^3.0.0 | Loading placeholder |
| [google_fonts](https://pub.dev/packages/google_fonts) | ^6.3.1 | Custom fonts |

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK (3.9.0 or higher)
- Android Studio / VS Code with Flutter plugins
- TMDB API account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/movies_app.git
   cd movies_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Get TMDB API Credentials**
   - Sign up at [The Movie Database](https://www.themoviedb.org/)
   - Go to Settings → API → Create API Key
   - Get your API Key and Access Token (v4 auth)

4. **Configure API Keys**
   
   Open `lib/core/network/api_constance.dart` and update:
   ```dart
   static const String apiKey = "YOUR_API_KEY_HERE";
   static const String accessToken = "YOUR_ACCESS_TOKEN_HERE";
   static const String accountId = "YOUR_ACCOUNT_ID_HERE";
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Usage

### Main Features

#### Browse Movies
- **Now Playing**: Swipe through currently playing movies in a carousel
- **Popular**: Scroll horizontally through popular movies
- **Top Rated**: Explore highly-rated movies

#### Movie Details
- Tap any movie to view detailed information
- See movie overview, genres, rating, runtime, and release date
- View recommended similar movies

#### Favorites Management
- Tap the heart icon on any movie to add to favorites
- Access favorites from the heart icon in the app bar
- Remove movies from favorites with a single tap

## 🔧 Configuration

### API Endpoints

The app uses the following TMDB API v3 endpoints:

- `/movie/now_playing` - Now playing movies
- `/movie/popular` - Popular movies
- `/movie/top_rated` - Top rated movies
- `/movie/{movie_id}` - Movie details
- `/movie/{movie_id}/recommendations` - Movie recommendations
- `/account/{account_id}/favorite` - Manage favorites
- `/account/{account_id}/favorite/movies` - Get favorite movies

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Write comments for complex logic
- Maintain the Clean Architecture structure

## 📝 Project Structure Details

### BLoC Pattern

The app uses BLoC (Business Logic Component) pattern for state management:

- **MoviesBloc** - Manages now playing, popular, and top-rated movies
- **MovieDetailsBloc** - Handles movie details and recommendations
- **FavoriteMoviesBloc** - Manages favorite movies list

### Use Cases

Each feature has dedicated use cases following the Single Responsibility Principle:

- `GetNowPlayingMoviesUseCase`
- `GetPopularMoviesUseCase`
- `GetTopRatedMoviesUseCase`
- `GetMovieDetailsUseCase`
- `GetRecommendationUseCase`
- `AddToFavoriteUseCase`
- `GetFavoriteMoviesUseCase`

### Error Handling

The app implements comprehensive error handling:

- `ServerException` - For API errors
- `ServerFailure` - Mapped from exceptions
- Either monad (dartz) for functional error handling

## 🐛 Known Issues

- None at the moment

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the API
- Flutter community for amazing packages
- All contributors who help improve this project


---

⭐ If you find this project useful, please give it a star on GitHub!

## 🔄 Changelog

### Version 1.0.0 (Initial Release)
- Browse now playing, popular, and top-rated movies
- View detailed movie information
- Get movie recommendations
- Add/remove movies from favorites
- Responsive UI with smooth animations

