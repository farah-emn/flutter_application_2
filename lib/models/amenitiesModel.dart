class AmenitiesModel {
  String image;
  String title;

  AmenitiesModel({required this.image, required this.title});
}
List<AmenitiesModel> Amenities = [
  AmenitiesModel(image:'assets/pool.png', title:'Pool'),
  AmenitiesModel(image:'assets/services.png', title:'Services'),
  AmenitiesModel(image:'assets/internet.png', title:'Internet'),
  AmenitiesModel(image:'assets/parking.png', title:'Parking'),
  AmenitiesModel(image:'assets/beauty.png', title:'Beauty'),
  AmenitiesModel(image:'assets/internet.png', title:'Internet'),

];