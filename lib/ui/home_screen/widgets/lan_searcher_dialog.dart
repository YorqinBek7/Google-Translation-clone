import 'package:flutter/material.dart';
import 'package:gtranslation_clone/ui/home_screen/widgets/language_select.dart';
import 'package:gtranslation_clone/utils/constats.dart';

class LanSearcher extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var letter in languages) {
      if (letter['code']!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(letter['lan']!);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => LanguagesToSelect(
        language: matchQuery[index],
        isLast: matchQuery.length - 1 == index,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      itemBuilder: (context, index) => LanguagesToSelect(
        language: languages[index]['lan']!,
        isLast: languages.length - 1 == index,
      ),
    );
  }
}
