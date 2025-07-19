import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'account_choice_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'genre_page.dart';
import 'bacaan_page.dart';
import 'home_controller.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UAS DPM',
      debugShowCheckedModeBanner: false,
      home: NavigationHandler(),
    );
  }
}

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({super.key});

  @override
  State<NavigationHandler> createState() => _NavigationHandlerState();
}

class _NavigationHandlerState extends State<NavigationHandler> {
  String _currentScreen = 'login';
  String? _loginMethod;

  void _goTo(String screen, {String? method}) {
    setState(() {
      _currentScreen = screen;
      _loginMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 'login':
        return LoginPage(
          onLogin: () => _goTo('main_home'),
          onRegister: () => _goTo('register'),
        );
      case 'register':
        return RegisterPage(
          onBack: () => _goTo('login'),
          onRegister: () => _goTo('main_home'),
          onGoogleTap: () => _goTo('account', method: 'Google'),
          onFacebookTap: () => _goTo('account', method: 'Facebook'),
        );
      case 'account':
        return AccountChoicePage(
          loginMethod: _loginMethod ?? 'Google',
          onBack: () => _goTo('register'),
          onAccountSelected: () => _goTo('main_home'),
        );
      case 'main_home':
        return MainScreen(initialIndex: 1);
      case 'main':
        return const MainScreen();
      default:
        return const Center(child: Text('Unknown screen'));
    }
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 1});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  late HomeController homeController; // ✅ controller untuk HomePage

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    homeController = HomeController();
    homeController.searchController.addListener(() {
      setState(() {
        homeController.filterSearchResults();
      });
    });
  }

  @override
  void dispose() {
    homeController.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const BacaanPage(),
      HomePage(
        searchController: homeController.searchController,
        selectedGenre: homeController.selectedGenre,
        filteredList: homeController.filteredList,
        bukuPopuler: homeController.bukuPopuler,
        bukuPilihan: homeController.bukuPilihan,
        onGenreSelected: (genre) {
          setState(() {
            homeController.onGenreSelected(genre);
          });
        },
      ),
      GenrePage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF003D82),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255,247,193,0),
        unselectedItemColor: const Color.fromARGB(255, 189, 189, 189),
        showUnselectedLabels: true,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Bacaan'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}