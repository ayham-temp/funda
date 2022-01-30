import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Widget label;

  const Tag({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Theme.of(context).primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style:
            Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
        child: label,
      ),
    );
  }
}
