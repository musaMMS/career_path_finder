import 'package:career_path_finder/Cv/CVFormScreen.dart';
import 'package:flutter/material.dart';
import '../Home/HomeScreen.dart';

class MyBottomNavScreen extends StatefulWidget {
  const MyBottomNavScreen({super.key});

  @override
  State<MyBottomNavScreen> createState() => _MyBottomNavScreenState();
}

class _MyBottomNavScreenState extends State<MyBottomNavScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late final List<Widget> _screens;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeScreen(),
      Placeholder(),
      CVFormScreen(),
    ];
    _pageController = PageController();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: _screens, // Optional: Prevent swipe
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Roadmap"),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "CV"),
        ],
      ),
    );
  }
}
