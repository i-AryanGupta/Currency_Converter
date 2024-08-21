import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency_convert.dart';

void main(){
  runApp(const MyApp());
}

// Types of Widget
// 1. StatelessWidget
// 2. StatefulWidget
// 3. InheritedWidget

// State

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(home: CurrencyConvert()
    );
  }

}