import 'package:flutter/material.dart';
import 'package:flutteranimasyon/animasyonlu_widgetlar.dart';
import 'package:flutteranimasyon/new_page.dart';
import 'package:flutteranimasyon/transform_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController controller;
  Animation animation;
  Animation animation2;
  Animation animation3;

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
    );
    controller.addListener(() {
      setState(() {
        //debugPrint(controller.value.toString());
        //debugPrint(animation.value.toString());
      });
    });

    animation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    animation3 = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation2 = AlignmentTween(begin: Alignment(-1, -1), end: Alignment(1,1)).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo));


    //controller.reverse(from: 100); //from 20den başla demek oluyor
    controller.forward();
    controller.addStatusListener((durum) {
      if (durum == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (durum == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }
      debugPrint("Durum : " + durum.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3.value * 20),
            ),
            Container(
              height: 200,
              alignment: animation2.value,
              child: Text(
                '$_counter',
                //style: Theme.of(context).textTheme.display1,
                style: TextStyle(
                  fontSize: controller.value + 36,
                ),
              ),
            ),
            Hero(
              tag: 'fatih',
              child: FlutterLogo(
                size: 64,
                colors: Colors.purple,
              ),
            ),
            RaisedButton(
              child: Text("Next Page"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewPage()));
              },
            ),
            RaisedButton(
              child: Text("Animasyonlu Widgetler"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AnimasyonluWidgetlar()));
              },
            ),
            RaisedButton(
              child: Text("Transform ile ilgili Widgetler"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TransformWidget()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
