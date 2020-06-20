import 'package:covid19turkey/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final String source;
  final String url;

  const NewsCard(
      {Key key, this.image, this.title, this.desc, this.source, this.url})
      : super(key: key);

  @override
  _NewsCardState createState() =>
      _NewsCardState(this.image, this.title, this.desc, this.source, this.url);
}

class _NewsCardState extends State<NewsCard> {
  final String image;
  final String title;
  final String desc;
  final String source;
  final String url;

  _NewsCardState(
    this.image,
    this.title,
    this.desc,
    this.source,
    this.url,
  );

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Image.network(image, height: 100),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            desc,
            maxLines: isClick ? 20 : 4,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(isClick
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    isClick = !isClick;
                  });
                },
              ),
              FlatButton(
                child: Text(
                  '$source',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () async {
                  String urlNew = url.toString();
                  if (await canLaunch(urlNew)) {
                    await launch(urlNew);
                  } else {
                    throw '$urlNew Aranamadı!';
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
