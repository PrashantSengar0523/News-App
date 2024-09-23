import 'package:get/get.dart';

import '../utils/popups/loaders.dart';

class BookmarkController extends GetxController {
  // Observable list for bookmarks
  var bookmarks = List.generate(10, (index) => "Bookmark Item $index").obs;

  // Function to remove a bookmark by index
  void removeBookmark(int index) {
    bookmarks.removeAt(index);
    TLoaders.customToast(message: 'Bookmark removed');
  }
}