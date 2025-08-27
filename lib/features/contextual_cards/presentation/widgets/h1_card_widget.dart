import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc1CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc1CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (hcGroup.height ?? 100).toDouble(),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];
          final displayText = card.formattedTitle?.entities.isNotEmpty == true
              ? card.formattedTitle!.entities.first.text
              : card.title ?? "No title";

          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: card.bgColor != null
                  ? ColorUtil.changeHex(card.bgColor)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              displayText!,
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}
