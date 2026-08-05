import 'package:flutter/material.dart';
import '../tabs/home_tab.dart';
import '../tabs/orders_tab.dart';
import '../tabs/profile_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
    ),
    backgroundColor: Color(0xfff3c8a5),
    title: const Text(
    "My App #1",
    style: TextStyle(color: Colors.black87),
    ),
    bottom: const TabBar(
    tabs:[
      Tab(icon: Icon(Icons.home),text: "Home"),
      Tab(icon: Icon(Icons.shopping_cart),text: "Orders"),
      Tab(icon: Icon(Icons.person),text: "Profile"),
    ],
    ),
    ),
    drawer: Drawer(
       child: ListView(
         children: [
           const UserAccountsDrawerHeader(
             accountName: Text("Jia"),
             accountEmail: Text("jiams@gmail.com"),
             currentAccountPicture: CircleAvatar(
               child: Icon(Icons.person_outline),
             ),
           ),
           ListTile(
             leading: const Icon(Icons.dashboard),
             title: const Text("Dashboard"),
             onTap: () => Navigator.pop(context),
           ),
           ListTile(
             leading: const Icon(Icons.settings),
             title: const Text("Settings"),
             onTap: () => Navigator.pop(context),
           ),
           const Divider(thickness: 2.4),
           ListTile(
              leading: const Icon(Icons.logout,color: Colors.red),
              title: Text(
                "Log out",
                 style: TextStyle(color: Colors.red[800]),
              ),
              onTap: () => Navigator.pop(context),
           ),
         ],
       ),
    ),
    body: const TabBarView(
       children: [HomeTab(), OrdersTab(),ProfileTab()],
    ),
    ),
    );
  }
}