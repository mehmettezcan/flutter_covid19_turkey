import 'package:covid19turkey/constant.dart';
import 'package:covid19turkey/widgets/mw_widgets/mw_header.dart';
import 'package:covid19turkey/widgets/mw_widgets/prevent_card.dart';
import 'package:covid19turkey/widgets/mw_widgets/symptom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
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
        body: ListView(
          children: <Widget>[
            MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Covid-19 Hakında",
                textBottom: "Bilgilendirme",
                offset: offset,
                buttonText: 'Geri',
                whenPress: () {
                  Navigator.pushNamed(context, '/home');
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Belirtiler",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Baş ağrısı",
                          isActive: true,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SymptomCard(
                          image: "assets/images/cough.jpg",
                          title: "Öksürük",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Ateş",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SymptomCard(
                          image: "assets/images/breath.gif",
                          title: "Nefes Darlığı",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Önlemler", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                        "Öksürme veya hapşırma sırasında burun ve ağız tek kullanımlık kağıt mendil ile örtülmeli, kağıt mendilin bulunmadığı durumlarda ise dirsek içi kullanılmalı, mümkünse kalabalık yerlere girilmemeli, eğer girmek zorunda kalınıyorsa ağız ve burun kapatılmalı, tıbbi maske kullanılmalıdır.",
                    image: "assets/images/wear_mask.png",
                    title: "Maske Takın",
                  ),
                  PreventCard(
                    text:
                        "Eller en az 20 saniye boyunca sabun ve suyla yıkanmalı, sabun ve suyun olmadığı durumlarda alkol bazlı el antiseptiği kullanılmalıdır. Antiseptik veya antibakteriyel içeren sabun kullanmaya gerek yoktur, normal sabun yeterlidir.",
                    image: "assets/images/wash_hands.png",
                    title: "Ellerinizi yıkayın",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
