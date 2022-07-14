library time_bar;

import 'package:flutter/material.dart';

class TimeBar extends StatefulWidget {
  final double min, max, startVal;
  final SliderThemeData? data;
  final TextStyle? currentTime, durationTime;
  const TimeBar(
      {Key? key,
      this.min = 0,
      this.max = 100,
      this.startVal = -1,
      this.data,
      this.currentTime,
      this.durationTime})
      : super(key: key);

  @override
  State<TimeBar> createState() => _TimeBarState();
}

String addZero(int num) {
  if (num < 10) {
    return "0$num";
  }
  return num.toString();
}

String timeFormat(int num) {
  return "${addZero(num ~/ 60)}.${addZero(num % 60)}";
}

class _TimeBarState extends State<TimeBar> {
  double _val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.startVal == -1) {
      _val = widget.min;
    } else {
      _val = widget.startVal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          timeFormat(_val.toInt()),
          style: widget.currentTime,
        ),
        Flexible(
          child: SliderTheme(
            data: widget.data ?? const SliderThemeData(),
            child: Slider(
                min: widget.min,
                max: widget.max,
                divisions: (widget.max - widget.min).toInt(),
                value: _val,
                onChanged: (val) {
                  setState(() {
                    _val = val;
                  });
                }),
          ),
        ),
        Text(
          timeFormat(widget.max.toInt()),
          style: widget.durationTime,
        ),
      ],
    );
  }
}
