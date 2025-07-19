import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'account_choice_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'genre_page.dart';
import 'bacaan_page.dart';
<<<<<<< HEAD
import 'home_controller.dart'; 
=======
import 'home_controller.dart';
>>>>>>> 6e8824f8437d1811225042e90cf43e6f838f738c

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS DPM',
      debugShowCheckedModeBanner: false,
      home: const NavigationHandler(),
    );
  }
}

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({super.key});

  @override
  State<NavigationHandler> createState() => _NavigationHandlerState();

  static _NavigationHandlerState? of(BuildContext context) {
    final state =
        context.findAncestorStateOfType<_NavigationHandlerState>();
    return state;
  }
}

class _NavigationHandlerState extends State<NavigationHandler> {
  String _currentScreen = 'login';
  String? _loginMethod;

  void goTo(String screen, {String? method}) {
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
          onLogin: () => goTo('main_home'),
          onRegister: () => goTo('register'),
        );
      case 'register':
        return RegisterPage(
          onBack: () => goTo('login'),
          onRegister: () => goTo('main_home'),
          onGoogleTap: () => goTo('account', method: 'Google'),
          onFacebookTap: () => goTo('account', method: 'Facebook'),
        );
      case 'account':
        return AccountChoicePage(
          loginMethod: _loginMethod ?? 'Google',
          onBack: () => goTo('register'),
          onAccountSelected: () => goTo('main_home'),
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
  late HomeController homeController;

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
      ProfilePage(
        onLogout: () {
          final handlerState = NavigationHandler.of(context);
          handlerState?.goTo('login');
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF003D82),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 247, 193, 0),
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
