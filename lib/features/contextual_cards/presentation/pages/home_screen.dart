import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/card_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SvgPicture.asset(
            'assets/fampaylogo.svg',
            height: 30,
          ),
        ),
      ),
      body: const CardListWidget(),
    );
  }
}
