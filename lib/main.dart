import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  String _message = "";
  void _countMethod(int _value) {
    setState(
      () {
        _count += _value;
        if (_count >= 10) {
          _message = "Restaurante Lotado!!";
        } else if (_count <= 0) {
          _message = "Mundo invertido!!";
        } else {
          _message = "Pode Entrar!!";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            'assets/restaurant.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pessoas: $_count',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {
                        _countMethod(1);
                      },
                      child: Icon(
                        Icons.add_circle,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {
                        _countMethod(-1);
                      },
                      child: Icon(
                        Icons.remove_circle,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '$_message',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
