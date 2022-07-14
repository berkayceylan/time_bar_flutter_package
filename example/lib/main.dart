import 'package:flutter/material.dart';
import 'package:time_bar/time_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Time Bar Tutorial"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TimeBar(
              min: 20,
              max: 200,
              startVal: 100,
              data: SliderThemeData(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: const RectangularSliderTrackShape(),
                trackHeight: 3.0,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
