import 'package:flutter/material.dart';

class AnimasyonluWidgetlar extends StatefulWidget {
  @override
  _AnimasyonluWidgetlarState createState() => _AnimasyonluWidgetlarState();
}

class _AnimasyonluWidgetlarState extends State<AnimasyonluWidgetlar> {
  var _color = Colors.blue;
  var _genislik = 100.0;
  var _yukseklik = 100.0;
  var _ilkCocukAktif = false;
  var _opaklik = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyonlu Widgetlar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 2),
                color: _color,
                height: _yukseklik,
                width: _genislik,
              ),
              RaisedButton(
                onPressed: () {
                  _animatedContainerAnimasyonu();
                },
                color: _color == Colors.blue ? Colors.yellow : Colors.blue,
                child: Text("Animated Container"),
              ),
              AnimatedCrossFade(
                firstChild: Image.network(
                    "https://cdnuploads.aa.com.tr/uploads/Contents/2015/10/02/thumbs_b_c_563df1dde7880f2552557927e2240247.jpg"),
                secondChild: Image.network(
                    "https://img.fanatik.com.tr/img/78/740x418/5b0ee6d166a97c4350d6a390.jpg"),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              RaisedButton(
                onPressed: () {
                  _crossFadeAnimasyonu();
                },
                color: _color == Colors.blue ? Colors.yellow : Colors.blue,
                child: Text("Cross Fade Animasyonu"),
              ),
              AnimatedOpacity(
                  opacity: _opaklik,
                  duration: Duration(seconds: 2),
                  child: FlutterLogo(
                  size: 100,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _opacityAnimasyonu();
                },
                color: _color == Colors.blue ? Colors.yellow : Colors.blue,
                child: Text("Opacity Animasyonu"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContainerAnimasyonu() {
    setState(() {
      _color = _color == Colors.blue ? Colors.yellow : Colors.blue;
      _genislik = _genislik == 200.0 ? 100 : 200;
      _yukseklik = _yukseklik == 200.0 ? 100 : 200;
    });
  }

  void _crossFadeAnimasyonu() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _opacityAnimasyonu() {
    setState(() {
      _opaklik = _opaklik == 1.0 ? 0.3: 1.0;
    });
  }
}
