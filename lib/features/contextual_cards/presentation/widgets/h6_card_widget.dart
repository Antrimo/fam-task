import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc6CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc6CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final card = hcGroup.cards.isNotEmpty ? hcGroup.cards.first : null;
    return Container(
      height: ((hcGroup.height ?? 10) + 28).toDouble(),
      width: double.infinity,
      decoration: BoxDecoration(
        color: card!.bgColor != null
            ? ColorUtil.changeHex(card.bgColor)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(card.title ?? "No title"),
      ),
    );
  }
}
