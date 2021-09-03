import 'package:flutter/material.dart';

import 'package:notepad/Providers/todoProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  String formattedDate;
  DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat("yyyy-MM-dd HH:mm").format(now);
  }

  TextEditingController _title = TextEditingController();
  TextEditingController _des = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoProvider _todoProvider = Provider.of<TodoProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _title,
              validator: (value) {
                if (value.trim().length < 1) {
                  return "Please enter title";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter Title',
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: _des,
              validator: (value) {
                if (value.trim().length < 1) {
                  return "Please enter Description";
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter Description',
                labelText: 'Description',
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _todoProvider.addNote(
                            _title.text, _des.text, formattedDate);
                        Navigator.pop(context);
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
