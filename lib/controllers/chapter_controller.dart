import 'package:al_hadis/models/chapters.dart';
import 'package:get/get.dart';
import '../dbhelper/DBHelper.dart';
import '../models/books.dart';

class ChapterController extends GetxController {
  var chapters = <Chapter>[].obs;

  @override
  void onInit() {
    fetchChapters();
    super.onInit();
  }

  void fetchChapters() async {
    try {
      var chapterMaps = await DBHelper.getChapters();
      chapters.value = chapterMaps.map((chapter) => Chapter.fromMap(chapter)).toList();
    } catch (e) {
      print("Error fetching chapters: $e");
    }
  }
}
