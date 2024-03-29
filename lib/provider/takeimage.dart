import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Future<dynamic> takeUserProfileImage(
//     {required ImageSource source, required Function state}) async {
//   var image = await ImagePicker().pickImage(source: source);

//   state(image);
// }

imageupload({required String filename, required String file}) async {
  if (file != "") {
    await fireStoreFileUpload(
            "${FirebaseAuth.instance.currentUser!.uid}/$filename.jpg", file)
        .then((aadharImage) async {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .update({
        filename: aadharImage,
      });
    });
  }
}

Future fireStoreFileUpload(refStorageImage, refImage) async {
  String pathValue = '';
  final firebaseStorageRef =
      FirebaseStorage.instance.ref().child(refStorageImage);
  final uploadTask = firebaseStorageRef.putFile(File(refImage));
  final taskSnapshot = await uploadTask.whenComplete(() {});
  await taskSnapshot.ref.getDownloadURL().then((value) async {
    pathValue = value;
  });

  return pathValue;
}
