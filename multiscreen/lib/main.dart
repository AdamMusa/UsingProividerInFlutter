import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multiscreen/model/models.dart';
import 'package:multiscreen/provider/provider_ressouce.dart';
import 'package:multiscreen/nextPage/NextPage.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/next':(context)=>NextPage(),
        '':(context)=>MyApp(),
      },
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ModelsNotifier>(
        builder: (context)=>ModelsNotifier(),
        child: MyApp(),
      ),
    )
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String currentName;
  String currentLastName;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ModelsNotifier modelsNotifier = Provider.of<ModelsNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Entre name',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'Entre name please';
                  }
                  return null;
                },
                onSaved: (String value){
                    currentName = value;
                },
              ),
               SizedBox(height: 20),
               TextFormField(
                decoration: InputDecoration(
                  labelText: 'Entre lastname',
                ),
               
                validator: (String value){
                  if(value.isEmpty){
                    return 'Entre lastname please';
                  }
                  return null;
                },
                onSaved: (String value){
                    currentLastName = value;
                },
              ),
              Text('$currentName et $currentLastName'),
              RawMaterialButton(
                onPressed: (){
                  if(!formkey.currentState.validate())return null;
                  formkey.currentState.save();
                  setState(() {
                    modelsNotifier.addModel(Models(name:currentName,lastname: currentLastName));
                  });
                },
                fillColor: Colors.purple,
                shape: StadiumBorder(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Text('add'),
                    Icon(Icons.add),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ],
                ),
              ),

              RawMaterialButton(
               onPressed: () {
                 Navigator.of(context).pushNamed('/next');
               },
                fillColor: Colors.blue,
                shape: StadiumBorder(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    Text('List'),
                    Icon(Icons.forward),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}