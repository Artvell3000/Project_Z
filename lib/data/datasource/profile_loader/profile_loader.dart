import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project_z/data/data_entity/custom_user_json.dart';


class ProfileJsonLoader {
  static const String _fileName = 'profile.json';

  static Future<File> _getProfileFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$_fileName');

    if (!await file.exists()) {
      return await file.writeAsString(jsonEncode(const CustomUserJson().toJson()));
    }
    return file;
  }

  static Future<void> updateProfile(CustomUserJson newProfile) async {
    final file = await _getProfileFile();
    await file.writeAsString(jsonEncode(newProfile.toJson()));
  }

  static Future<CustomUserJson> loadProfile() async {
    final file = await _getProfileFile();
    final contents = await file.readAsString();
    return CustomUserJson.fromJson(jsonDecode(contents));
  }
}