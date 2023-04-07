import 'package:cloud_firestore/cloud_firestore.dart';

getCamps() async {
  List campdata = [];
  FirebaseFirestore.instance
      .collection('Camps')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      campdata.add(doc.data());
    }
  });

  return campdata;
}

getNGOs() async {
  List ngodata = [];
  FirebaseFirestore.instance
      .collection('Ngos')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      ngodata.add(doc.data());
    }
  });

  return ngodata;
}
