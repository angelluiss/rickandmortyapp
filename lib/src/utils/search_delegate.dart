import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchReasults = [
    'Rick',
    'Morty',
    'Hombre Pajaro',
    'Macho men',
    'las chicas super poderosas'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions2 = searchReasults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions2.length,
        itemBuilder: (context, index) {
          final suggestions = suggestions2[index];
          return ListTile(
            title: Text(suggestions),
            onTap: () {
              query = suggestions;
              showResults(context);
            },
          );
        });
  }
}
