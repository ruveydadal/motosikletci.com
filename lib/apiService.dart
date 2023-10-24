import 'dart:convert';
import 'package:aregon/home.dart';
import 'package:aregon/userModel.dart';
import 'package:http/http.dart' as http;

String message = '';

class UserApi {
  static Future<List<Userlist>> getUser() async {
    final String city = cityController.text;
    final String gender = genderController.text;
    final String name = nameController.text;

    final Uri url = Uri.parse('http://www.motosikletci.com/api/kisiler')
        .replace(queryParameters: {
      'email': 'ruveydadal3@gmail.com',
      'sifre': '29_10_2023',
      'city_id': city,
      'cinsiyet': gender,
      'kisi_ad': name
    });

    final response = await http.post(url);

    Map data = json.decode(response.body);
    List _temp = [];
    _temp = data['kisiler']['data'];

    return Userlist.usersFromSnapshot(_temp);
  }
}

class saveApi {
  static Future<void> saveUser() async {
    final String newMail = newMailController.text;
    final String newPassword = newPasswordController.text;
    final String newPhone = newPhoneController.text;
    final String newCity = newCityController.text;
    final String newTown = newTownController.text;
    final String newGender = newGenderController.text;
    final String newName = newNameController.text;

    final Uri url = Uri.parse('http://www.motosikletci.com/api/kisi-kaydet')
        .replace(queryParameters: {
      'email': newMail,
      'sifre': newPassword,
      'kisi_id': 0,
      'city_id': newCity,
      'town_id': newTown,
      'kisi_ad': newName,
      'kisi_tel': newPhone,
      'cinsiyet': newGender
    });

    print(url);
    final response = await http.post(url);
    print(response);
    final Map<String, dynamic> data = json.decode(response.body);
    message = data['mesaj'];
    print(message);
    return data['mesaj'];
  }
}

class deleteApi {
  static Future<void> deleteUser() async {
    final String dMail = dMailController.text;
    final String dPassword = dPasswordController.text;
    final String dID = dIDController.text;

    final Uri url = Uri.parse('http://www.motosikletci.com/api/kisi-sil')
        .replace(queryParameters: {
      'email': dMail,
      'sifre': dPassword,
      'kisi_id': dID,
    });

    final response = await http.post(url);

    final Map<String, dynamic> data = json.decode(response.body);
    message = data['mesaj'];

    return data['mesaj'];
  }
}
