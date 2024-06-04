import 'package:al_hadis/screen/ChapterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../widgets/hexagon_widget.dart';

class HomeScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সব হাদিসের বই'),
      ),
      body: Obx(() {
        if (bookController.books.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: bookController.books.length,
            itemBuilder: (context, index) {
              final book = bookController.books[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: HexagonWidget(
                      code: book.abvrCode ?? 'B',
                      color: Colors.green,
                    ),
                    title: Text(
                      book.title ?? 'No Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('ইমাম বুখারী'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${book.numberOfHadis ?? 0}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('হাদিস'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterScreen(abvrCode: book.abvrCode!),
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
