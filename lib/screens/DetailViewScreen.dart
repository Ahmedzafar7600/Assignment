import 'package:assignment/utils/MyConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailViewScreen();
  }
}
class _DetailViewScreen extends State<DetailViewScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            CarouselSlider(
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              initialPage: 0,
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                         fit:BoxFit.cover,
                          imageUrl:MyConstants.responseModel.url,
                          placeholder: (context, url) =>
                              CupertinoActivityIndicator(
                                radius: 30,
                              ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Divider(
                height: 1,
                color: Colors.black,
              ),
            ),
            Text(MyConstants.responseModel.title.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            SizedBox(
              height: 10,
            ),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
            GestureDetector(
                child: Text("Click here to Find Detail", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                onTap: () {
                  launch(
                    MyConstants.responseModel.url,
                    forceSafariVC: false,
                    forceWebView: false,
                  );
                 // _launchInBrowser(MyConstants.responseModel.url);
                }
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


}
