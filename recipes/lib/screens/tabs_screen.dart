import 'package:flutter/material.dart';
import 'package:receipes/models/meal.dart';
import 'package:receipes/screens/category_screens.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../utils/app_routes.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 
      'screen': const CategoryScreens()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens?[_selectedScreenIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _screens?[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: "categoria",
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: "favoritos"),
        ],
      ),
    );
  }
}

//para criar tabs na parte de cima, o código seria este abaixo se a classe fosse stateless
// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Vamos cozinhar'),
//           centerTitle: true,
//           bottom: const TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: "categorias",
//             ),
//             Tab(
//               icon: Icon(Icons.stars),
//               text: "Favoritos",
//             ),
//           ]),
//         ),
//         body: const TabBarView(children: [CategoryScreens(), FavoriteScreen()]),
//       ),
//     );
