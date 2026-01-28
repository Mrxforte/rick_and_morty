<H1>Rick and Morty  - Flutter App</H1>
<H3>Overview</H3>
A feature-rich, cross-platform mobile application built with Flutter that explores the multiverse of Rick and Morty. The app provides fans with an immersive experience to browse characters, episodes, locations, and more from the popular animated series.

<h3>✨ Key Features</h3>
<ul>
<li>Character Exploration
Complete Character Catalog: Browse all 800+ characters from the series

Advanced Filtering: Filter by status (Alive/Dead/Unknown), species, gender, and dimension

Detailed Profiles: View character details including origin, location, and episode appearances

Favorites System: Bookmark your favorite characters for quick access
</li>
<li>Episode Guide
Season-by-Season Organization: All episodes from all seasons

Episode Details: Synopsis, air date, and featured characters

Watch Status Tracker: Mark episodes as watched

Episode Cast: See which characters appear in each episode
</li>
<li>Location Browser
Multiverse Map: Explore different dimensions and planets

Location Details: Type, dimension, and resident characters

Search by Dimension: Find locations across the multiverse</li>
</ul>
<H1>State Management</H1>
<ul>
  <li>Provider: Used for dependency injection and state management</li>
<li>ChangeNotifier: For reactive UI updates</li>
<li>Service Locator: Using get_it for service registration</li>
</ul>
<h1>>🛠 Technical Implementation</h1
Tech Stack & Versions
Flutter: 3.22.0+ (Latest stable)

Dart: 3.4.0+ (With records, patterns, and sealed classes)

Minimum SDK:

Android: API 24 (Android 7.0)

iOS: 13.0


# 1. Create new project
flutter create rick_and_morty_app
cd rick_and_morty_app


# 2. Get packages
flutter pub get

# 3. Run on connected device
flutter run

# Run on Android
flutter run -d android

# Run on iOS (Mac only)
flutter run -d ios

# Run on Web
flutter run -d chrome

# Run on Desktop
flutter run -d windows   # Windows<br/>
flutter run -d macos     # Mac<br/>
flutter run -d linux     # Linux<br/>


# Debug build
flutter build apk --debug          # Android APK<br/>
flutter build ios --debug          # iOS<br/>
flutter build web                  # Web<br/>

# Release build
flutter build apk --release        # Android APK<br/>
flutter build appbundle --release  # Android App Bundle<br/>
flutter build ios --release        # iOS (requires signing)<br/>
flutter build web --release        # Web (optimized)<br/>

