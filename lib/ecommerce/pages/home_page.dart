import 'package:flutter/material.dart';
import '/ecommerce/intro_page.dart';
import 'shop_page.dart';
import 'cart_page.dart';
import '../components/button_nav.dart';
import 'favorite_page.dart';
import 'setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  void Navigatebar(int index) {
    setState(() {
      // Update state here
      _selectedindex = index;
    });
  }

  List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu), // Drawer icon
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Image.asset("assets/image/nike.png"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IntroPage()),
                  );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: ButtonNav(
        onTapChange: (index) => Navigatebar(index),
      ),
    );
  }
}
