import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_show.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {
  final _formKey = GlobalKey<FormState>();
  static const _budgetTypes = ['Income', 'Expense'];
  String _title = "";
  double _amount = 0;
  String _budgetType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget Info'),
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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Using padding of 8 pixels
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Income from ... / Expense for ...",
                        labelText: "Title",
                        // Added a circular border to make it neater
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Added behavior when name is typed
                      onChanged: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      // Added behavior when data is saved
                      onSaved: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      // Validator as form validation
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please specify the title!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Using padding of 8 pixels
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount of income or expense",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // Added behavior when name is typed
                      onChanged: (String? value) {
                        setState(() {
                          _amount = value! as double;
                        });
                      },
                      // Added behavior when data is saved
                      onSaved: (String? value) {
                        setState(() {
                          _amount = value! as double;
                        });
                      },
                      // Validator as form validation
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'The amount cannot be empty!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Choose Type',
                      ),
                      items: _budgetTypes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          _budgetType = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _budgetType = value!;
                        });
                      },
                      // Validator as form validation
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please specify the type!!';
                        }
                        return null;
                      },
                    ),
                  ),
                ]
              )
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final budget = Budget(title: _title, amount: _amount, budgetType: _budgetType);
                      budgetData.add(budget);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BudgetShowPage()),
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}