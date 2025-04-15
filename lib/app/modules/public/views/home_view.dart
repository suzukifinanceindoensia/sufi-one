import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarColor {
  static const Color background = Color.fromRGBO(245, 245, 245, 1);
  static const Color icon = Color.fromRGBO(0, 38, 113, 1); // alpha 1.0 = 100%
}

class PublicHomePage extends StatefulWidget {
  const PublicHomePage({super.key});

  @override
  State<PublicHomePage> createState() => _PublicHomePageState();
}

class _PublicHomePageState extends State<PublicHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text('Produk')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Akun')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to SuperApp')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 90, 167, 255),
        selectedItemColor: const Color.fromARGB(255, 0, 16, 49),
        unselectedItemColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ).withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Public Home - No Login Required'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/public/catalog');
            },
            child: const Text('Browse Catalog'),
          ),
        ],
      ),
    );
  }
}
