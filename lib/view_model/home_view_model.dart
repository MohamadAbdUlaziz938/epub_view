import 'dart:convert';
import 'dart:typed_data';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = true;
  List<List<int>> epubListUnit = [];
  late EpubController epubReaderController;
  List<EpubBook?> epubListBook = [];
  List epubsPath = [];

  // List<Image?> images=[];
  late EpubController _epubController;

  loadData() async {
    isLoading = true;
    var assets = await rootBundle.loadString('AssetManifest.json');

    Map allPaths = json.decode(assets);
    epubsPath =
        allPaths.keys.where((element) => element.endsWith(".epub")).toList();
    print(epubsPath);
    for (int i = 0; i < epubsPath.length; i++) {
      try {
        final a = await EpubDocument.openAsset(
          epubsPath[i],
        );
        epubListBook.add(a);
      } catch (e) {
        epubListBook.add(null);
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
