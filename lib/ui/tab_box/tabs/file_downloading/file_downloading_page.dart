import 'package:cachingdata_and_filedownloading/data/models/file_downloading/file_model.dart';
import 'package:cachingdata_and_filedownloading/ui/tab_box/tabs/file_downloading/widget/file_item.dart';
import 'package:flutter/material.dart';

class FileDownloadingPage extends StatelessWidget {
  const FileDownloadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FileDownloading Page"),),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: files.length,
            itemBuilder: (context, index) => FileItemWidget(file: files[index]),)
        ],
      ),
    );
  }
}
