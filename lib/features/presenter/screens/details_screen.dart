import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';
import 'package:pokedex_clean/features/presenter/controllers/home_controller.dart';
import 'package:pokedex_clean/features/presenter/widgets/animated_hero_widget.dart';
import 'package:pokedex_clean/features/presenter/widgets/type_card_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorsUtil
          .colorByType[_controller.pokemons[widget.index].types.first],
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            child: Icon(
              _controller.pokemons[widget.index].isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
            onTap: () {
              // setState(() {});
              _controller.saveFavorite(widget.index);
            },
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return ContainerPlus(
      color: ColorsUtil
          .colorByType[_controller.pokemons[widget.index].types.first],
      child: SingleChildScrollView(
        child: Column(
          children: [
            ContainerPlus(
              isCenter: true,
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: AnimatedHero(
                child: Hero(
                  tag: _controller.pokemons[widget.index].id,
                  child: Image.network(
                    _controller.pokemons[widget.index].imgUrl,
                  ),
                ),
              ),
            ),
            TextPlus(
              _controller.pokemons[widget.index].name.capitalizeFirstWord,
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: ColorsUtil.white,
              margin: const EdgeInsets.symmetric(vertical: 12),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.pokemons[widget.index].types.map((type) {
                return TypeCard(
                  type,
                  cardFont: 16,
                );
              }).toList(),
            ),
            _statusBarContainer(MediaQuery.of(context).size.width),
          ],
        ),
      ),
    );
  }

  Widget _statusBarContainer(double size) {
    return ContainerPlus(
      radius: RadiusPlus.top(20),
      color: ColorsUtil.white,
      width: size,
      height: 300,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TextPlus(
              'Status',
              color: ColorsUtil.status,
              fontWeight: FontWeight.w500,
              fontSize: 24,
              margin: const EdgeInsets.only(top: 16),
              textDecorationPlus: TextDecorationPlus(
                // decorationThickness: 2,
                textDecoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 24),
              child: Column(
                children: [
                  _statusData('HP'),
                  _statusData('Attack'),
                  _statusData('Defense'),
                  _statusData('Special-Attack'),
                  _statusData('Special-Defense'),
                  _statusData('Speed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusData(String statusLabel) {
    return ContainerPlus(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextPlus(
            statusLabel,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: ColorsUtil.status,
          ),
          const Spacer(),
          TextPlus(
            _controller.pokemons[widget.index].stats[statusLabel].toString(),
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: ColorsUtil.status,
            margin: const EdgeInsets.only(right: 16),
          ),
          ContainerPlus(
            width: 130,
            height: 10,
            radius: RadiusPlus.all(10),
            child: TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0.0,
                end:
                    _controller.pokemons[widget.index].stats[statusLabel] / 200,
              ),
              duration: const Duration(milliseconds: 1800),
              builder: (context, double value, _) {
                return LinearProgressIndicator(
                  value: value,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorsUtil.colorByStats[statusLabel] ??
                        ColorsUtil.colorless,
                  ),
                  backgroundColor:
                      ColorsUtil.colorByStats[statusLabel]?.withOpacity(0.2) ??
                          ColorsUtil.colorless.withOpacity(0.2),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
