import 'package:flutter/material.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [Image.asset('assets/background1.png')],),
      ),
    );
  }
}
