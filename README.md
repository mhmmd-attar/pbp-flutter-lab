# PBP Flutter Assignment

Platform-Based Programming (CSGE602022) - Organized by the Faculty of Computer Science Universitas Indonesia, Odd Semester 2022/2023

[Assignment 8](#assignment-8) -- [Assignment 7](#assignment-7)

# Assignment 8
### Explain the difference between Navigator.push and Navigator.pushReplacement.
`Navigator.push` pushes a route into the navigator stack while `Navigator.pushReplacement` pushes a route then removing the previous route (the current route/screen before the new one is pushed).

### List all the widgets you used in this project and explain their functions.
1. Drawer: a drawer in your page, sidemenu opened with a hamburger button, used in the Scaffold widget.
2. Scaffold: a widget to build the page using basic Material Design visual layout structure
3. Form: a container that can group together multiple form field widgets
4. TextFormField: a form field that is a TextField, used for text input
5. DropdownButtonFormField: a form field that is a dropdown menu.
6. Dialog: a dialog widget that shows basic general dialog
7. ListView.separated: a scrolling widget that displays children widgets constructed with a separator
8. Row: displays children in a horizontal array
9. Column: displays children in a vertical array
10. Expanded: expands in a Row, Column, or Flex widget
11. Padding: insets its child by the given padding
12. Align: aligns its child with the alignment property
13. Container: a container that can have specified painting, positioning, and sizing
14. Text: displays a text
15. SizedBox: a box with specified size, child will be forced to its dimension
16. FocusScope and FocusNode: manages keyboard focus

### Name the types of events that exist in Flutter (example: onPressed).
1. onChanged
2. onSaved
3. onSubmitted
4. onPressed
5. onClick
6. Events handled with GestureDetector: onTap, onLongPress, onDoubleTap, onHorizontalDragStart, etc.

### Explain how the Navigator works in "switching" pages of a Flutter application.
Flutter 1.0 uses the imperative approach for navigation. This approach mainly utilizes a stack containing routes and the push and pop methods. When we navigate to a new page, that new page is pushed into the stack. When we want to go back to the previous page/s, we pop the current route/s until the desired page it on top of the stack. There is also other methods, such as pushReplacement, where we push a new route/page and remove the previous one so that page can't be backtracked. This is mainly used to navigate after a login page since most of the time we don't want/need to go back the login page after logging in. There are the methods mainly used in this assignment
Flutter 2.0 introduced the declarative approach.

### Explain how you implemented the checking list above.
1. I started with the form page, adding input fields, following last week's tutorial, for the title and amount of the budget input. Then, I added the dropdown menu that to choose which type of budgeting info is being inputted. I modified the "amount" field so that only numbers can be typed in and, on mobile, the keyboard for numbers will be used. Then I added the "Save" button that will validate and save the form and configured the layout of the button and the form fields using Expanded.
2. I created a new file containing a custom class `Budget` that acts as a Model class for the budget data and a list to hold all instances of the class. I modified the button on the form page to create a new Budget instance according to the saved data from the form and to add it to the list in model.dart when clicked/pressed, and to show a Dialog to indicate the data has been successfully added to the list.
3. I create another dart file containing the page that will display the Budget instances. Using ListView.separated, for each item in the budgetData list will be returned as a Container that will display the title, amount, and type of the budget info. 
4. To do the bonus feature, I created a new file `drawer.dart` that will contain a new custom class called `AppDrawer`. This class is a widget that returns a drawer to navigate between the three pages. In the other pages, I import the new file and changed the drawer in the Scaffold to use the newly created widget.
5. I added a new attribute/variable in the Budget class that will contain a date as a string. In the form page, I added a new TextFormField that will showDatePicker onTap and a new private variable that will contain the date as a string. I created a new function that will be called when the TextFormField is tapped and will show the date picker. In this function, I created a formatter using the intl package what will format DateTime into a string containing only the date. After formatting the date, the string will be saved into the private variable and the TextFormField's value so it will be shown in the field in the form page. I added new Text widgets in the dialog returned when the form is validated and saved, and also in the result page.

<br><br>
## References
1. https://api.flutter.dev/flutter/widgets/Expanded-class.html
2. https://thinkdiff.net/how-to-create-validate-and-save-form-in-flutter-e80b4d2a70a4
3. https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
4. https://api.flutter.dev/flutter/material/DropdownButton-class.html
5. https://stackoverflow.com/questions/49780858/flutter-dropdown-text-field
6. https://stackoverflow.com/questions/73004239/flutter-dart-data-class
7. https://www.geeksforgeeks.org/flutter-custom-widgets/
8. https://stackoverflow.com/questions/54127847/flutter-how-to-display-datepicker-when-textformfield-is-clicked
9. https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart
### README references
1. https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
2. https://blog.logrocket.com/understanding-flutter-navigation-routing/#:~:text=The%20Navigator%20class%20provides%20all,a%20newer%20page%20and%20Navigator.
## Collaborators
1. Kaloosh Falito Verrel

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
