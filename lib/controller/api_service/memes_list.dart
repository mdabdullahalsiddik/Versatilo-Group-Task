import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:test_1/model/memes_list.dart';

class MemesListService {
  static Future<List<Memes>> memesListService() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://api.imgflip.com/get_memes"));
      if (response.statusCode == 200) {
        MemesListModel data =
        MemesListModel.fromJson(jsonDecode(response.body));
        return data.data?.memes ?? [];
      }
    } catch (e) {
      log("error: $e");
    }
    return [];
  }
}