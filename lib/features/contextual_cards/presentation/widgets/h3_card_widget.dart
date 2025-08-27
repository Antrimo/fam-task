import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc3CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc3CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final card = hcGroup.cards.isNotEmpty ? hcGroup.cards.first : null;
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: card.formattedTitle != null
              ? _buildFormattedText(card)
              : Text(
                  card.title ?? "No title",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

Widget _buildFormattedText(dynamic card) {
  final entities = card.formattedTitle?.entities ?? [];

  return Center(
    child: RichText(
      text: TextSpan(
        children: entities.map<TextSpan>((entity) {
          return TextSpan(
            text: "${entity.text}\n",
            style: TextStyle(
              color: entity.color != null
                  ? ColorUtil.changeHex(entity.color)
                  : Colors.white,
              fontSize: entity.fontSize?.toDouble() ?? 16,
            ),
          );
        }).toList(),
      ),
    ),
  );
}
