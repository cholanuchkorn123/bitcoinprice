import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'networking.dart';

const baseUrl = 'rest.coinapi.io';
final apikey = dotenv.env['apikey'];
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getDataBtc(String currency) async {
    var urlBtc =
        Uri.http(baseUrl, 'v1/exchangerate/BTC/$currency/', {'apikey': apikey});
    print(urlBtc);
    Networkhelper networkhelperBtc = Networkhelper(url: urlBtc);
    var weatherdata = await networkhelperBtc.getData();

    return weatherdata;
  }

  Future<dynamic> getDataEth(String currency) async {
    var urlEth =
        Uri.http(baseUrl, 'v1/exchangerate/ETH/$currency/', {'apikey': apikey});

    Networkhelper networkhelperEth = Networkhelper(url: urlEth);
    var weatherdata = await networkhelperEth.getData();

    return weatherdata;
  }

  Future<dynamic> getDataLtc(String currency) async {
    var urlLtc =
        Uri.http(baseUrl, 'v1/exchangerate/LTC/$currency/', {'apikey': apikey});
    print(urlLtc);
    Networkhelper networkhelperLtc = Networkhelper(url: urlLtc);
    var weatherdata = await networkhelperLtc.getData();

    return weatherdata;
  }
}
