import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc3CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc3CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final card = hcGroup.cards.isNotEmpty ? hcGroup.cards.first : null;
    return Container(
      height: ((hcGroup.height ?? 350) - 250).toDouble(),
      width: double.infinity,
      decoration: BoxDecoration(
        color: card!.bgColor != null
            ? ColorUtil.changeHex(card.bgColor)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        image: card.bgImage?.imageUrl != null
            ? DecorationImage(
                image: NetworkImage(card.bgImage!.imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Center(
        child: Text(card.title ?? "No title"),
      ),
    );
  }
}
