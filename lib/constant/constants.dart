class Constants {


  static const APIKEY = "76d1960eb3924bf1a0a2fa18e3747e62";
  static const TOPHEADLINES = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$APIKEY";


  static String headliensFor(String country) {


    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$APIKEY';

  }


  static const Map<String, String> Countries = {

    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'Nigeria': 'ng'


  };



}