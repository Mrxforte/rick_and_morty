import 'package:flutter/material.dart';

class CharctersCardWidget extends StatelessWidget {
  const CharctersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Character Name',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Status: Alive',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Species: Human',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
