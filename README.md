# PBP Flutter Assignment

Platform-Based Programming (CSGE602022) - Organized by the Faculty of Computer Science Universitas Indonesia, Odd Semester 2022/2023

[Assignment 8](#asgmt8) -- [Assignment 7](#asgmt7)

<a name="asgmt8"></a>
# Assignment 8
### Explain the difference between Navigator.push and Navigator.pushReplacement.
### List all the widgets you used in this project and explain their functions.
### Name the types of events that exist in Flutter (example: onPressed).
### Explain how the Navigator works in "switching" pages of a Flutter application.
### Explain how you implemented the checking list above.


<a name="asgmt7"></a>
# Assignment 7
### Explain what is meant by stateless widget and stateful widget and explain the difference between them.
A stateless widget never changes while a stateful widget changes according to its state. A stateful widget has a state consisting of its values that can be changed. This change can be triggered in response to events such as user interactions or data exchange. Whenever the state changes, the state object calls setState to rebuild the widget.

### Mention what widgets you use in this project and explain their functions.
1. Center  : A layout widget that positions one single child widget in the middle of the parent
2. Column  : A layout widget that arranges a list/array of children vertically
3. Row     : A layout widget that arranges a list/array of children horizontally
4. Text    : A widget to simply display a string of text with one single style
5. Padding : A widget to put paddings between the parent and the child
6. Expanded: A widget that expands a child of a Row, Column, or Flex widget to fill the available space
7. Container: A widget that acts as a container of widgets that have common properties: painting, positioning, sizing
8. FloatingActionButton: a circular button that hovers over content

### What is the function of setState()? Explain what variables can be affected by the function.
setState() notifies the framework that an object's state has changed and to build and update the interface to display the new state of that object. setState() affects the widgets build to be rebuilt to display the changes in certain variables. In this assignment, setState() is called everytime `_counter`'s value is changed in the `_incrementCounter` and `_decrementCounter` functions.

### Explain the difference between const and final.
Both final and const objects cannot be reassigned, but const is assigned at compile-time while final is assigned at runtime. const objects must be created from data/values/objects that already exists or can be calculated at compile time. final should be used when we don't have the value/object at compile time; the value is calculated at runtime. It should be used when we want to get the current datetime, data from a database, etc.

### Explain how you implement the checklist above.
1. Ran `flutter create counter_7`
2. Changed the page title into 'Flutter Assignment'; changed the app bar title into 'Counter Program'; modified the floatingActionButton widget; modified the text widget in the body.
3. Created a new function that can decrement the counter only if the counter's value is greater than 0; modified the body to display the text widget above the _counter display with an if-else statement.
4. Modified the floatingActionButton with an if-else statement to show the "- button" only when the counter not equal to 0.
5. Created a new repository on GitHub; initialized the Flutter app directory as a repository: pushed it on GitHub

<br><br>
## References
1. https://youtu.be/p4TrTolskAo
2. https://stackoverflow.com/questions/49713189/how-to-use-conditional-statement-within-child-attribute-of-a-flutter-widget-cen
3. https://googleflutter.com/flutter-text-color/
