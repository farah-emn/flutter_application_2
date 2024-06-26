// ignore_for_file: non_constant_identifier_names
class PassengerAdultDetailsClass {
  final String Firstname;
  final String Lastname;
  final String Nationality;
  final String birthDate;
  final String bookingid;
  final String issuingCountryPassport;
  final String PassportNumber;
  final String Gender;
  final String ExpirationDatePassport;

  PassengerAdultDetailsClass(
      {required this.Firstname,
      required this.Lastname,
      required this.Nationality,
      required this.birthDate,
      required this.bookingid,
      required this.issuingCountryPassport,
      required this.PassportNumber,
      required this.Gender,
      required this.ExpirationDatePassport});

  factory PassengerAdultDetailsClass.fromMap(Map<dynamic, dynamic> map) {
    return PassengerAdultDetailsClass(
      Firstname: map['Firstname'] is String ? map['Firstname'] : '',
      Lastname: map['Lastname'] is String ? map['Lastname'] : '',
      birthDate: map['birthDate'] is String ? map['birthDate'] : '',
      Nationality: map['Nationality'] is String ? map['Nationality'] : '',
      bookingid: map['bookingid'] is String ? map['bookingid'] : '',
      issuingCountryPassport: map['issuingCountryPassport'] is String
          ? map['issuingCountryPassport']
          : '',
      PassportNumber:
          map['PassportNumber'] is String ? map['PassportNumber'] : '',
      Gender: map['Gender'] is String ? map['Gender'] : '',
      ExpirationDatePassport: map['ExpirationDatePassport'] is String
          ? map['ExpirationDatePassport']
          : '',
    );
  }
}
