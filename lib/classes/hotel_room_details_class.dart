class HotelRoomDetailsClass {
  String title;
  String beds;
  String view;
  String image;
  String price;


  HotelRoomDetailsClass(
      {required this.title,
      required this.beds,
      required this.view,
      required this.image,
      required this.price});
  // HotelDetailsM(this.title, String beds,String view, String image, int price);
}

List<HotelRoomDetailsClass> details = [
  HotelRoomDetailsClass(
      title: 'Deluxe Room - 2 Twin Beds - Atrium View',
      beds: '2 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/image/png/room3.png',
      price: '2200'),
  HotelRoomDetailsClass(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/image/png/room4.png',
      price: '3000'),
  HotelRoomDetailsClass(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/image/png/room1.png',
      price: '1200'),
  HotelRoomDetailsClass(
      title: 'Deluxe Room - 1 Twin Beds - Atrium View',
      beds: '1 Twin Beds',
      view: 'Partial Sea View',
      image: 'assets/image/png/room2.png',
      price: '2000'),
];
