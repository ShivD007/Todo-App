import 'package:flutter/material.dart';
import 'package:notepad/Providers/todoProvider.dart';
import 'package:notepad/widgets/bottomsheet.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatefulWidget {
  final int _index;
  // final TodoProvider _todoProvider;

  // int _todOList;

  NoteTile(
    this._index,
    // this._todoProvider,
  );

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider _todoProvider = Provider.of<TodoProvider>(context);
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 2,
                color: widget._index == 0 ? Colors.white : Colors.blue,
              ),
              Icon(
                Icons.circle,
                size: 30,
              ),
              Container(
                height: 55,
                width: 2,
                color: Colors.blue,
              ),
              widget._index == _todoProvider.getList.length - 1 ||
                      _todoProvider.getList.length == 0
                  ? InkWell(
                      onTap:
                          widget._index == _todoProvider.getList.length - 1 ||
                                  _todoProvider.getList.length == 0
                              ? () {
                                  CustomBottomSheet.bottomSheet(context);

                                  // _todoProvider.addNote("hi", "description");
                                }
                              : null,
                      child: Icon(
                        _todoProvider.getList.length == 0 ||
                                widget._index ==
                                    _todoProvider.getList.length - 1
                            ? Icons.add_circle
                            : Icons.remove_circle_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    )
                  : Container(),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.black26)
                      ],
                      border: Border(
                          top: BorderSide(width: 5, color: Colors.amber))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _todoProvider.getList.length == 0
                                    ? "Welcome to ToDo App"
                                    : _todoProvider
                                        .getList[widget._index].title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              if (_todoProvider.getList.length != 0)
                                Text(
                                  _todoProvider.getList[widget._index].dateTime,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                            ],
                          )),
                      Text(
                        _todoProvider.getList.length == 0
                            ? "This is your Timline. You'll see tasks that you added. To add new task click on add button"
                            : _todoProvider.getList[widget._index].description,
                        // _todoProvider.getList[widget._index].tille,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                _todoProvider.getList.length == 0 ||
                        widget._index == _todoProvider.getList.length - 1
                    ? Container(
                        margin: EdgeInsets.only(left: 25, top: 30),
                        child: Text("Add task for today"),
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
