import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';

class TypeCard extends StatelessWidget {
  const TypeCard(
    this.label, {
    Key? key,
    this.cardFont = 10,
    this.cardMargin = 4,
  }) : super(key: key);

  final double cardFont;
  final double cardMargin;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
      isCircle: true,
      border: BorderPlus(width: 0.5, color: ColorsUtil.white),
      color: ColorsUtil.typeCard,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: cardMargin),
      child: TextPlus(
        label.capitalizeFirstWord,
        color: ColorsUtil.white,
        fontWeight: FontWeight.w700,
        isCenter: true,
        fontSize: cardFont,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
    );
  }
}
