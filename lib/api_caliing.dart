
import 'json_parsing.dart';



class WeatherModel {
  Future<dynamic> getCityWeather() async {
    var url1 = 'http://api.plos.org/search?q=title:india';
    Networking networking = Networking(url: url1);
    var weatherData = await networking.getData();
    List<Users> users=[];
    for(var u in weatherData["response"]["docs"].length){
      Users user=Users(index: u,id: weatherData["response"]["docs"][u]["id"],abstract: weatherData["response"]["docs"][u]["abstract"],journal: weatherData["response"]["docs"][u]["journal"],publication_date: weatherData["response"]["docs"][u]["publication_date"],article_type: weatherData["response"]["docs"][u]["article_type"],author_display: weatherData["response"]["docs"][u]["author_display"],title_display: weatherData["response"]["docs"][u]["title_display"],score: weatherData["response"]["docs"][u]["score"]);

      users.add(user);
    }


    return users;
  }
}

class Users {
  Users({this.index,this.title_display,this.publication_date,this.id,this.abstract,this.article_type,this.author_display,this.journal,this.score});
  final int index;
  final String title_display;
  final String publication_date;
  final String id;
  final String journal;
  final String article_type;
  final String author_display;
  final int score;
  final String abstract;




}