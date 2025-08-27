import 'package:fam/features/contextual_cards/data/models/contextual_card_model.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';
import 'package:fam/features/contextual_cards/data/services/api_service.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/card_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ContextualCardModel>> cards = ApiService().fetchContextualCards();
  late final HcGroup hcGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SvgPicture.asset(
            'assets/fampaylogo.svg',
            height: 30,
          ),
        ),
      ),
      body: Container(
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
              return ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  final section = cardList[index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        for (var group in section.hcGroups) ...[
                          CardFactory.buildGroup(group),
                          const SizedBox(height: 15),
                        ]
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
