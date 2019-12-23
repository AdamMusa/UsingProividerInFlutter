import 'package:flutter/material.dart';
import 'package:counter/provider_resource.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ChangeNotifierProvider<Counter>(
      builder: (context) => Counter(),
      child: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
            ),
            Text(
              'Vous avez appuyé :${counter.value}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.Increment,
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
    );
  }
}
