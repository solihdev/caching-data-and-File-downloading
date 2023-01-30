import 'package:cachingdata_and_filedownloading/ui/tab_box/tabs/product/product_page.dart';
import 'package:flutter/material.dart';

import 'tabs/file_downloading/file_downloading_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = const [
      ProductPage(),
      FileDownloadingPage(),
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.api_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_download), label: ""),
        ],
      ),
    );
  }
}
