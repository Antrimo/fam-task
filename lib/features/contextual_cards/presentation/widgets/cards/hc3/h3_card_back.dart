import 'package:fam/core/storage/card_storage.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:flutter/material.dart';

final ValueNotifier<bool> isRemindNotifier = ValueNotifier<bool>(false);
final ValueNotifier<bool> isDismissedNotifier = ValueNotifier<bool>(false);

class HC3CardBack extends StatefulWidget {
  final HcGroup hcGroup;
  const HC3CardBack({
    super.key,
    required this.hcGroup,
  });

  @override
  State<HC3CardBack> createState() => _H3CardLongpressState();
}

class _H3CardLongpressState extends State<HC3CardBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (((widget.hcGroup.height ?? 350) - 250).toDouble()),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                isRemindNotifier.value = true;
              },
              child: Container(
                height: 63,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 246, 243, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/bell.png'),
                    const Text(
                      "remind later",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                await CardStorage.saveDismissState(true);
                isDismissedNotifier.value = true;
              },
              child: Container(
                height: 63,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 246, 243, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/cross.png'),
                    const Text(
                      "dismiss now",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
