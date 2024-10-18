import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controller/ui/photo_edit.dart';



class PhotoEditorScreen extends StatelessWidget {
  const PhotoEditorScreen({super.key,});
 

  @override
  Widget build(BuildContext context) {
    final PhotoEditController controller = Get.put(PhotoEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.crop),
            onPressed: () {
              if (controller.imageBytes.value != null) {
                controller.cropImage(controller.imageBytes.value!);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: controller.saveToGallery,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.imageBytes.value != null) {
          return Center(
            child: Image.memory(
              controller.imageBytes.value!,
              fit: BoxFit.contain,
            ),
          );
        } else {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                controller
                    .loadSampleImage(); 
              },
              child: const Text('Load Sample Image'),
            ),
          );
        }
      }),
    );
  }
}
