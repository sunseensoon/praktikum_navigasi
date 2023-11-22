import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Navigasi',
      home: HalamanBeranda(),
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum Navigasi'),
      ),
      endDrawer: Drawer(
        // Use endDrawer instead of drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Image.asset(
                'lib/assets/logo.png',
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Lihat Koleksi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanJelajah()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.man_3),
              title: Text('Akun'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanAkun()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Beranda'),
      ),
    );
  }
}

class HalamanJelajah extends StatefulWidget {
  @override
  _HalamanJelajahState createState() => _HalamanJelajahState();
}

class _HalamanJelajahState extends State<HalamanJelajah> {
  int _selectedIndex = 0; // Default selected index

  // Define your destinations here
  List<Widget> _widgetOptions = <Widget>[
    buildGridView('Formal'),
    buildGridView('Kasual'),
    buildGridView('Vintage'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static Widget buildGridView(String style) {
    String imagePath = 'lib/assets/outfit.jpg';

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 6, // Adjust the number of items as needed
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Koleksi'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Formal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Kasual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Vintage',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Akun'),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Akun'),
      ),
    );
  }
}
