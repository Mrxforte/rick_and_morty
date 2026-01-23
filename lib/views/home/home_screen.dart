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

        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return CharctersCardWidget();
          },
        ),
      ),
    );
  }
}
