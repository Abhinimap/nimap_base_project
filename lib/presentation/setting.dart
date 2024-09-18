import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings Page'),
        actions: const [
          Text('Eng'),
          LanguageSwitchWidget(),
        ],
      ),
      floatingActionButton: const AddButton(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This will translate : ${Strings.goodMorning.tr}',
            // style: MyFonts.displayTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const DataBaseDataList(),
          const SizedBox(
            height: 20,
          ),
          const DeleteButton(),
        ],
      ),
    );
  }
}

class LanguageSwitchWidget extends StatefulWidget {
  const LanguageSwitchWidget({super.key});

  @override
  State<LanguageSwitchWidget> createState() => _LanguageSwitchWidgetState();
}

class _LanguageSwitchWidgetState extends State<LanguageSwitchWidget> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        inactiveTrackColor: Colors.red,
        // activeColor: Colors.deepOrange,
        activeTrackColor: Colors.green,
        inactiveThumbColor: Colors.white,
        value: _value,
        onChanged: (v) {
          LocalizationService.updateLanguage(
              LocalizationService.getCurrentLocal().languageCode == 'ar'
                  ? 'en'
                  : 'ar');
          setState(() {
            _value = v;
          });
        });
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final db = await DatabaseService().database;
        final a = await db.insert('breeds', {
          'name': 'Labrador',
          'description': 'Even-tempered, gentle, and agile'
        });
        final b = await db.insert('breeds',
            {'name': 'Beagle', 'description': 'Curious, merry, and friendly'});
        final c = await db.insert('breeds', {
          'name': 'German Shepherd',
          'description': 'Confident, courageous, and smart'
        });

        if (a != 0 && b != 0 && c != 0) {
          CustomSnackBar.showCustomSnackBar(
              title: 'Data inserted Successfully',
              message: 'Please Refresh Page');
        }
      },
      child: Icon(Icons.add),
    );
  }
}

class DataBaseDataList extends StatefulWidget {
  const DataBaseDataList({super.key});

  @override
  State<DataBaseDataList> createState() => _DataBaseDataListState();
}

class _DataBaseDataListState extends State<DataBaseDataList> {
  Future<List<Map<String, Object?>>> _database() async {
    final Database db = await DatabaseService().database;
    return await db.rawQuery('SELECT * FROM breeds');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Map<String, Object?>>>(
          future: _database(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snap.connectionState == ConnectionState.done &&
                snap.data != null) {
              final data = snap.data!;
              return RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return Future.value();
                },
                child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: List.generate(data.length, (index) {
                      final tile = data[index];
                      return ListTile(
                        title: Text(tile['name'].toString()),
                      );
                    })),
              );
            }
            return const SizedBox();
          }),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: LocalizationService.isItEnglish()
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () async {
            final db = await DatabaseService().database;
            final a = await db
                .delete('breeds', where: 'name=?', whereArgs: ['Labrador']);
            final b = await db.delete(
              'breeds',
              where: 'name =?',
              whereArgs: ['Beagle'],
            );
            final c = await db.delete(
              'breeds',
              where: 'name=?',
              whereArgs: ['German Shepherd'],
            );

            if (a != 0 && b != 0 && c != 0) {
              CustomSnackBar.showCustomSnackBar(
                  title: 'Data Deleted Successfully',
                  message: 'Please Refresh page..');
            }
          },
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
