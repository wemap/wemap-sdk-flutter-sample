import 'package:flutter/material.dart';
import 'package:wemap_sdk_flutter/wemap_sdk_flutter.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: Center(
            child: ElevatedButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> const MapContainer(title: "Wemap Sample")));
    }, child: const Text("Go Map")),)
    ,
    );
  }
}

class MapContainer extends StatelessWidget {
  final String title;

  const MapContainer({super.key, required this.title});

  void _onMapReady(MapData mapData, MapManager mapManager) {
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
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: Container(
            constraints: const BoxConstraints.expand(),
            child: WemapMap(
              options: MapOptions(
                  mapID: 30265,
                  token: "",
                  environment: Environment.PROD,
                  locationSource: LocationSource.VPS),
              onMapReady: _onMapReady,
              onActiveLevelChanged: _onActiveLevelChanged,
              onBuildingFocusChanged: _onBuildingFocusChanged,
              searchBarEnabled: true,
              userLocationButtonEnabled: true,
              levelsTabEnabled: true,
              filtersTabEnabled: true,
              detailedViewEnabled: true,
              poisListSheetEnabled: true,
              augmentedRealityButtonEnabled: true,
              vpsInProcessScreen: true,
              itineraryWidgetEnabled: true,
              navigationWidgetEnabled: true,
            )));
  }
}
