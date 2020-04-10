import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(seconds: 0),
            to: Duration(seconds: 6),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(seconds: 1),
            to: Duration(seconds: 2),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(seconds: 2),
            to: Duration(seconds: 3),
            tag: "height")
        .addAnimatable(
            animatable: EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 16),
                end: EdgeInsets.only(bottom: 75)),
            from: Duration(seconds: 3),
            to: Duration(seconds: 4),
            curve: Curves.easeInCirc,
            tag: "padding")
        .addAnimatable(
            animatable: new BorderRadiusTween(
                begin: new BorderRadius.circular(4.0),
                end: new BorderRadius.circular(75.0)),
            from: const Duration(seconds: 4),
            to: const Duration(seconds: 5),
            curve: Curves.ease,
            tag: "borderRadius")
        .addAnimatable(
            animatable: new ColorTween(
                begin: Colors.indigo,
                end: Colors.orange),
            from: Duration(seconds: 5),
            to: Duration(seconds: 6),
            curve: Curves.ease,
            tag: "color")
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Padding(
              padding: sequenceAnimation["padding"].value,
              child: Opacity(
                opacity: sequenceAnimation["opacity"].value,
                child: Container(
                  decoration: BoxDecoration(
                    color: sequenceAnimation["color"].value,
                    border: Border.all(
                      width: 3,
                      color: Colors.pink[200],
                    ),
                    borderRadius: sequenceAnimation["borderRadius"].value,
                  ),
                  width: sequenceAnimation["width"].value,
                  height: sequenceAnimation["height"].value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
