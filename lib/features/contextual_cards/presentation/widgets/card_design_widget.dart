import 'package:fam/features/contextual_cards/presentation/widgets/h1_card_widget.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/h3_card_widget.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/h5_card_widget.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/h6_card_widget.dart';
import 'package:fam/features/contextual_cards/presentation/widgets/h9_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:fam/features/contextual_cards/data/models/hc_group.dart';

class CardFactory {
  static Widget buildGroup(HcGroup group) {
    switch (group.designType) {
      case "HC1":
        return Hc1CardWidget(hcGroup: group);
      case "HC9":
        return Hc9CardWidget(hcGroup: group);
      case "HC5":
        return Hc5CardWidget(hcGroup: group);
      case "HC6":
        return Hc6CardWidget(hcGroup: group);
      case "HC3":
        return Hc3CardWidget(hcGroup: group);
      default:
        return const SizedBox();
    }
  }
}
