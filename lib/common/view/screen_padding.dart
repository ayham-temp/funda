import 'package:flutter/material.dart';

class ContentPadding extends StatelessWidget {
  final Widget? child;

  const ContentPadding({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: child,
    );
  }
}
