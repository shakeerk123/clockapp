import 'package:clockapp/clockview.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment:Alignment.center ,
        color: Color(0xFF2D2F41),
        child: ClockView(),
      ),
    );
  }
}
