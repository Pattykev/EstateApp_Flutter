/*
import 'package:cloud_firestore/cloud_firestore.dart';

class HouseService {
  
  HouseService();

    final CollectionReference houseCollection =
      FirebaseFirestore.instance.collection("houses");
  final CollectionReference announceCollection =
      FirebaseFirestore.instance.collection("announces");
  final CollectionReference scheduleCollection =
      FirebaseFirestore.instance.collection("schedules");
       final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");


 Future gettingUserData(String email) async {
    String id =
        await userCollection.where("email", isEqualTo: email).get();
    return id;
  }

       Future savingHouseData(String typeLog, String styleLog, String lat,
      String long, String email) async {
    DocumentReference houseDocumentReference = await houseCollection.add({
      "type Logement": typeLog,
      "style Logement": styleLog,
      "Latitude": lat,
      "Longitude": long,
      "email": email,
      //"image logement": imageLog, String imageLog
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "liste logement": FieldValue.arrayUnion(["${houseDocumentReference.id}"])
    });
  }
}
*/