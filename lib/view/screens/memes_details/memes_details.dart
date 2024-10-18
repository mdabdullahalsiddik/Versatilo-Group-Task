import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/model/memes_list.dart';

import 'package:test_1/view/screens/photo/edit.dart';

class MemesDetails extends StatelessWidget {
  const MemesDetails({
    super.key,
    required this.id,
    this.memes,
  });

  final dynamic id;
  final Memes? memes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Memes Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Text(
              "${memes?.name}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: Get.height * 0.05),
            SizedBox(
              height: Get.height * 0.4,
              width: Get.width,
              child: Image.network("${memes?.url}", fit: BoxFit.fill),
            ),
            SizedBox(height: Get.height * 0.05),
            InkWell(
              onTap: () {
                Get.to(() => const PhotoEditorScreen(), arguments: memes?.url);
              },
              child: Container(
                height: Get.height * 0.06,
                width: Get.width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Edit  Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ));
  }
}
