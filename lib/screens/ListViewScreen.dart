import 'dart:convert';

import 'package:assignment/bloc_pkg/UniversalBloc_Bloc.dart';
import 'package:assignment/bloc_pkg/UniversalBloc_Event.dart';
import 'package:assignment/bloc_pkg/UniversalBloc_State.dart';
import 'package:assignment/models/ResponseModel.dart';
import 'package:assignment/utils/MyConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewScreen();
  }
}

class _ListViewScreen extends State<ListViewScreen> {
  UniversalBloc Bloc;
  List<ResponseModel> _responseModel = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Bloc = UniversalBloc();
    Bloc.add(FetchDataBlocEvt());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener(
      bloc: Bloc,
      listener: (context, state) {
        if (state is NoInternet) {
          Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Check your Network Connection",
              style: TextStyle(color: Colors.white),
            ),
          ));
          setState(() {
            MyConstants.hideLoadingBar();
          });
        }
        if (state is Loading) {
          setState(() {
            MyConstants.showLoadingBar(context);
          });
        }
        if (state is UniversalBlocFailed) {
          setState(() {
            MyConstants.hideLoadingBar();
          });
        }
        if (state is FetchDataSuccessfullyState) {
          setState(() {
            MyConstants.hideLoadingBar();
            print(state.responseModel.length);
            _responseModel = state.responseModel;
          });
        }
      },
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _responseModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                MyConstants.responseModel=_responseModel[index];
                Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[

                       SizedBox(
                         height: 200,
                         width: double.infinity,
                         child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: _responseModel[index].url,
                          placeholder: (context, url) =>
                              CupertinoActivityIndicator(
                                radius: 30,
                              ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                       ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            _responseModel[index].title.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    Bloc.dispose();
    super.dispose();
  }
}
