import 'package:al_hadis/screen/ContentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chapter_controller.dart';
import '../widgets/hexagon_widget.dart';

class ChapterScreen extends StatelessWidget {
   final String abvrCode;
  ChapterScreen({super.key, required this.abvrCode});
  final ChapterController chapterController = Get.put(ChapterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সব হাদিসের বই'),
      ),
      body: Obx(() {
        if (chapterController.chapters.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: chapterController.chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapterController.chapters[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: HexagonWidget(
                      code:  abvrCode,
                      color: Colors.green,
                    ),
                    title: Text(
                      chapter.title ?? 'No Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        chapter.hadis_range??
                            'Nothing Found',

                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentScreen(abvrCode1:abvrCode),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
