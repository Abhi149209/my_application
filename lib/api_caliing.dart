
import 'json_parsing.dart';



class WeatherModel {
  Future<dynamic> getCityWeather() async {
    var url1 = 'http://api.plos.org/search?q=title:india';
    Networking networking = Networking(url: url1);
    var weatherData = await networking.getData();
    List<Users> users=[];
    for(var u in weatherData["docs"].length){
      Users user=Users(index: u,id: weatherData["docs"][u]["id"],abstract: weatherData["docs"][u]["abstract"],journal: weatherData["docs"][u]["journal"],publication_date: weatherData["docs"][u]["publication_date"],article_type: weatherData["docs"][u]["article_type"],author_display: weatherData["docs"][u]["author_display"],title_display: weatherData["docs"][u]["title_display"],score: weatherData["docs"][u]["score"]);
      print(user.publication_date);
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