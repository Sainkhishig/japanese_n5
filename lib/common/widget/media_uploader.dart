import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MediaUploader extends StatefulWidget {
  MediaUploader({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MediaUploaderState();
}

const UPLOAD_SIZE_LIMIT = 10500000; //10MB

class _MediaUploaderState extends State<MediaUploader> {
  List<PlatformFile?> _pickedImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          direction: Axis.horizontal,
          children: _pickedImages.mapIndexed((index, image) {
            final _imageData = _pickedImages[index] != null
                ? _pickedImages[index]!.bytes
                : null;
            return SizedBox(
              width: 150,
              child: Column(
                children: [
                  Stack(
                    children: [
                      if (_imageData != null)
                        Container(
                          width: double.infinity,
                          // padding: const EdgeInsets.only(bottom: 15),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.memory(_imageData),
                          ),
                        ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(color: Colors.grey, width: .5)),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 15,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _pickedImages = _pickedImages
                                  .whereIndexed(
                                      (iIndex, image) => iIndex != index)
                                  .toList();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(_pickedImages[index]!.name),
                  if (_pickedImages[index]!.size > UPLOAD_SIZE_LIMIT)
                    RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.warning,
                              size: 16,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: " 10MBを超過しています",
                            style: TextStyle(fontSize: 9, color: Colors.red),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: imageSelectorGallery,
              child: const Text('ファイル選択'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text("一度に10ファイルまで登録できます。",
            style: TextStyle(
              color: _pickedImages.length > 10 ? Colors.red : Colors.black,
            )),
        Text("登録可能なファイルサイズは10MB以下です。",
            style:
                TextStyle(color: hasOverSizeImage ? Colors.red : Colors.black)),
        const Text("登録可能なファイルは「jpg」「jpeg」「png」です。"),
        HookConsumer(
          builder: (context, ref, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 22),
              width: 100,
              child: ElevatedButton(
                child: Text("хадгалах"),
                onPressed: (_pickedImages.isNotEmpty &&
                        _pickedImages.length <= 10 &&
                        !hasOverSizeImage)
                    ? () async {
                        var _index = 0;
                        // await Future.forEach(_pickedImages, (image) {
                        //   ++_index;
                        //   Uint8List? imageFileByte =
                        //       (image as PlatformFile).bytes;
                        //   String imageFileName = image.name;

                        //   return request.files.add(http.MultipartFile.fromBytes(
                        //       'image$_index', imageFileByte!,
                        //       filename: imageFileName));
                        // });

                        Uint8List? imageFileByte =
                            (_pickedImages[0] as PlatformFile).bytes;
                        String imageFileName =
                            (_pickedImages[0] as PlatformFile).name;
                        FirebaseStorage storage = FirebaseStorage.instance;

                        // Upload file
                        if (imageFileByte != null) {
                          await storage
                              .ref('listening/$imageFileName')
                              .putData(imageFileByte);
                        }

//                         final storageRef = FirebaseStorage.instance.ref();
//                         // Create a reference to "mountains.jpg"
//                         final mountainsRef =
//                             storageRef.child("$imageFileName.jpg");

// // Create a reference to 'images/mountains.jpg'
//                         final mountainImagesRef =
//                             storageRef.child("images/$imageFileName.jpg");

// // While the file names are the same, the references point to different files
//                         assert(mountainsRef.name == mountainImagesRef.name);
//                         assert(mountainsRef.fullPath !=
//                             mountainImagesRef.fullPath);
//                         if (imageFileByte != null)
//                           await mountainsRef.putData(imageFileByte);
                        // final result = await ref
                        //     .read(pyfm151Controller.notifier)
                        //     .save(_pickedImages);

                        // // final result = true;

                        // if (!result) {
                        //   showErrorToastMessage(context, "保存に失敗しました。");
                        //   return;
                        // }

                        // showSuccessToastMessage(context, "保存に成功しました。");

                        // // clear all
                        // ref.read(pyfm150Controller.notifier).selectedFileName =
                        //     "";
                        // ref.read(pyfm152Controller.notifier).clearState();
                        setState(() {
                          _pickedImages.clear();
                        });
                      }
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }

  Future imageSelectorGallery() async {
    FilePickerResult? image = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (image != null) {
      var duplicateFilter = image.files.where((e) {
        return !_pickedImages.map((y) => y!.name).toList().contains(e.name);
      }).toList();

      for (var e in duplicateFilter) {
        _pickedImages.add(e);
      }

      if (mounted) {
        setState(() {});
      }
    } else {
      print("File picker error");
    }
  }

  bool get hasOverSizeImage =>
      _pickedImages.any((e) => e!.size > UPLOAD_SIZE_LIMIT);
}
