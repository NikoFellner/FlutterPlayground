import 'package:http/http.dart' as http;
import "dart:convert";

class NetworkHelper {

  Uri url;

  NetworkHelper({required Uri this.url});

 Future getData() async {
    http.Response httpResponse = await http.get(url);

    if (httpResponse.statusCode == 200){
      String jsonData = httpResponse.body;

      var decodedJSONData = jsonDecode(jsonData);

      return decodedJSONData;
    } else{
      print(httpResponse.statusCode);
    }
  }
}