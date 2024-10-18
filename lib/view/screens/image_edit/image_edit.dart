import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Editing",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: Get.height * 0.5,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.25,
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.crop,
                    size: 40,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.25,
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.rotate_left,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.03),
          InkWell(
            onTap: () {},
            child: Container(
              height: Get.height * 0.06,
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Save To Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
