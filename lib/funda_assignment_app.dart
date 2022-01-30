import 'package:flutter/material.dart';
import 'package:funda_assignment/property/cubit/property_cubit/property_cubit.dart';
import 'package:funda_assignment/property/repository/remote_property_repository.dart';
import 'package:funda_assignment/property/view/property_details.dart';
import 'package:get_it/get_it.dart';

class FundaAssignment extends StatefulWidget {
  const FundaAssignment({Key? key}) : super(key: key);

  @override
  _FundaAssignmentState createState() => _FundaAssignmentState();
}

class _FundaAssignmentState extends State<FundaAssignment> {
  late PropertyCubit propertyCubit;

  @override
  void initState() {
    propertyCubit = PropertyCubit(GetIt.I<PropertyRepository>());
    propertyCubit.loadProperty('ab97604a-2832-4d4d-a365-2351395af32f');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: Scaffold(
        body: Center(
          child: PropertyDetails(propertyCubit: propertyCubit),
        ),
      ),
    );
  }
}

final _theme = ThemeData(
  primarySwatch: Colors.orange,
  textTheme: const TextTheme(
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
      fontSize: 18
    ),
    caption: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
    ),
  ),
);

const primaryTextColor = Color(0xFF303030);
