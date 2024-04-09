import 'package:flutter/material.dart';
import 'package:wemap_sdk_flutter/wemap_sdk_flutter.dart';

void main() {
  runApp(const MyHomePage(
    title: 'wemap sample',
  ));
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  void _onMapReady(MapData mapData, MapManager livemapManager) {
    // what ever to do, the map is ready
  }

  void _onBuildingFocusChanged(Building? building) {
    // print("on Building focus changed");
  }

  void _onActiveLevelChanged(Building building, Level level) {
    // print("on active level changed");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Container(
                constraints: const BoxConstraints.expand(),
                child: WemapMap(
                  options: MapOptions(
                      mapID: 25669, token: "", environment: Environment.PROD),
                  onMapReady: _onMapReady,
                  onActiveLevelChanged: _onActiveLevelChanged,
                  onBuildingFocusChanged: _onBuildingFocusChanged,
                ))));
  }
}
