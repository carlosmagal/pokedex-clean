import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/utils/colors_util.dart';
import 'package:pokedex_clean/features/presenter/controllers/home_controller.dart';
import 'package:pokedex_clean/features/presenter/widgets/poke_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = Modular.get<HomeController>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ColorsUtil.background,
        appBar: _buildAppBar(),
        body: _buildBody(),
      );
    });
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: ColorsUtil.headerBackground,
      elevation: 0,
      title: TextPlus(
        'Pokédex',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorsUtil.cinzaEscuro,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: _controller.homeState == HomeState.loading
                ? null
                : () {
                    // _controller.changeToFiltered();
                  },
            child: Icon(
              _controller.homeState == HomeState.filtering
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: _controller.homeState == HomeState.loading
                  ? ColorsUtil.cinzaEscuro.withOpacity(0.5)
                  : ColorsUtil.cinzaEscuro,
            ),
          ),
        )
      ],
    );
  }

  _buildBody() {
    return Column(
      children: [
        _headerTextField(),
        Expanded(
          child: _bodyPokemonList()
          ),
      ],
    );
  }

  _headerTextField() {
    return ContainerPlus(
      radius: RadiusPlus.bottom(20),
      color: ColorsUtil.headerBackground,
      shadows: [
        ShadowPlus(
          color: ColorsUtil.black,
          moveDown: 4,
          blur: 2,
          spread: 0,
          opacity: 0.1,
        ),
      ],
      child: TextFieldPlus(
        controller: textController,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        padding: const EdgeInsets.fromLTRB(18, 0, 8, 0),
        height: 48,
        backgroundColor: ColorsUtil.textField,
        cursorColor: ColorsUtil.cinzaEscuro,
        enabled: _controller.homeState == HomeState.loading,
        radius: RadiusPlus.all(12),
        maxLength: 30,
        textInputAction: TextInputAction.search,
        onChanged: (text) {
          _controller.setSearchText(text);
          textController.text = text;
        },
        onSubmitted: (text) {
          // _controller.searchPokemon();
        },
        placeholder: TextPlus(
          'Search Pokemon',
          color: ColorsUtil.textFieldIcon,
        ),
        prefixWidget: Icon(
          Icons.search,
          color: ColorsUtil.textFieldIcon,
          size: 24,
        ),
        suffixWidget: textController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: ColorsUtil.textFieldIcon,
                ),
                onPressed: () {
                  textController.clear();
                  _controller.setSearchText('');
                },
              )
            : null,
      ),
    );
  }

  _bodyPokemonList(){
    return Observer(
      builder: (context){
        return ListView.builder(
          controller: _controller.scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 16.0),
          itemCount: _controller.pokemons.length + 1,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (context, index){
            if(index < _controller.pokemons.length) {
              return PokeCardWidget(
                index: index
              );
            }

            // if(_controller.hasMoreToLoad)
            //   return this._loadingContainer();

            return Container();
          }
        );
      }
    );
  }
}
