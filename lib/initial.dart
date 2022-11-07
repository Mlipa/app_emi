import 'package:app_emi/providers/signInProvider.dart';
import 'package:app_emi/screens/auth/login.dart';
import 'package:app_emi/utils/nextScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'screens/home/Home.dart';
import 'screens/home/ScannerQr.dart';
import 'screens/home/WelcomePlay.dart';
import 'package:provider/provider.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  // int _currentIndex = 1;
  int _selectedIndex = 1;
  List<Widget> screens = const [ScannerQr(), Home(), WelcomePlay()];
  static const List<Widget> _widgetOptions = <Widget>[
    ScannerQr(),
    Home(),
    WelcomePlay()
  ];

  Future getData() async {
    final user = context.read<SignInProvaider>();
    user.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<SignInProvaider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Hola ${user.name!}!"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage("${user.photoUrl!}"),
              radius: 50,
            ),
            Text(user.name!),
            Text(user.email!),
            ListTile(
              onTap: () {
                user.userSignOut();
                nextScreenReplace(context, const Login());
              },
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.qr_code,
                  text: 'lector qr',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.play_arrow_sharp,
                  text: 'juegos',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),

      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //     indicatorColor: Colors.blueAccent.withOpacity(0.5),
      //     backgroundColor: Colors.transparent,
      //   ),
      //   child: Container(
      //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(20),
      //       color: Colors.grey.withOpacity(0.6),
      //     ),
      //     child: NavigationBar(
      //       animationDuration: const Duration(seconds: 1),
      //       labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //       selectedIndex: _currentIndex,
      //       backgroundColor: Colors.transparent,
      //       height: 70,
      //       onDestinationSelected: (int newIndex) {
      //         setState(() {
      //           _currentIndex = newIndex;
      //         });
      //       },
      //       destinations: const [
      //         NavigationDestination(
      //           selectedIcon: Icon(Icons.qr_code_2_outlined),
      //           icon: Icon(Icons.qr_code_2),
      //           label: 'qr',
      //         ),
      //         NavigationDestination(
      //           selectedIcon: Icon(Icons.home_outlined),
      //           icon: Icon(Icons.home),
      //           label: 'inicio',
      //         ),
      //         NavigationDestination(
      //           selectedIcon: Icon(Icons.play_circle_outline),
      //           icon: Icon(Icons.play_circle),
      //           label: 'juego',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
