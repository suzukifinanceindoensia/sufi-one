import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';


Future<Position> _getCurLoc()async{
  bool servicedEnable = await Geolocator.isLocationServiceEnabled();
  if(!servicedEnable){
    return Future.error("Enable Location");
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      return Future.error("Permision denied");
    }
  }
  if(permission == LocationPermission.deniedForever){
    return Future.error("Permision denied pemanently");
  }

  return await Geolocator.getCurrentPosition();
}

void _liveLocation(locationmsg){
  LocationSettings locationSettings = LocationSettings(
    //accuracy: LocationAccuracy.high, // gk tau knp gk ada modul ini di dokumentasinya ada
    distanceFilter: 10,// ini dalam meter
    timeLimit: Duration(hours: 1),
  );
  Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position){
    final lat = position.latitude.toString();
    final long = position.longitude.toString();
    locationmsg = "lat : $lat, long : $long";    
  });
}


//CONTOH PENGGUNAAN
//               ElevatedButton(onPressed: (){
//               _getCurLoc().then((value){
//                 lat = "${value.latitude}";
//                 long = "${value.longitude}";
//                 setState(() {
//                   locationmsg = "lat : $lat, long $long";
//                 });
//                 _liveLocation();
//               });