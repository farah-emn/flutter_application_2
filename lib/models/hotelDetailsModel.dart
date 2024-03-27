class HotelDetailsModel {
  String title;
  String beds;
  String view;
  String image;
  String price;

  HotelDetailsModel(
      {required this.title,
      required this.beds,
      required this.view,
      required this.image,
      required this.price});
  // HotelDetailsM(this.title, String beds,String view, String image, int price);
}

List<HotelDetailsModel> details = [
  HotelDetailsModel(
      title: 'Deluxe Room - 2 Twin Beds - Atrium View',
      beds: '2 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/room3.png',
      price: '2200'),
  HotelDetailsModel(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/room4.png',
      price: '3000'),
      HotelDetailsModel(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/room1.png',
      price: '1200'),
      HotelDetailsModel(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/room2.png',
      price: '2000'),
];
