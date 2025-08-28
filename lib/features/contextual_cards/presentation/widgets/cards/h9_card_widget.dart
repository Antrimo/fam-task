import 'package:fam/core/utils/gradient_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc9CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc9CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final double groupHeight = (hcGroup.height ?? 195).toDouble();

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: groupHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hcGroup.cards.length,
          itemBuilder: (context, index) {
            final card = hcGroup.cards[index];

            final double aspectRatio = card.bgImage?.aspectRatio ?? 1.0;
            final double cardWidth = groupHeight * aspectRatio;

            return Container(
              margin: const EdgeInsets.only(right: 15),
              width: cardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: GradientUtil.fromHexList(card.bgGradient?.colors),
                image: card.bgImage?.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(card.bgImage!.imageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
