import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No places added yet',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          //route to place_detail.dart
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(place: places[index]),
            ),
          );
        },
      ),
      itemCount: places.length,
    );
  }
}
