class Userlist {
  final String? name;
  final String? phone;
  final String? city;
  final String? town;

  Userlist({this.name, this.phone, this.city, this.town});

  factory Userlist.fromJson(dynamic json) {
    return Userlist(
        name: json['kisi_ad'] as String,
        phone: json['kisi_tel'] as String,
        city: json['city_name'] as String,
        town: json['town_name'] as String);
  }

  static List<Userlist> usersFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Userlist.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Userlist {name: $name, phone: $phone, city: $city, town: $town}';
  }
}

/*class userInfo {
  final String? newMail;
  final String? newPassword;
  final String? newPhone;
  final String? newCity;
  final String? newTown;
  final String? newGender;
  final String? newName;

  userInfo(
      {this.newMail,
      this.newPassword,
      this.newPhone,
      this.newCity,
      this.newTown,
      this.newGender,
      this.newName});

  factory userInfo.fromJson(dynamic json) {
    return userInfo(
        newMail: json['email'] as String,
        newPassword: json['sifre'] as String,
        newPhone: json['kisi_tel'] as String,
        newCity: json['city_id'] as String,
        newTown: json['town_name'] as String,
        newGender: json['cinsiyet'] as String,
        newName: json['kisi_ad'] as String);
  }
}*/
