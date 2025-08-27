import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc6CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc6CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final card = hcGroup.cards.isNotEmpty ? hcGroup.cards.first : null;
    final displayText = card!.formattedTitle?.entities.isNotEmpty == true
        ? card.formattedTitle!.entities.first.text
        : card.title ?? "No title";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          height: ((hcGroup.height ?? 10) + 28).toDouble(),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                AspectRatio(
                    aspectRatio: ((card.icon?.aspectRatio ?? 1) / 2),
                    child:
                        Image(image: NetworkImage(card.icon?.imageUrl ?? ""))),
                const SizedBox(width: 15),
                Text(
                  displayText ?? "No title",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: card.formattedTitle?.entities.first.fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          )),
    );
  }
}
