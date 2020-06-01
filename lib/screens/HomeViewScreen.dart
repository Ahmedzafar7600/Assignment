import 'package:assignment/screens/ListViewScreen.dart';
import 'package:assignment/utils/MyAssets.dart';
import 'package:assignment/utils/MyConstants.dart';
import 'package:assignment/widgets/MyMap.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

const String mapPin = 'feature1',
    search = 'feature2',
    setting = 'feature3',
    list = 'feature4';

class HomeViewScreen extends StatefulWidget {
  @override
  _HomeViewScreen createState() => _HomeViewScreen();
}

class _HomeViewScreen extends State<HomeViewScreen> {
  //check for mapview and listview screen
  bool checkFormap = true;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{mapPin, list, setting, search},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Beedyo'.toUpperCase(),
            style: TextStyle(
                color: MyConstants.red_color,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          leading: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                MyAssets.side_drawer,
              )),
          actions: <Widget>[
            DescribedFeatureOverlay(
              featureId: search,
              tapTarget: SvgPicture.asset(
                MyAssets.search,
              ),
              backgroundColor: MyConstants.red_color,
              contentLocation: ContentLocation.below,
              title: Text(
                "Search",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Search for any specific Pitch.Search can be Performed Using:',
                      style: TextStyle(color: Colors.white)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,
                          color: Colors.white, size: 10),
                      Text('Pitch Title', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,
                          color: Colors.white, size: 10),
                      Text('Creator Name',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.white,
                        size: 10,
                      ),
                      Text('Location', style: TextStyle(color: Colors.white))
                    ],
                  )
                ],
              ),
              child: SvgPicture.asset(
                MyAssets.search,
              ),
            ),
            DescribedFeatureOverlay(
              featureId: setting,
              tapTarget: SvgPicture.asset(
                MyAssets.filters,
              ),
              backgroundColor: MyConstants.red_color,
              contentLocation: ContentLocation.below,
              title: Text(
                "Filters",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Use This Option to filter pitches.Pitches can be filtered based on:',
                      style: TextStyle(color: Colors.white)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,
                          color: Colors.white, size: 10),
                      Text('Category', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,
                          color: Colors.white, size: 10),
                      Text('Rating', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,
                          color: Colors.white, size: 10),
                      Text('Price', style: TextStyle(color: Colors.white))
                    ],
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: SvgPicture.asset(
                  MyAssets.filters,
                ),
              ),
            ),
            DescribedFeatureOverlay(
              featureId: list,
              tapTarget: SvgPicture.asset(
                MyAssets.list_view,
              ),
              backgroundColor: MyConstants.red_color,
              contentLocation: ContentLocation.below,
              title: Text(
                "Switch View",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              description: Text(
                  'Tap Here To Switch Between Map View and ListView to view pitches close to you.'),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(checkFormap){
                      checkFormap = false;
                    }
                    else{
                      checkFormap = true;
                    }

                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset(
                    MyAssets.list_view,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: checkFormap != true
            ? ListViewScreen()
            : Stack(
                children: <Widget>[
                  MyMap(),
                  DescribedFeatureOverlay(
                    featureId: mapPin,
                    tapTarget: Icon(
                      Icons.pin_drop,
                      color: MyConstants.red_color,
                    ),
                    backgroundColor: MyConstants.red_color,
                    contentLocation: ContentLocation.below,
                    title: Text(
                      "Map Pins",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    description: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            'Each Of These Pin Mark the Location of a Pitch near you. Tapping on them will show you some basic Information'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Pitch",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Text(
                            'Each Of These Pin Mark the Location of a Pitch near you. Tapping on them will show you some basic Information')
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Card(
                          color: MyConstants.red_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Icon(Icons.navigation),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
