import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jamaathi/Component/MosquesList.dart';

class ListOfMosquesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  final List<MosquesList> listOfMosques = [
    MosquesList(
      name: 'FAJR',
      time: '(04:50-06:30)',
    ),
    MosquesList(
      name: 'DHUHR',
      time: '(12:30-04:30)',
    ),
    MosquesList(
      name: 'ASAR',
      time: '(04:30-06:00)',
    ),
    MosquesList(
      name: 'MAGRIB',
      time: '(06:10-07:50)',
    ),
    MosquesList(
      name: 'ISHA',
      time: '(07:50-12:30)',
    ),
  ];
  final List<MosquesList> listOfIqaamathTime = [
    MosquesList(
      name: 'FAJR',
      time: '05:40',
    ),
    MosquesList(
      name: 'DHUHR',
      time: '01:15',
    ),
    MosquesList(
      name: 'ASAR',
      time: '05:00',
    ),
    MosquesList(
      name: 'MAGRIB',
      time: '06:30',
    ),
    MosquesList(
      name: 'ISHA',
      time: '08:30',
    ),
  ];
  final List<MosquesList> listOfAzaanTime = [
    MosquesList(
      name: 'FAJR',
      time: '05:10',
    ),
    MosquesList(
      name: 'DHUHR',
      time: '12:45',
    ),
    MosquesList(
      name: 'ASAR',
      time: '04:45',
    ),
    MosquesList(
      name: 'MAGRIB',
      time: '06:10',
    ),
    MosquesList(
      name: 'ISHA',
      time: '08:15',
    ),
  ];
}
