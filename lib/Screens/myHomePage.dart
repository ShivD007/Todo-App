import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Screens/dashboard.dart';
import 'package:notepad/Screens/profile.dart';
import 'package:notepad/widgets/bottomsheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TextEditingController _noteController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _noteController = TextEditingController.fromValue(
    //   TextEditingValue(
    //     text: "hello",
    //   ),
    // );
  }

  // Widget _currentScreen = Profile();
  List _currentPagelist = [Dashboard(), Profile()];
  var _currentIdex = 0;

  @override
  Widget build(BuildContext context) {
    PageStorageBucket _bucket = PageStorageBucket();

    // var _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          CustomBottomSheet.bottomSheet(context);
        },
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 5,
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIdex = 0;
                    });
                  },
                  child: Icon(
                    Icons.timeline_outlined,
                    size: 40,
                    color: _currentIdex == 1 ? Colors.grey : Colors.black,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIdex = 1;
                    });
                  },
                  child: Icon(Icons.account_circle_outlined,
                      size: 40,
                      color: _currentIdex == 0 ? Colors.grey : Colors.black),
                ),
              ],
            ),
          )),
      body: PageStorage(
        bucket: _bucket,
        child: _currentPagelist.elementAt(_currentIdex),
      ),
    );
  }
}
