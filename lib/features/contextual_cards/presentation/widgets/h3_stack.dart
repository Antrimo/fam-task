import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/cards/hc3/h3_card_back.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/cards/hc3/h3_card_widget.dart';
import 'package:flutter/material.dart';

class H3Stack extends StatefulWidget {
  final HcGroup hcGroup;
  const H3Stack({super.key, required this.hcGroup});

  @override
  State<H3Stack> createState() => _H3StackState();
}

class _H3StackState extends State<H3Stack> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final double space = (MediaQuery.sizeOf(context).width - 120) / 2;
    final double cardHeight = ((widget.hcGroup.height ?? 350) - 250).toDouble();

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Stack(
        children: [
          HC3CardBack(hcGroup: widget.hcGroup),
          AnimatedPositioned(
            left: isSelected ? space : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: SizedBox(
                height: cardHeight,
                width: MediaQuery.sizeOf(context).width - 40,
                child: Hc3CardWidget(hcGroup: widget.hcGroup),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
