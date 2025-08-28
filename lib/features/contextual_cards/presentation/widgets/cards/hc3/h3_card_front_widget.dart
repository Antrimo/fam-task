import 'package:fam/core/utils/color_util.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hc3CardWidget extends StatelessWidget {
  final HcGroup hcGroup;

  const Hc3CardWidget({super.key, required this.hcGroup});

  @override
  Widget build(BuildContext context) {
    final card = hcGroup.cards.isNotEmpty ? hcGroup.cards.first : null;
    return Container(
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
        padding: const EdgeInsets.only(left: 30.0, right: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 130,
            ),
            card.formattedTitle != null
                ? _buildFormattedText(card)
                : Text(
                    card.title ?? "No title",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () async {
                  final uri = Uri.parse(card.url ?? 'https://google.com');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: Container(
                  height: 42,
                  width: 128,
                  decoration: BoxDecoration(
                    color: card.cta?.first.bgColor != null
                        ? ColorUtil.changeHex(card.cta!.first.bgColor)
                        : Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      card.cta?.first.text ?? "No CTA",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFormattedText(dynamic card) {
  final formattedTitle = card.formattedTitle;
  if (formattedTitle == null) return const SizedBox.shrink();

  final entities = formattedTitle.entities ?? [];

  final firstLineSize =
      entities.isNotEmpty ? entities.first.fontSize?.toDouble() ?? 30 : 30;

  return RichText(
    text: TextSpan(
      children: [
        if (entities.isNotEmpty)
          TextSpan(
            text: entities[0].text + '\n',
            style: TextStyle(
              color: entities[0].color != null
                  ? ColorUtil.changeHex(entities[0].color)
                  : Colors.white,
              fontSize: firstLineSize,
              fontFamily: entities[0].fontFamily,
            ),
          ),
        if (entities.length > 1)
          TextSpan(
            text: "with action\n\n",
            style: TextStyle(
              color: Colors.white,
              fontSize: firstLineSize,
            ),
          ),
        if (entities.length > 1)
          TextSpan(
            text: entities[1].text,
            style: TextStyle(
              letterSpacing: 0.0,
              height: 1.5,
              color: entities[1].color != null
                  ? ColorUtil.changeHex(entities[1].color)
                  : Colors.white,
              fontSize: 12,
              fontFamily: entities[1].fontFamily,
            ),
          ),
      ],
    ),
  );
}
