import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/config/constants.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
      radius: RadiusPlus.all(20),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      padding: const EdgeInsets.all(12),
      height: 85,
      color: ColorsUtil.colorByType[type],
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
            Shimmer.fromColors(
              baseColor: ColorsUtil.loadingContainer,
              highlightColor: Colors.white,
              child: TextPlus(
                '###',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: ColorsUtil.white,
                textAlign: TextAlign.start,
              ),
            ),
            Shimmer.fromColors(
              baseColor: ColorsUtil.loadingContainer,
              highlightColor: Colors.white,
              child: TextPlus(
                'Pokédex',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorsUtil.white,
              ),
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
        Shimmer.fromColors(
          baseColor: ColorsUtil.loadingContainer,
          highlightColor: Colors.white,
          child: Image.network(
            PokedexConstants.url,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: ColorsUtil.loadingContainer,
            highlightColor: Colors.white,
            child: const Icon(
              Icons.favorite,
              size: 20,
              color: ColorsUtil.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _typeCard() {
    return Shimmer.fromColors(
      baseColor: ColorsUtil.loadingContainer,
      highlightColor: Colors.white,
      child: ContainerPlus(
        radius: RadiusPlus.all(20),
        isCircle: true,
        border: BorderPlus(width: 0.5, color: ColorsUtil.white),
        color: ColorsUtil.typeCard,
        margin: const EdgeInsets.only(right: 4),
        child: TextPlus(
          'label',
          color: Colors.transparent,
          fontWeight: FontWeight.w700,
          isCenter: true,
          fontSize: 10,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        ),
      ),
    );
  }
}
