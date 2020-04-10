import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransformWidget extends StatefulWidget {
  @override
  _TransformWidgetState createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  var _sliderDegeri = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform Widget"),
      ),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.spaceAround,
        children: <Widget>[
          getSlider(),
          getRotate(),
          getScale(),
          getTranslate(),
        ],
      ),
    );
  }

  Slider getSlider() {
    return Slider(
      value: _sliderDegeri,
      min: 0.0,
      max: 100,
      onChanged: (yeniDeger) {
        setState(() {
          _sliderDegeri = yeniDeger;
        });
      },
    );
  }

  Container getRotate() {
    return Container(
      child: Transform.rotate(
        angle: _sliderDegeri,
        //origin: Offset(_sliderDegeri, _sliderDegeri),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ),
    );
  }

  Container getScale() {
    return Container(
      child: Transform.scale(
        scale: _sliderDegeri == 0 ? 1 : _sliderDegeri / 50,
        child: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
        ),
      ),
    );
  }

  Container getTranslate() {
    return Container(
      child: Transform.translate(
        offset: Offset(_sliderDegeri, 0.0),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.cyan,
        ),
      ),
    );
  }
}
