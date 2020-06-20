import 'package:covid19turkey/stores/covid_store/total_data_store/total_data_store.dart';
import 'package:covid19turkey/ui/detail_cities/statistic_continent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CitiesDetail extends StatefulWidget {
  @override
  _CitiesDetailState createState() => _CitiesDetailState();
}

class _CitiesDetailState extends State<CitiesDetail> {
  final controller = ScrollController();
  double offset = 0;
  TotalDataStore _totalDataStore;
  bool continentHeight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _totalDataStore = Provider.of<TotalDataStore>(context);
    if (!_totalDataStore.loadingTotalData) {
      _totalDataStore.getTotalDataList();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('Uygulamadan çıkmak istediğinize emin misiniz?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: new Text('Evet'),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Hayır'),
                  ),
                ],
              ),
            )) ??
            false;
      },
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      label: Text('Geri Git')),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail_cities');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Yenile',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.black,
                        )
                      ],
                    ),
                    /*color: Colors.purple,*/
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: StatisticsContinent(),
            ),
          ],
        )),
      ),
    );
  }
}
