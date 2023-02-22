import 'package:flutter/material.dart';
import 'package:gtranslation_clone/service/hive_service.dart';
import 'package:gtranslation_clone/utils/colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = HiveService.instance.box!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved words'),
        toolbarHeight: 60.0,
      ),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) => Container(
          child: ListTile(
            title: Text(
              box.getAt(index)['firstLan'],
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: GTranslationColors.white, fontSize: 16.0),
            ),
            subtitle: Text(
              box.getAt(index)['secondLan'],
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: GTranslationColors.C_C3D3E5, fontSize: 14.0),
            ),
          ),
        ),
      ),
    );
  }
}
