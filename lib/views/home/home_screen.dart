import 'package:flutter/material.dart';
import 'package:rick_and_morty/views/widgets/charcters_card_widget.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Flexible(
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
            ),
          ],
        ),
      ),
    );
  }
}
