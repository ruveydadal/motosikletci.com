import 'package:aregon/apiService.dart';
import 'package:aregon/contactList.dart';
import 'package:aregon/login.dart';
import 'package:aregon/styles.dart';
import 'package:aregon/userModel.dart';
import 'package:flutter/material.dart';

final TextEditingController cityController = TextEditingController();
final TextEditingController genderController = TextEditingController();
final TextEditingController nameController = TextEditingController();

final TextEditingController dMailController = TextEditingController();
final TextEditingController dPasswordController = TextEditingController();
final TextEditingController dIDController = TextEditingController();

final TextEditingController newMailController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController newPhoneController = TextEditingController();
final TextEditingController newCityController = TextEditingController();
final TextEditingController newTownController = TextEditingController();
final TextEditingController newGenderController = TextEditingController();
final TextEditingController newNameController = TextEditingController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;

  late List<Userlist> _users;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // saveUsers();
    getUsers();
  }

  Future<void> getUsers() async {
    _users = await UserApi.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> saveUsers() async {
    //_users = await saveApi.saveUser();
    await saveApi.saveUser();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> deleteUsers() async {
    await deleteApi.deleteUser();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.motorcycle),
            SizedBox(width: 10),
            Text("KİŞİLERİM"),
            SizedBox(width: 365),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: EdgeInsets.all(16.0),
                          child: Column(children: [
                            inputStyle(
                                "Şehir",
                                "Lütfen aratmak istediğiniz şehri seçiniz.",
                                cityController),
                            inputStyle("Cinsiyet", "Lütfen cinsiyeti seçiniz.",
                                genderController),
                            inputStyle(
                                "İsim",
                                "Lütfen aratmak istediğiniz ismi yazınız.",
                                nameController),
                            SizedBox(height: 25),
                            Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  getUsers();
                                },
                                child: Text(
                                  "ARA",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        );
                      });
                })
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return userCard(
                    name: _users[index].name,
                    phone: _users[index].phone,
                    city: _users[index].city,
                    town: _users[index].town);
              },
            ),
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.deepPurpleAccent,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    child: Column(children: [
                  inputStyleSave(
                      "Email", "Lütfen emailinizi giriniz.", newMailController),
                  inputStyleSave("Şifre", "Lütfen şifrenizi giriniz.",
                      newPasswordController),
                  inputStyleSave("Şehir", "Lütfen şehir kodunuzu giriniz.",
                      newCityController),
                  inputStyleSave("İlçe", "Lütfen ilçe kodunuz giriniz.",
                      newTownController),
                  inputStyleSave(
                      "Telefon",
                      "Lütfen telefon numaranızı giriniz.555xxxxxxx",
                      newPhoneController),
                  inputStyleSave(
                      "Cinsiyet",
                      "Lütfen cinsiyet kodunuzu giriniz.1-Erkek, 2-Kadın",
                      newGenderController),
                  inputStyleSave("İsim", "Lütfen ad ve soyadınızı giriniz.",
                      newNameController),
                  SizedBox(height: 25),
                  Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        saveUsers();
                      },
                      child: Text(
                        "KAYDET",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message,
                    style: TextStyle(color: Colors.grey),
                  ),
                ]));
              });
        },
      ),
    );
  }
}
