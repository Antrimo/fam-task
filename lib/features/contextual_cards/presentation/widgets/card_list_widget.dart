import 'package:fam/core/storage/card_storage.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/cards/hc3/h3_card_back.dart';
import 'package:flutter/material.dart';
import '../../data/models/contextual_card_model.dart';
import '../../data/services/api_service.dart';
import '../../../../core/utils/card_design_util.dart';

class CardListWidget extends StatefulWidget {
  const CardListWidget({super.key});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  late Future<List<ContextualCardModel>> cards;

  @override
  void initState() {
    super.initState();
    cards = ApiService().fetchContextualCards();
    loadDismissState();
  }

  Future<void> loadDismissState() async {
    final savedDismiss = await CardStorage.loadDismissState();
    isDismissedNotifier.value = savedDismiss;
  }

  Future<void> refreshCards() async {
    setState(() {
      cards = ApiService().fetchContextualCards();
    });
    await cards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(247, 246, 243, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: FutureBuilder<List<ContextualCardModel>>(
        future: cards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No cards available');
          } else {
            final cardList = snapshot.data!;
            return RefreshIndicator(
              onRefresh: refreshCards,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isRemindNotifier,
                  builder: (context, isRemind, child) {
                    return ValueListenableBuilder<bool>(
                        valueListenable: isDismissedNotifier,
                        builder: (context, isDismiss, child) {
                          return ListView.builder(
                            itemCount: cardList.length,
                            itemBuilder: (context, index) {
                              final section = cardList[index];
                              return Column(
                                children: section.hcGroups.map((group) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: CardFactory.buildGroup(
                                        group, isRemind, isDismiss),
                                  );
                                }).toList(),
                              );
                            },
                          );
                        });
                  }),
            );
          }
        },
      ),
    );
  }
}
