import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class TodoList extends StatefulWidget {

  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {

  final String _appTitle = "Todo List";
  final _todos = <String>[];
  final _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(_appTitle)),
      body: new Column(
        children: <Widget>[
          new TextField(controller: _controller),
          new Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = _todos[index];
                return new Dismissible(
                  key: new Key('$todo$index'),
                  child: new ListTile(title: new Text(todo)),
                  background: new Container(color: Colors.red),
                  onDismissed: (direction) => _todos.removeAt(index)
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _todos.add(_controller.text);
            _controller.clear();
          });
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    // Build the Widget
    await tester.pumpWidget(TodoList());

    // Enter 'hi' into the TextField
    await tester.enterText(find.byType(TextField), 'hi');

    // Tap the add button
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the Widget with the new item
    await tester.pump();

    // Expect to find the item on screen
    expect(find.text('hi'), findsOneWidget);

    // Swipe the item to dismiss it
    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    // Build the Widget until the dismiss animation ends
    await tester.pumpAndSettle();

    // Ensure the item is no longer on screen
    expect(find.text('hi'), findsNothing);
  });
}
