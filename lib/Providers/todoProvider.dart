import 'package:flutter/cupertino.dart';
import 'package:notepad/Models/todoTile.dart';
import 'package:provider/provider.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoTile> todo = [];

  void addNote(String title, String description, String dateTime) {
    TodoTile _todotile = TodoTile(title, description, dateTime);

    todo.add(_todotile);

    notifyListeners();
  }

  List<TodoTile> get getList {
    return [...todo];
  }
}
