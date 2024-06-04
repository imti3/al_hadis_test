import 'package:al_hadis/dbhelper/DBHelper.dart';
import 'package:al_hadis/models/sections.dart';
import 'package:al_hadis/models/hadith.dart';
import 'package:get/get.dart';


class ContentController extends GetxController {
  var sectionsWithHadiths = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchCombinedData();
    super.onInit();
  }

  void fetchCombinedData() async {
    try {
      var sectionMaps = await DBHelper.getSections();
      var hadithMaps = await DBHelper.getHadiths();

      var sections = sectionMaps.map((map) => Section.fromMap(map)).toList();
      var hadiths = hadithMaps.map((map) => Hadith.fromMap(map)).toList();

      sectionsWithHadiths.value = sections.map((section) {
        var relatedHadiths = hadiths.where((hadith) => hadith.sectionId == section.id).toList();
        return {
          'section': section,
          'hadiths': relatedHadiths,
        };
      }).toList();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}


