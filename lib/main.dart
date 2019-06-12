import 'package:flutter/material.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff62727b),
        appBar: AppBar(
          title: Text('Tip Calculator'),
          backgroundColor: Color(0xff102027),
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _numberOfPeople = 4; // set default number of people
  int _tipPercent = 10; // set default tip percent
  double _totalBill = 0;
  String _individualExpense = '0';

  void calculateExpense() {
    setState(() {
      double totalExpense = ((100 + _tipPercent) / 100) * _totalBill;
      _individualExpense = (totalExpense / _numberOfPeople).toStringAsFixed(2);
    });
  }

  void incrementTip() {
    setState(() {
      _tipPercent += 5;
    });

    calculateExpense();
  }

  void decrementTip() {
    setState(() {
      if (_tipPercent != 0) {
        _tipPercent -= 5;
      }
    });

    calculateExpense();
  }

  void incrementPeople() {
    setState(() {
      _numberOfPeople += 1;
    });

    calculateExpense();
  }

  void decrementPeople() {
    setState(() {
      if (_numberOfPeople != 0) {
        _numberOfPeople -= 1;
      }
    });

    calculateExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, top: 30.0, right: 0.0, bottom: 10.0),
                  child: Text(
                    '\$$_individualExpense',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff62727b),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, top: 0.0, right: 0.0, bottom: 30.0),
                  child: Text(
                    'Per Buddy',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color(0xff62727b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Total Damage (\$)',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: TextField(
                  onChanged: (text) {
                    _totalBill = double.parse(text);
                    calculateExpense();
                  },
                  decoration:
                      InputDecoration(border: InputBorder.none, hintText: '0'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Generous Tip',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          onPressed: decrementTip,
                          child: Image.asset(
                            'assets/subtract.png',
                            width: 75,
                            height: 75,
                          )),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '$_tipPercent%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: incrementTip,
                          child: Image.asset(
                            'assets/add.png',
                            width: 75,
                            height: 75,
                          )),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Buddies',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          onPressed: decrementPeople,
                          child: Image.asset(
                            'assets/subtract.png',
                            width: 75,
                            height: 75,
                          )),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '$_numberOfPeople',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                          onPressed: incrementPeople,
                          child: Image.asset(
                            'assets/add.png',
                            width: 75,
                            height: 75,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
