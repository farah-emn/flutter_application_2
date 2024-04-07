class HotelInfoModel {
  String name;
  String stars;
  String street;
  String image;
  HotelInfoModel(
      {required this.name,
      required this.stars,
      required this.street,
      required this.image});
}

List<HotelInfoModel> hotelInfo = [
  HotelInfoModel(
      name: "The Peninsula Ahanghai",
      stars: '5',
      street: "King Fahd Rd",
      image: "assets/image/png/hotel1.jpg"),
  HotelInfoModel(
      name: "Royal Cliff Beach ",
      stars: '4',
      street: "King Salman Rd",
      image: "assets/image/png/hotel2.jpg"),
  HotelInfoModel(
      name: "Crown Towers Perth Hotel",
      stars: '5',
      street: "King AbdAllah Rd",
      image: "assets/image/png/hotel3.jpg"),
  HotelInfoModel(
      name: "Hayat Regeny Malta opens",
      stars: '3',
      street: "King AbdAllah Rd",
      image: "assets/image/png/hotel4.jpg"),
];
