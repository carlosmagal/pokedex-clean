import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';
import 'package:pokedex_clean/features/presenter/controllers/home_controller.dart';
import 'package:pokedex_clean/features/presenter/widgets/type_card_widget.dart';

class PokeCardWidget extends StatefulWidget {
  const PokeCardWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  _PokeCardWidgetState createState() => _PokeCardWidgetState();
}

class _PokeCardWidgetState extends State<PokeCardWidget>
    with SingleTickerProviderStateMixin {
  final _controller = Modular.get<HomeController>();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  )..forward();

  late final Animation<double> _animation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(_animationController);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ContainerPlus(
        onTap: () async {
          // await navigatorPlus.showModal(
          //   DetalheScreen(
          //     widget.pokemon,
          //     _setFavorite,
          //     widget.isFiltering
          //   ),
          // );

          //caso esteja filtrando e o favorito do pokemon seja false, ele tira da lista
          // if(widget.isFiltering && !widget.pokemon.isFavorite!)
          //   await widget.setIsFavorite(widget.pokemon, changeIsFavorite: false);
        },
        radius: RadiusPlus.all(20),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        padding: const EdgeInsets.all(12),
        color: ColorsUtil
                .colorByType[_controller.pokemons[widget.index].types.first] ??
            ColorsUtil.colorless,
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _cardLeft(
              '#0${(_controller.pokemons[widget.index].id).toString()}',
              _controller.pokemons[widget.index].name,
            ),
            _cardRight(
              _controller.pokemons[widget.index].imgUrl,
              _controller.pokemons[widget.index].id,
            ),
          ],
        ),
      ),
    );
  }

  _cardLeft(String id, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextPlus(
              id,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: ColorsUtil.white,
              textAlign: TextAlign.start,
            ),
            TextPlus(
              name.capitalizeFirstWord,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorsUtil.white,
            ),
          ],
        ),
        Row(
          children: _controller.pokemons[widget.index].types.map((type) {
            return TypeCard(type);
          }).toList(),
        )
      ],
    );
  }

  _cardRight(String image, int id) {
    return Row(
      children: [
        Hero(
          tag: id,
          child: Image.network(
            image,
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: _setFavorite,
              child: Icon(
                _controller.pokemons[widget.index].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                size: 20,
                color: ColorsUtil.white,
              ),
            ))
      ],
    );
  }

  _setFavorite() async {
    _controller.saveFavorite(widget.index);
    setState(() {});
  }
}
