import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  //static String id = "";
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference houseCollection =
      FirebaseFirestore.instance.collection("houses");
  final CollectionReference announceCollection =
      FirebaseFirestore.instance.collection("announces");
  final CollectionReference scheduleCollection =
      FirebaseFirestore.instance.collection("schedules");
  //final CollectionReference groupCollection =
  //  FirebaseFirestore.instance.collection("groups");

  // saving the userdata
  Future savingUserData(
      String fullName,
      String surname,
      String email,
      String phone,
      String? role,
      String? typeLog,
      String? styleLog,
      String? lat,
      String? long) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "surname": surname,
      "email": email,
      "phone": phone,
      "role": role,
      "liste logement": [],
      "liste annonce": [],
      "liste rendez vous": [],
      //"profilePic": "",
      "uid": uid,
    });
    // id = uid!;
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

//sauvegarder logement

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
    return await userDocumentReference
        .update({"liste logement": "${houseDocumentReference.id}"});
  }

  Future savingScheduleData(
      String? userEmail, String subject, DateTime date) async {
    DocumentReference scheduleDocumentReference = await scheduleCollection.add({
      "email visiteur": userEmail,
      "sujet": subject,
      "date": date,
      "etat": 'A venir',
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference
        .update({"liste rendez vous": "${scheduleDocumentReference.id}"});
  }

  Future savingAnnounceData(
      String typeLog,
      String styleLog,
      String lat,
      String long,
      String surface,
      String prixLoyer,
      String distanceRoute,
      String prixCaution,
      String nbSalleB,
      String nbChambre,
      String nbCuisine,
      String description,
      String? email) async {
    DocumentReference announceDocumentReference = await announceCollection.add({
      "type Logement": typeLog,
      "style Logement": styleLog,
      "Latitude": lat,
      "Longitude": long,
      "surface": surface,
      "prix Loyer": prixLoyer,
      "distance route": distanceRoute,
      "prix caution": prixCaution,
      "nombre salle bains": nbSalleB,
      "nombre chambres": nbChambre,
      "nombre cuisine": nbCuisine,
      "description": description,
      //"profilePic": "",
      "email": email,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference
        .update({"liste annonce": "${announceDocumentReference.id}"});
  }

  // getting an announce data
  Future gettingAnnounceData(String email) async {
    QuerySnapshot snapshot =
        await announceCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // get announces data
  getUserGroups() async {
    return announceCollection.doc(uid).snapshots();
  }

/*
  // get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  // creating a group
  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupDocumentReference = await groupCollection.add({
      "groupName": groupName,
      "groupIcon": "",
      "admin": "${id}_$userName",
      "members": [],
      "groupId": "",
      "recentMessage": "",
      "recentMessageSender": "",
    });
    // update the members
    await groupDocumentReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupDocumentReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups":
          FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
    });
  }

  // getting the chats
  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  // get group members
  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  // search
  searchByName(String groupName) {
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  // function -> bool
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  // toggling the group join/exit
  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    // doc reference
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    // if user has our groups -> then remove then or also in other part re join
    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${uid}_$userName"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}_$userName"])
      });
    }
  }

  // send message
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    groupCollection.doc(groupId).collection("messages").add(chatMessageData);
    groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }
  */
}
