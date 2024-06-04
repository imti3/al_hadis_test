import 'package:get/get.dart';
import '../dbhelper/DBHelper.dart';
import '../models/books.dart';

class BookController extends GetxController {
  var books = <Book>[].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() async {
    try {
      var bookMaps = await DBHelper.getBooks();
      books.value = bookMaps.map((book) => Book.fromMap(book)).toList();
    } catch (e) {
      print("Error fetching books: $e");
    }
  }
}
