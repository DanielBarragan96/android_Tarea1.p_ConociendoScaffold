import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool _isActive = true;
  bool _isSeen = true;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //la siguiente  var da accesp a contexto de Scaffle
    var _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _isSeen ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isSeen = !_isSeen;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Contador: $_counter"),
            FlatButton(
              onPressed: () {
                _counter++;
                //setState(() {});
                if (_counter % 2 == 0) {
                  _scaffoldkey.currentState
                    //para esconder el snackbar actual
                    ..hideCurrentSnackBar()
                    //mostrar dialogo
                    ..showSnackBar(SnackBar(
                      content: Text("Snackbar mostrar"),
                      duration: Duration(milliseconds: 1000),
                    ));
                } else {
                  _scaffoldkey.currentState
                    //para esconder el snackbar actual
                    ..hideCurrentSnackBar()
                    //mostrar dialogo
                    ..showSnackBar(SnackBar(
                      content: Text("Snackbar mostrar"),
                      duration: Duration(milliseconds: 1000),
                    ));
                }
              },
              child: Text("Snackbar"),
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //mostrar dialogo
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Dialogo"),
                  content: Text("Contenido del texto"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        //para salir del dialogo
                        Navigator.of(context).pop();
                      },
                      child: Text("Aceptar"),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.adjust),
        tooltip: "Dialogo",
      ),
    );
  }
}
