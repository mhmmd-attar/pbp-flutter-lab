import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_form.dart';
import 'package:counter_7/model.dart';

class BudgetShowPage extends StatefulWidget {
  const BudgetShowPage({super.key});

  @override
  State<BudgetShowPage> createState() => _BudgetShowPageState();
}

class _BudgetShowPageState extends State<BudgetShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Data'),
      ),
      drawer: Drawer(
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
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetShowPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 80,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      budgetData[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                          "${budgetData[index].amount.toString()}\$",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16
                          ),
                        )],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Text(
                          budgetData[index].budgetType,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16
                          ),
                        )],
                      ),
                    ),
                  ]
                ),
              ]),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 2),
          itemCount: budgetData.length
        ),
      ),
    );
  }
}