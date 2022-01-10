import 'package:flutter/material.dart';
import 'package:livraria_mobile/components/menu_buttons.dart';
import 'package:livraria_mobile/components/menu_title.dart';

import 'editora_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  PageController pageController = PageController();

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MenuTitle(),
        actions: const [MenuButton()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.business_outlined,
                ),
                label: 'Editoras'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Livros'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Usuarios'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Alugueis'),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: changePage),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: const [
          EditoraScreen(),
          EditoraScreen(),
          EditoraScreen(),
          EditoraScreen(),
          EditoraScreen(),
        ],
      ),
    );
  }
}
