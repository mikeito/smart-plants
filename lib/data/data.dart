import 'package:smart_plants_app/models/models.dart';

///
///List of all News
///
final List<NewsModel> newsModel = [
  NewsModel(
    picture: 'assets/images/man.jpg',
    title: 'Sustainable crops',
  ),
  NewsModel(
    picture: 'assets/images/woman.jpg',
    title: 'Farm Caring',
  ),
];

///
///List of all ENGINEERS
///
final List<EngineersModel> engineersData = [
  EngineersModel(
    name: 'Mr. Olivier Jerome',
    email: 'jerome@gmail.com',
    years_experience: '07',
    image: 'assets/images/man.jpg',
    country: 'Cameroon',
    sex: 'Male',
    connected: true,
  ),
  EngineersModel(
    name: 'Mme. Madi Danielle',
    email: 'danielle@gmail.com',
    years_experience: '05',
    image: 'assets/images/woman.jpg',
    country: 'Cameroon',
    sex: 'female',
    connected: false,
  ),
];

///
///List of all months
///

final List<MonthsModel> monthData = [
  MonthsModel(name: 'jan', selected: true),
  MonthsModel(name: 'feb', selected: false),
  MonthsModel(name: 'mar', selected: false),
  MonthsModel(name: 'apr', selected: false),
  MonthsModel(name: 'may', selected: false),
  MonthsModel(name: 'jun', selected: false),
  MonthsModel(name: 'jui', selected: false),
  MonthsModel(name: 'aug', selected: false),
  MonthsModel(name: 'sep', selected: false),
  MonthsModel(name: 'oct', selected: false),
  MonthsModel(name: 'nov', selected: false),
  MonthsModel(name: 'dec', selected: false),
];
