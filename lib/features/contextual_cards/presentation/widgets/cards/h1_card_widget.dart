import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

class Hc1CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc1CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final double groupHeight = (hcGroup.height ?? 64).toDouble();
    final bool isScrollable = hcGroup.isScrollable;

    if (isScrollable) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: groupHeight,
          child: PageView.builder(
            controller: PageController(viewportFraction: 1.0),
            itemCount: hcGroup.cards.length,
            itemBuilder: (context, index) {
              final card = hcGroup.cards[index];
              final displayText =
                  card.formattedTitle?.entities.isNotEmpty == true
                      ? card.formattedTitle!.entities.first.text
                      : card.title ?? "No title";

              return Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Container(
                  height: groupHeight,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: ColorUtil.changeHex(card.bgColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      if (card.icon?.imageUrl != null)
                        AspectRatio(
                          aspectRatio: (card.icon?.aspectRatio ?? 1) / 1.5,
                          child: Image.network(card.icon!.imageUrl),
                        ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayText!,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(card.formattedDescription?.entities.first.text ??
                              ""),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: groupHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: hcGroup.cards.map((card) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: groupHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: ColorUtil.changeHex(card.bgColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: (card.icon?.aspectRatio ?? 1) / 1.8,
                        child: Image.network(card.icon!.imageUrl),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Small Card",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(card.formattedDescription?.entities.first.text ??
                              ""),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}
