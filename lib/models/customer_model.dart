class Customer {
  String phoneNumber;
  String email;
  List<Tourist>? tourists;

  Customer({
    required this.phoneNumber,
    required this.email,
    this.tourists
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;

    if (this.tourists != null) {
      data['tourists'] = this.tourists!.map((t) => t.toJson()).toList();
    }

    return data;
  }
}

class Tourist {
  int id;
  String? name;
  String? surname;
  String? dateBirthday;
  String? citizenship;
  int? passportNumber;
  String? datePassportStop;

  Tourist({
    required this.id,
    this.name,
    this.surname,
    this.dateBirthday,
    this.citizenship,
    this.passportNumber,
    this.datePassportStop
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = this.name;
    data['surname'] = this.surname;
    data['date_birthday'] = this.dateBirthday;
    data['citizenship'] = this.citizenship;
    data['passport_number'] = this.passportNumber;
    data['date_passport_stop'] = this.dateBirthday;

    return data;
  }
}