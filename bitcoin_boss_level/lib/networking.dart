import "package:http/http.dart" as http;
import "dart:convert";

const api_key = "c7a958ac-f073-4c90-82f9-7b24c6fa6f40";

class Networker{

  String cryptoCurrency;
  String currency;

  Networker({required this.cryptoCurrency, required this.currency});

  Future getData() async {
    Uri url = Uri.parse("https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$currency?apikey=$api_key");

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