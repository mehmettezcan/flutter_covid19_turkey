import 'package:covid19turkey/constant.dart';
import 'package:flutter/material.dart';

class PreventCard extends StatefulWidget {
  final String image;
  final String title;
  final String text;

  const PreventCard({Key key, this.image, this.title, this.text})
      : super(key: key);

  @override
  _PreventCardState createState() =>
      _PreventCardState(this.image, this.title, this.text);
}

class _PreventCardState extends State<PreventCard> {
  final String image;
  final String title;
  final String text;

  _PreventCardState(
    this.image,
    this.title,
    this.text,
  );

  bool isClick = false;
  double height;

  @override
  Widget build(BuildContext context) {
    if (isClick) {
      height = 300.0;
    } else {
      height = 150.0;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isClick = !isClick;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: height,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor,
                    ),
                  ],
                ),
              ),
              Image.asset(image),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: height,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: isClick ? 12 : 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: isClick
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.blueAccent,
                              )
                            : Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.blueAccent,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
