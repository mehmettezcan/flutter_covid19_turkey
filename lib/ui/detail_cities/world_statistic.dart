import 'package:covid19turkey/constant.dart';
import 'package:covid19turkey/stores/covid_store/total_data_store/total_data_store.dart';
import 'package:covid19turkey/ui/detail_cities/detail_cities.dart';
import 'package:covid19turkey/utils/locale/app_localization.dart';
import 'package:covid19turkey/widgets/mw_widgets/mw_counter.dart';
import 'package:covid19turkey/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class WorldStatistic extends StatefulWidget {
  @override
  _WorldStatisticState createState() => _WorldStatisticState();
}

class _WorldStatisticState extends State<WorldStatistic> {
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Observer(builder: (context) {
              return _totalDataStore.successTotalData
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
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
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number:
                                    _totalDataStore.totalDataModel.totalCases,
                                title: "Toplam Vaka Sayısı",
                              ),
                              Counter(
                                color: kDeathColor,
                                number:
                                    _totalDataStore.totalDataModel.totalDeaths,
                                title: "Toplam Vefat Sayısı",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Counter(
                            color: kRecovercolor,
                            number:
                                _totalDataStore.totalDataModel.totalRecovered,
                            title: "Toplam İyileşen Sayısı",
                          ),
                        ],
                      ),
                    )
                  : _showErrorMessage(_totalDataStore.errorStore.errorMessage);
            }),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _totalDataStore.loadingTotalData,
                  child: CustomProgressIndicatorWidget(),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => CitiesDetail(),
                    ),
                  );
                },
              ),
            )
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
