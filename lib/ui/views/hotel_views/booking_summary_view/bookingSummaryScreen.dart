import 'package:flutter/material.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [Image.asset('assets/image/png/background1.png')],
        ),
      ),
    );
  }
}
