import 'package:flutter/material.dart';

import 'PlannetSummary.dart';
import 'models/planets.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Container(
          color: new Color(0xFF736AB7),
          child: new ListView.builder(
            itemBuilder: (context, index) => new PlanetSummary(planets[index]),
            itemCount: planets.length,
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
        )
    );
  }
}

