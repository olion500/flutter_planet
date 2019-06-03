import 'package:flutter/material.dart';
import 'package:flutter_app/models/planets.dart';
import 'package:flutter_app/text_style.dart';

import 'PlannetSummary.dart';
import 'Separator.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  Container _getBackground() {
    return new Container(
      child: new Image.network(planet.picture,
      fit: BoxFit.cover,
      height: 300.0,),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0)
        )
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(planet, horizontal: false,),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle, style: Style.headerTextStyle,),
              new Separator(),
              new Text(planet.description, style: Style.commonTextStyle,)
            ],
          ),
        )
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ),
      child: new BackButton(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(planet.name),
//            new Hero(tag: "planet-hero-${planet.id}",
//              child: new Image.asset(planet.image, width: 96.0, height: 96.0,),)
//          ],
//        )
      )
    );
  }
}


