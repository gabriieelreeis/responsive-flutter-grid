import 'package:flutter/material.dart';
import 'package:responsive_layout/responsive_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Bootstrap Grid Example')),
        body: RContent(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                RRow(
                  children: [
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.red, height: 100),
                    ),
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.green, height: 100),
                    ),
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.blue, height: 100),
                    ),
                  ],
                ),
                RRow(
                  children: [
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.red, height: 100),
                    ),
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.green, height: 100),
                    ),
                    RCol(
                      xs: 2,
                      sm: 6,
                      md: 4,
                      lg: 3,
                      xl: 2,
                      child: Container(color: Colors.blue, height: 100),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
