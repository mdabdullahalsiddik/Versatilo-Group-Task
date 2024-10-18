import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class PhotoEditController extends GetxController {
  var imageBytes = Rxn<Uint8List>(); 

  @override
  void onInit() {

    loadSampleImage();
    super.onInit();
  }
  Future<void> loadSampleImage() async {
      final String   imageUrl = await Get.arguments;
    try {
      final response = await HttpClient().getUrl(Uri.parse(imageUrl));
      final bytes = await response.close().then(
        (response) => response.fold<BytesBuilder>(
          BytesBuilder(),
          (builder, data) => builder..add(data),
        ),
      ).then((builder) => builder.takeBytes());

      imageBytes.value = bytes;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load image: $e');
    }
  }


  Future<void> cropImage(Uint8List imageBytes) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/temp_image.jpg');
      await tempFile.writeAsBytes(imageBytes);

      final croppedImage = await ImageCropper().cropImage(
        sourcePath: tempFile.path,
      
        compressQuality: 80,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
          ),
        ]
         
       
      );

      if (croppedImage != null) {
        this.imageBytes.value = await croppedImage.readAsBytes();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to crop image: $e');
    }
  }


  Future<void> saveToGallery() async {
    if (imageBytes.value != null) {
      // Request storage permission
      if (await Permission.storage.request().isGranted) {
        try {
          final result = await ImageGallerySaverPlus.saveImage(
            imageBytes.value!,
            quality: 80,
            name: 'edited_image_${DateTime.now().millisecondsSinceEpoch}',
          );

          if (result['isSuccess'] == true || result != null) {
            Get.snackbar('Success', 'Image saved to gallery');
          } else {
            Get.snackbar('Error', 'Failed to save image');
          }
        } catch (e) {
          Get.snackbar('Error', 'Failed to save image: $e');
        }
      } else {
        Get.snackbar('Permission Denied', 'Storage permission is required to save images');
      }
    }
  }

}
