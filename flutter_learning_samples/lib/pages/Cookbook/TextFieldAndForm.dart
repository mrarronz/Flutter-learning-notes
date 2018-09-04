import 'package:flutter/material.dart';

class TextFieldAndForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new FormValidatorDemo();
  }
}

class FormDemo extends StatefulWidget {

  @override
  createState() => new FormExampleState();
}

class FormExampleState extends State<FormDemo> {

  final myController = new TextEditingController();
  final FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('TextField表单使用')),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new TextFormField(
              autofocus: true,
              decoration: new InputDecoration(
                labelText: 'First name'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your first name";
                }
              },
            ),
            new TextField(
              onChanged: (text) {
                if (text.isNotEmpty) {
                  print("Last name: $text");
                }
              },
              decoration: new InputDecoration(
                hintText: 'Last name'
              ),
            ),
            new TextField(
              controller: myController,
              decoration: new InputDecoration(
                hintText: 'job'
              ),
            ),
            new TextField(
              focusNode: myFocusNode,
              decoration: new InputDecoration(
                hintText: 'age'
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(myFocusNode);
        },
        tooltip: 'Focus fourth text field',
        child: new Icon(Icons.edit),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.removeListener(_printLatestValue);
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  _printLatestValue() {
    if (myController.text.isNotEmpty) {
      print('job: ${myController.text}');
    }
  }
}


/// ------------------一条普通的分割线------------------///
///

/// 表单验证
class FormValidatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('测试表单验证')),
      body: new FormValidatorExample(),
    );
  }
}

class FormValidatorExample extends StatefulWidget {
  
  @override
  createState() => new FormValidatorState();
}

class FormValidatorState extends State<FormValidatorExample> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter content";
              }
            },
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: new RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Processing data...')));
                }
              },
              child: new Text('Submit'),
            ),
          ),
        ],
      )
    );
  }
}