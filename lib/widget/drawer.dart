import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/budget_form.dart';
import 'package:counter_7/page/budget_show.dart';
import 'package:counter_7/page/mywatchlist.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Adding clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Routing the menu to the main page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Budget Info'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Budget Data'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetShowPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Watch List'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ),
    );
  }}