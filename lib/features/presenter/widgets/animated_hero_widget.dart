import 'package:flutter/material.dart';

class AnimatedHero extends StatefulWidget {
  const AnimatedHero({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _AnimatedHeroState createState() => _AnimatedHeroState();
}

class _AnimatedHeroState extends State<AnimatedHero>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.04),
  ).animate(_animationController);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: widget.child,
      position: _animation,
    );
    // return widget.child;
  }
}
