import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/views/home/home_viewmodel.dart';
import 'package:rick_and_morty/views/widgets/charcters_card_widget.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewmodel>().getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    var homeViewModel = context.watch<HomeViewmodel>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefix: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ),
              ),
            ),

            homeViewModel.character == null
                ? CircularProgressIndicator.adaptive()
                : MyCardList(),
          ],
        ),
      ),
    );
  }
}

class MyCardList extends StatelessWidget {
  const MyCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CharctersCardWidget(
            name: '',
            imageUrl:
                'https://rickandmortyapi.com/api/character/avatar/$index.jpeg',
            status: 'http://rickandmortyapi.com/api/character/$index',
            species: 'http://rickandmortyapi.com/api/character/$index',
          );
        },
      ),
    );
  }
}
