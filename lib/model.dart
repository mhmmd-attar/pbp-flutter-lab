import 'package:flutter/material.dart';

List<Budget> budgetData = [];

Widget getBudget(Budget budget) {
  Widget title = Text(budget.title);
  Widget amount = Text(budget.amount.toString());
  Widget budgetType = Text(budget.budgetType);
  return ListView(children: [title, amount, budgetType]);
}

class Budget {
  String title;
  double amount;
  String budgetType;

  Budget(this.title, this.amount, this.budgetType);
}