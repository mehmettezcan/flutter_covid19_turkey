import 'package:covid19turkey/constant.dart';
import 'package:covid19turkey/stores/covid_store/continent_data_model/continent_data_store.dart';
import 'package:covid19turkey/stores/covid_store/total_data_store/total_data_store.dart';
import 'package:covid19turkey/utils/locale/app_localization.dart';
import 'package:covid19turkey/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class StatisticsContinent extends StatefulWidget {
  @override
  _StatisticsContinentState createState() => _StatisticsContinentState();
}

class _StatisticsContinentState extends State<StatisticsContinent> {
  final controller = ScrollController();
  double offset = 0;
  ContinentDataStore _continentDataStore;
  bool continentHeight = true;
  bool totalDataHeight = true;
  TotalDataStore _totalDataStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _continentDataStore = Provider.of<ContinentDataStore>(context);
    if (!_continentDataStore.loadingContinentData) {
      _continentDataStore.getContinentDataList();
    }
    _totalDataStore = Provider.of<TotalDataStore>(context);
    if (!_totalDataStore.loadingTotalData) {
      _totalDataStore.getTotalDataList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Observer(builder: (context) {
          return _continentDataStore.successContinentData
              ? ListView(
                  padding: const EdgeInsets.all(15.0),
                  children: <Widget>[
                    Observer(builder: (context) {
                      return _totalDataStore.successTotalData
                          ? Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      totalDataHeight = !totalDataHeight;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Dünya istatistikleri\n",
                                                style: kTitleTextstyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        totalDataHeight
                                            ? Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.blueAccent,
                                              )
                                            : Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.blueAccent,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: totalDataHeight
                                      ? MediaQuery.of(context).size.height *
                                          0.25
                                      : MediaQuery.of(context).size.height * 0,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 30,
                                        color: kShadowColor,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Toplam Vaka Sayısı:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kInfectedColor,
                                              ),
                                            ),
                                            Text(
                                              _totalDataStore
                                                  .totalDataModel.totalCases,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: kInfectedColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Toplam Vefat Sayısı:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kDeathColor,
                                              ),
                                            ),
                                            Text(
                                              _totalDataStore
                                                  .totalDataModel.totalDeaths,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: kDeathColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Toplam İyileşen Sayısı:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: kRecovercolor,
                                              ),
                                            ),
                                            Text(
                                              _totalDataStore.totalDataModel
                                                  .totalRecovered,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: kRecovercolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : _showErrorMessage(
                              _totalDataStore.errorStore.errorMessage);
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          continentHeight = !continentHeight;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Kıtalara göre istatistikler\n",
                                    style: kTitleTextstyle,
                                  ),
                                ],
                              ),
                            ),
                            continentHeight
                                ? Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Colors.blueAccent,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.blueAccent,
                                  )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        height: continentHeight
                            ? MediaQuery.of(context).size.height * 0.5
                            : MediaQuery.of(context).size.height * 0,
                        child: ListView.builder(
                            itemCount: _continentDataStore
                                .continentDataModelList
                                .continentDataModelList
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        _continentDataStore
                                            .continentDataModelList
                                            .continentDataModelList[index]
                                            .continent,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: kBodyTextColor,
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Bugünkü Vaka Sayısı:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kInfectedColor,
                                            ),
                                          ),
                                          Text(
                                            _continentDataStore
                                                .continentDataModelList
                                                .continentDataModelList[index]
                                                .newCases,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kInfectedColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Bugünkü Vefat Sayısı:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kDeathColor,
                                            ),
                                          ),
                                          Text(
                                            _continentDataStore
                                                .continentDataModelList
                                                .continentDataModelList[index]
                                                .newDeaths,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kDeathColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Toplam Vefat Sayısı:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kDeathColor,
                                            ),
                                          ),
                                          Text(
                                            _continentDataStore
                                                .continentDataModelList
                                                .continentDataModelList[index]
                                                .totalDeaths,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kDeathColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Toplam İyileşen Sayısı:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kRecovercolor,
                                            ),
                                          ),
                                          Text(
                                            _continentDataStore
                                                .continentDataModelList
                                                .continentDataModelList[index]
                                                .totalRecovered,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kRecovercolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Toplam Vaka Sayısı:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kInfectedColor,
                                            ),
                                          ),
                                          Text(
                                            _continentDataStore
                                                .continentDataModelList
                                                .continentDataModelList[index]
                                                .totalCases,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kInfectedColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            })),
                  ],
                )
              : _showErrorMessage(_continentDataStore.errorStore.errorMessage);
        }),
        Observer(
          builder: (context) {
            return Visibility(
              visible: _continentDataStore.loadingContinentData,
              child: CustomProgressIndicatorWidget(),
            );
          },
        ),
      ],
    );
  }

  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null && message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });
    return SizedBox.shrink();
  }
}
