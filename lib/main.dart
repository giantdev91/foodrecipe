import 'package:flutter/material.dart';
import 'package:food/common/colors.dart';
import 'package:food/common/textStyle.dart';
import 'package:food/screens/favorites.dart';
import 'package:food/screens/foodDetail.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Favorites": (context) => const FavoritesPage(),
        "FoodDetail": (context) => const FoodDetailPage(),
      },
      home: const FoodAppRoot(),
    );
  }
}

class FoodAppRoot extends StatefulWidget {
  const FoodAppRoot({super.key});

  @override
  State<FoodAppRoot> createState() => _FoodAppRootState();
}

class _FoodAppRootState extends State<FoodAppRoot> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FavoritesPage(),
    Text(
      'Shopping List',
      style: FoodAppTextStyles.optionStyle,
    ),
    Text(
      'Leftovers',
      style: FoodAppTextStyles.optionStyle,
    ),
    Text(
      'Settings',
      style: FoodAppTextStyles.optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: FoodAppThemeColors.White,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: FoodAppThemeColors.Blue,
              size: 30,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: FoodAppThemeColors.UniGray,
            ),
            label: 'Favorites',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              'assets/images/menu_active.png',
              fit: BoxFit.fitHeight,
            ),
            icon: Image.asset(
              'assets/images/menu.png',
              fit: BoxFit.fitHeight,
            ),
            label: 'Shopping List',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              'assets/images/leftovers_active.png',
              fit: BoxFit.fitHeight,
            ),
            icon: Image.asset(
              'assets/images/leftovers.png',
              fit: BoxFit.fitHeight,
            ),
            label: 'Leftovers',
          ),
          NavigationDestination(
            selectedIcon: Image.asset(
              'assets/images/settings_active.png',
              fit: BoxFit.fitHeight,
            ),
            icon: Image.asset(
              'assets/images/settings.png',
              fit: BoxFit.fitHeight,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
