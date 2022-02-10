import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
      radius: RadiusPlus.all(20),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      padding: const EdgeInsets.all(12),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cardLeft(),
          _cardRight(),
        ],
      ),
    );
  }

  Widget _cardLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextPlus(
              'id',
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: ColorsUtil.white,
              textAlign: TextAlign.start,
            ),
            TextPlus(
              'name.capitalizeFirstWord',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorsUtil.white,
            ),
          ],
        ),
        Row(
          children: [
            _typeCard(),
            _typeCard(),
          ],
        ),
      ],
    );
  }

  Widget _cardRight() {
    return Row(
      children: [
        ContainerPlus(),
        ContainerPlus(
          child: const Icon(
            Icons.favorite,
            size: 20,
            color: ColorsUtil.white,
          ),
        )
      ],
    );
  }

  Widget _typeCard() {
    return ContainerPlus(
      isCircle: true,
      border: BorderPlus(width: 0.5, color: ColorsUtil.white),
      color: ColorsUtil.typeCard,
      margin: const EdgeInsets.only(right: 4),
    );
  }
}
