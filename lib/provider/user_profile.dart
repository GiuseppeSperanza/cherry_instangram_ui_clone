import 'dart:convert';

import 'package:cherryinstangramuiclone/models/profile_model.dart';
import 'package:cherryinstangramuiclone/shared/constants/user_constants.dart';
import 'package:http/http.dart' as http;

Future<ProfileModel> downloadUserProfile() async {
  final response =
      await http.get('https://www.instagram.com/$USERNAME_TO_READ/?__a=1');
  if (response.statusCode != 200) {
    //TODO gestire eccezione
    throw Exception("Errore nello scaricamento dati da instangram");
  }

  final data = json.decode(response.body);

  return ProfileModel.fromData(data);
}
