// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:path/path.dart' as p;

class FilePickerService {
  File? selectedImage;
  final _imagePicker = ImagePicker();

  // Future<List<File?>> pickImage() async {
  //   return await pickImageWithoutCompression();
  // }

  pickImageWithCompression() async {
    List<File> selectedImage = [];
    final image50 = await _imagePicker.pickMultiImage();

    if (image50 != null) {
      selectedImage = [];
      for (var element in image50) {
        selectedImage.add(File(element.path));
      }
    }
    debugPrint('images: ${selectedImage.length}');
    return selectedImage;
  }

  Future<File?> pickSingleImage() async {
    print("pickSingleImage");
    File? selectedImage;
    final image50 = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);
    // final image100 = await _imagePicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 100);
    if (image50 != null) selectedImage = File(image50.path);

    // log.d('Image100 Size: ${await image100?.length()}');
    return selectedImage;
  }

  Future<File?> takeImage() async {
    File? selectedImage;
    final image50 = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 40);
    // final image100 = await _imagePicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 100);
    if (image50 != null) selectedImage = File(image50.path);

    // log.d('Image100 Size: ${await image100?.length()}');
    return selectedImage;
  }

  // pickImageWithoutCompression() async {
  //   File? selectedImage;
  //   final _filePicker = FilePicker.platform;
  //   FilePickerResult? result = await _filePicker.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: false,
  //   );

  //   if (result != null) {
  //     selectedImage = File(result.paths.first!);
  //     final extension = p.extension(selectedImage.path);
  //     debugPrint('@FilePcikerService.pickImage ==> Extension: $extension');
  //     if (extension == '.heic') {
  //       String? jpegPath = await HeicToJpg.convert(selectedImage.path);
  //       if (jpegPath != null) selectedImage = File(jpegPath);
  //     }
  //     // final dir = path_prvoider.getTemporaryDirectory();
  //     // final newPath = '$dir/test.jpg';
  //     // final compressedImage = await _compressImageFile(selectedImage, newPath);
  //     // if (compressedImage != null) {
  //     //   selectedImage = compressedImage;
  //     // }
  //   }
  //   return selectedImage;
  // }

  // Future<File?> _compressImageFile(File file, String targetPath) async {
  //   debugPrint(
  //       '@compressImageFile => Size before compression: ${await file.length()}');
  //   var result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 70,
  //   );

  //   if (result != null) {
  //     print('File compressed successfully');
  //   } else {
  //     print('Compressed file path is null');
  //   }

  //   debugPrint(
  //       '@compressImageFile => Size after compression: ${await result?.length()}');
  //   return result;
  // }
}
