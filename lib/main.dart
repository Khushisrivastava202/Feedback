import 'package:flutter/material.dart';
import 'package:homzy2/feebackapp.dart';
import 'package:wiredash/wiredash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      secret: 'vgxr1gV5Lc3aEeUu_SgcTEre13l4yZCj',
      projectId: 'homzy2-a1n2q6x',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home:MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanks for improving us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rate our app ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "By Just One click to the floating button below",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Wiredash.of(context).setUserProperties(userEmail: '');
          Wiredash.of(context).show();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


