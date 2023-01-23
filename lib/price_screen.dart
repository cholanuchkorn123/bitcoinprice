import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livedata_bitcoin/coin_data.dart';
import 'dart:io' show Platform;
import 'components/card.dart';
import 'package:livedata_bitcoin/networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String defualtvalue = 'USD';
  CoinData coinData = CoinData();
  String btcdata = '';
  String ethdata = '';
  String ltcdata = '';
  void getData() async {
    try {
      double btc = await coinData.getDataBtc(defualtvalue);
      double eth = await coinData.getDataEth(defualtvalue);
      double ltc = await coinData.getDataLtc(defualtvalue);
      setState(() {
        btcdata = btc.toStringAsFixed(0);
        ethdata = eth.toStringAsFixed(0);
        ltcdata = ltc.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androiddropdown() {
    List<DropdownMenuItem<String>> dropdownitem = [];
    for (String currency in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        value: currency,
      );
      dropdownitem.add(newitem);
    }
    return DropdownButton<String>(
      value: defualtvalue,
      dropdownColor: Colors.yellow.shade200,
      iconEnabledColor: Colors.black,
      items: dropdownitem,
      onChanged: (value) {
        setState(() {
          getData();
          defualtvalue = value!;
        });
      },
    );
  }

  CupertinoPicker iosdropdown() {
    List<Text> item = [];
    for (String currency in currenciesList) {
      item.add(Text(
        currency,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ));
    }
    return CupertinoPicker(
      children: item,
      backgroundColor: Colors.lime.shade200,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        setState(() {
          defualtvalue = item[value].toString();
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cryptocurrency Price'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                children: [
                  Cardlist(data: btcdata, defualtvalue: defualtvalue,name: 'BTC',),
                  SizedBox(
                    height: 20.0,
                  ),
                  Cardlist(data: ethdata, defualtvalue: defualtvalue,name: 'ETH',),
                  SizedBox(
                    height: 20.0,
                  ),
                  Cardlist(data: ltcdata, defualtvalue: defualtvalue,name: 'LTC',),
                ],
              )),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lime.shade200,
              child: Platform.isIOS ? iosdropdown() : androiddropdown()),
        ],
      ),
    );
  }
}
