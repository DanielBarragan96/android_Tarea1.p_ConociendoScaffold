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
  bool _isFavorite = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //la siguiente  var da accesp a contexto de Scaffle
    var _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Click the FAV'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
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
                var now = new DateTime.now();
                //setState(() {});
                if (_counter % 2 == 0) {
                  _scaffoldkey.currentState
                    //para esconder el snackbar actual
                    ..hideCurrentSnackBar()
                    //mostrar dialogo
                    ..showSnackBar(SnackBar(
                      content: Text("Snackbar"),
                      duration: Duration(milliseconds: 1000),
                    ));
                } else {
                  _scaffoldkey.currentState
                    //para esconder el snackbar actual
                    ..hideCurrentSnackBar()
                    //mostrar dialogo
                    ..showSnackBar(
                      SnackBar(
                          content: Text('Snackbar'),
                          duration: Duration(milliseconds: 1000),
                          action: SnackBarAction(
                              label: "Dialogo",
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Title"),
                                        content: Text(
                                            now.toString().substring(0, 16)),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Salir"))
                                        ],
                                      );
                                    });
                              })),
                    );
                }
              },
              child: Text("Snackbar"),
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
