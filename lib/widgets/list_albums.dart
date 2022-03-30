import 'package:flutter/material.dart';
import 'package:flutter_localization/data/model/album.dart';

class ListAlbums extends StatelessWidget {
  final AsyncSnapshot<List?> list;

  const ListAlbums({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: list.data?.length,
        itemBuilder: (context, index) {
          final item = list.data?[index] as Album;
          return Card(
            child: ListTile(
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                item.body,
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                Navigator.pop(context, item);
              },
            ),
          );
        },
      ),
    );
  }
}
