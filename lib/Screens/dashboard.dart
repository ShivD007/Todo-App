import 'package:flutter/material.dart';
import 'package:notepad/Models/todoTile.dart';
import 'package:notepad/Providers/todoProvider.dart';
import 'package:notepad/widgets/noteTile.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // Provider.of<TodoProvider>(context, listen: false).getList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height - 20,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                top: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .15,
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text(
                "Have a Good day!!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child:
                  Consumer<TodoProvider>(builder: (context, todoProvider, _) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoProvider.getList.length == 0
                        ? 1
                        : todoProvider.getList.length,
                    itemBuilder: (context, index) {
                      return NoteTile(index);
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
