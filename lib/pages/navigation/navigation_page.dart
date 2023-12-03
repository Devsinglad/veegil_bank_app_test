// ignore_for_file: library_private_types_in_public_api

import '../../src/navigation_src.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    CardPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Flutter BottomNavigationBar Example'),
      //     backgroundColor: Colors.green),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: _selectedIndex == 0 ? primaryColor : navigationIconColor,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card_outlined,
                color: _selectedIndex == 1 ? primaryColor : navigationIconColor,
              ),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: _selectedIndex == 2 ? primaryColor : navigationIconColor,
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          iconSize: 24,
          // selectedIconTheme: IconThemeData(
          //   color: primaryColor
          // ),
          // unselectedIconTheme: IconThemeData(
          //   color: navigationIconColor
          // ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          onTap: _onItemTapped,
          elevation: 5),

    );
  }
}