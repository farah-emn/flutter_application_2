// ignore_for_file: non_constant_identifier_names

// class PassengerAdultDetailsClass {
//   final String FirstName;
//   final String LasrName;
//   final String Nationality;
//   final String birthDate;

//   PassengerAdultDetailsClass({
//     required this.FirstName,
//     required this.LasrName,
//     required this.Nationality,
//     required this.birthDate,
//   });
//   factory PassengerAdultDetailsClass.fromMap(Map<dynamic, dynamic> map) {
//     return PassengerAdultDetailsClass(
//       FirstName: map['First name'] is String ? map['First name'] : '',
//       LasrName: map['Last name'] is String ? map['Last name'] : '',
//       birthDate: map['birthDate'] is String ? map['birthDate'] : '',
//       Nationality: map['birthDate'] is String ? map['birthDate'] : '',

//     );
//   }
// }
// class ContactDetailsPassengerDetailsClass {
//   // final String Firstname;
//   // final String Lastname;
//   final String firstname;
//   // final String? birthDate; // Make birthDate nullable
//   // final String bookingid;

//   ContactDetailsPassengerDetailsClass({
//     // required this.Firstname,
//     // required this.Lastname,
//     required this.firstname,
//     // this.birthDate, // birthDate is now optional
//     // required this.bookingid,
//   });

//   factory ContactDetailsPassengerDetailsClass.fromMap(
//       Map<dynamic, dynamic> map) {
//     return ContactDetailsPassengerDetailsClass(
//       // Firstname: map['Firstname'] is String ? map['Firstname'] : '',
//       // Lastname: map['Lastname'] is String ? map['Lastname'] : '',
//       // birthDate: map['birthDate'] is String
//       //     ? map['birthDate']
//       //     : null, // Use null if birthDate is not available
//       firstname: map['firstname'] is String ? map['firstname'] : '',
//       // bookingid: map['bookingid'] is String ? map['bookingid'] : '',
//     );
//   }
//}
class ContactDetailsPassengerDetailsClass {
  final String firstname;
  final String lastname;
  final String Email;
  final String mobilenumber;
  final String bookingId;
  final String flightId;

  ContactDetailsPassengerDetailsClass(
      {required this.firstname,
      required this.lastname,
      required this.Email,
      required this.mobilenumber,
      required this.bookingId,
      required this.flightId});

  factory ContactDetailsPassengerDetailsClass.fromMap(
      Map<dynamic, dynamic> map) {
    return ContactDetailsPassengerDetailsClass(
      firstname: map['firstname'] is String ? map['firstname'] : '',
      Email: map['Email'] is String ? map['Email'] : '',
      mobilenumber: map['mobilenumber'] is String ? map['mobilenumber'] : '',
      bookingId: map['bookingId'] is String ? map['bookingId'] : '',
      lastname: map['lastname'] is String ? map['lastname'] : '',
      flightId: map['flightId'] is String ? map['flightId'] : '',
    );
  }
}
