import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc9CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc9CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final double groupHeight = (hcGroup.height ?? 195).toDouble();

    return SizedBox(
      height: groupHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hcGroup.cards.length,
        itemBuilder: (context, index) {
          final card = hcGroup.cards[index];

          // Parse gradient colors
          final gradientColors = card.bgGradient?.colors
                  .map((c) => Color(int.parse(c.replaceFirst('#', '0xff'))))
                  .toList() ??
              [Colors.grey, Colors.black12];

          // Use aspect ratio from API, fallback to 1 (square)
          final double aspectRatio = card.bgImage?.aspectRatio ?? 1.0;
          final double cardWidth = groupHeight * aspectRatio;

          return Container(
            width: cardWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              ),
              image: card.bgImage?.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(card.bgImage!.imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
