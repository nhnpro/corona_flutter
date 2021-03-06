import 'package:flutter/material.dart';

class AnimatedCounter extends ImplicitlyAnimatedWidget {
  final int number;

  AnimatedCounter({
    Key key,
    @required this.number,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.linear,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCounterState();
}

class _AnimatedCounterState extends AnimatedWidgetBaseState<AnimatedCounter> {
  IntTween _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 8.0,
      ),
      child: Text(
        _counter.evaluate(animation).toString(),
        style: TextStyle(
          fontSize: 65.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    _counter = visitor(
      _counter,
      widget.number,
      (dynamic value) => IntTween(begin: value),
    );
  }
}
