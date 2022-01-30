import 'package:flutter/material.dart';
import 'package:funda_assignment/injection.dart';

import 'funda_assignment_app.dart';

void main() {
  configureDependencies();
  runApp(const FundaAssignment());
}
