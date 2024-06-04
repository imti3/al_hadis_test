import 'package:al_hadis/controllers/content_controller.dart';
import 'package:al_hadis/models/hadith.dart';
import 'package:al_hadis/models/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/hexagon_widget.dart';

class ContentScreen extends StatelessWidget {
  final String abvrCode1;
  ContentScreen({super.key, required this.abvrCode1});
  final ContentController contentController = Get.put(ContentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সব হাদিসের বই'),
      ),
      body: Obx(() {
        if (contentController.sectionsWithHadiths.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: contentController.sectionsWithHadiths.length,
            itemBuilder: (context, index) {
              final item = contentController.sectionsWithHadiths[index];
              final section = item['section'] as Section;
              final hadiths = item['hadiths'] as List<Hadith>;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (section.title != null && section.title!.isNotEmpty)
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: section.number ?? '',
                                    style: TextStyle(color: Colors.green,
                                    fontFamily: 'Kalpurush',

                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${section.title}',
                                    style: TextStyle(color: Colors.black,
                                      fontFamily: 'Kalpurush',
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            Text(
                              section.number ?? '',
                              style: TextStyle(color: Colors.green),
                            ),
                          if (section.preface != null && section.preface!.isNotEmpty) ...[
                            Divider(),
                            Text(section.preface!,
                            style: TextStyle(fontFamily: 'Kalpurush',),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  ...hadiths.map((hadith) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                HexagonWidget( code: abvrCode1, color: Colors.green,),  // Assuming you have a widget for hexagon
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('সহীহ বুখারী',style: TextStyle(fontFamily: 'Kalpurush',)),
                                    Text('হাদিস ${hadith.id}',style: TextStyle(fontFamily: 'Kalpurush',),), // Replace hadith.hadithId with the correct property name
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              hadith.ar ?? '',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontFamily: 'KFQQ'), // Ensure you set an appropriate font
                            ),
                            SizedBox(height: 8),
                            Text(
                              hadith.narrator != null ? ' ${hadith.narrator} থেকে বর্ণিতঃ ':'',
                              style: TextStyle(color: Colors.green,
                                fontFamily: 'Kalpurush',),
                            ),
                            SizedBox(height: 8),
                            Text(
                              hadith.bn ?? 'No Content',
                              style: const TextStyle(color: Colors.black,fontFamily: 'Kalpurush',),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                ],
              );
            },
          );
        }
      }),
    );
  }
}
