import 'dart:math';

import 'package:covid19turkey/constant.dart';
import 'package:covid19turkey/models/covid_model_list.dart';
import 'package:covid19turkey/stores/covid_store/corona_news_store/corona_news_store.dart';
import 'package:covid19turkey/stores/covid_store/covid_store.dart';
import 'package:covid19turkey/ui/info/info_screen.dart';
import 'package:covid19turkey/utils/locale/app_localization.dart';
import 'package:covid19turkey/widgets/mw_widgets/mw_counter.dart';
import 'package:covid19turkey/widgets/mw_widgets/mw_header.dart';
import 'package:covid19turkey/widgets/mw_widgets/news_card.dart';
import 'package:covid19turkey/widgets/mw_widgets/symptom_card.dart';
import 'package:covid19turkey/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final controller = ScrollController();
  double offset = 0;
  Future<CovidModelList> futureCovid;
  CovidStore _covidStore;
  CoronaNewsStore _coronaNewsStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _covidStore = Provider.of<CovidStore>(context);
    if (!_covidStore.loadingCovid) {
      _covidStore.getCovidList();
    }
    _coronaNewsStore = Provider.of<CoronaNewsStore>(context);
    if (!_coronaNewsStore.loadingCoronaNews) {
      _coronaNewsStore.getCoronaNewsList();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
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
        body: Stack(
          children: <Widget>[
            Observer(builder: (context) {
              return _covidStore.successCovid
                  ? ListView(
                      children: <Widget>[
                        MyHeader(
                            image: "assets/icons/Drcorona.svg",
                            textTop: "Tek ihtiyacın",
                            textBottom: "evde kalmak.",
                            offset: offset,
                            buttonText: 'Detay',
                            whenPress: () {
                              Navigator.pushNamed(context, '/info_screen');
                            }),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Güncel Durum\n",
                                          style: kTitleTextstyle,
                                        ),
                                        TextSpan(
                                          text: "Son güncelleme 19 Haziran",
                                          style: TextStyle(
                                            color: kTextLightColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.refresh,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _covidStore.getCovidList();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
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
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Counter(
                                          color: kInfectedColor,
                                          number: _covidStore
                                              .covidModelList.covidModelList
                                              .where((element) =>
                                                  element.country == 'Turkey')
                                              .first
                                              .newCases,
                                          title: "Vaka Sayısı",
                                        ),
                                        Counter(
                                          color: kDeathColor,
                                          number: _covidStore
                                              .covidModelList.covidModelList
                                              .where((element) =>
                                                  element.country == 'Turkey')
                                              .first
                                              .newDeaths,
                                          title: "Vefat Sayısı",
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Counter(
                                      color: kRecovercolor,
                                      number: _covidStore
                                          .covidModelList.covidModelList
                                          .where((element) =>
                                              element.country == 'Turkey')
                                          .first
                                          .totalRecovered,
                                      title: "Toplam İyileşen Sayısı",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Ülkelere Göre Dağılım",
                                    style: kTitleTextstyle,
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "İstatistikler",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/detail_cities');
                                    },
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(20),
                                height: 178,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 30,
                                      color: kShadowColor,
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/country_map.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Covid-19 Haberleri",
                                    style: kTitleTextstyle,
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              Observer(builder: (context) {
                                return _coronaNewsStore.successCoronaNews
                                    ? Container(
                                        margin: EdgeInsets.only(top: 20),
                                        padding: EdgeInsets.all(20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 30,
                                              color: kShadowColor,
                                            ),
                                          ],
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: <Widget>[
                                              NewsCard(
                                                image: _coronaNewsStore
                                                    .coronaNewsModelList
                                                    .coronaNewsModelList[0]
                                                    .image,
                                                title: _coronaNewsStore
                                                    .coronaNewsModelList
                                                    .coronaNewsModelList[0]
                                                    .name,
                                                desc: _coronaNewsStore
                                                    .coronaNewsModelList
                                                    .coronaNewsModelList[0]
                                                    .description,
                                                source: _coronaNewsStore
                                                    .coronaNewsModelList
                                                    .coronaNewsModelList[0]
                                                    .source,
                                                url: _coronaNewsStore
                                                    .coronaNewsModelList
                                                    .coronaNewsModelList[0]
                                                    .url,
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              if (_coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList
                                                      .length >
                                                  1)
                                                NewsCard(
                                                  image: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[1]
                                                      .image,
                                                  title: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[1]
                                                      .name,
                                                  desc: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[1]
                                                      .description,
                                                  source: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[1]
                                                      .source,
                                                  url: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[1]
                                                      .url,
                                                ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              if (_coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList
                                                      .length >
                                                  2)
                                                NewsCard(
                                                  image: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[2]
                                                      .image,
                                                  title: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[2]
                                                      .name,
                                                  desc: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[2]
                                                      .description,
                                                  source: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[2]
                                                      .source,
                                                  url: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[2]
                                                      .url,
                                                ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              if (_coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList
                                                      .length >
                                                  3)
                                                NewsCard(
                                                  image: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[3]
                                                      .image,
                                                  title: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[3]
                                                      .name,
                                                  desc: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[3]
                                                      .description,
                                                  source: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[3]
                                                      .source,
                                                  url: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[3]
                                                      .url,
                                                ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              if (_coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList
                                                      .length >
                                                  4)
                                                NewsCard(
                                                  image: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[4]
                                                      .image,
                                                  title: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[4]
                                                      .name,
                                                  desc: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[4]
                                                      .description,
                                                  source: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[4]
                                                      .source,
                                                  url: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[4]
                                                      .url,
                                                ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              if (_coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList
                                                      .length >
                                                  5)
                                                NewsCard(
                                                  image: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[5]
                                                      .image,
                                                  title: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[5]
                                                      .name,
                                                  desc: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[5]
                                                      .description,
                                                  source: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[5]
                                                      .source,
                                                  url: _coronaNewsStore
                                                      .coronaNewsModelList
                                                      .coronaNewsModelList[5]
                                                      .url,
                                                ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : _showErrorMessage(
                                        _covidStore.errorStore.errorMessage);
                              }),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : _showErrorMessage(_covidStore.errorStore.errorMessage);
            }),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _covidStore.loadingCovid,
                  child: CustomProgressIndicatorWidget(),
                );
              },
            ),
          ],
        ),
      ),
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
