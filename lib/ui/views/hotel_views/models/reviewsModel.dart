class ReviewsModel {
  String name, comment, date;
  ReviewsModel({required this.comment, required this.date, required this.name});
}

List<ReviewsModel> reviewsList = [
  ReviewsModel(
      comment: 'Very nice hotel, i will come again',
      date: '2023/5/21',
      name: 'farah'),
  ReviewsModel(
      comment: 'Very good services', date: '2024/6/10', name: 'tala'),
];
