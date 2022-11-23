import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/budget.dart';

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
      drawer: const AppDrawer(),
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
                Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(
                            budgetData[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          )],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Text(
                            budgetData[index].date,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16
                            ),
                          )],
                        ),
                      ),
                    ]
                ),
                const SizedBox(height: 2),
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