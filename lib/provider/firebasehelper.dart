import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheme/model/campmodel.dart';
import 'package:scheme/model/ngomodel.dart';
import 'package:scheme/model/usermodel.dart';

class FirebaseHelper {
  Future<CampsModel?> getCampDetailModel({required String id}) async {
    CampsModel? campDetail;
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("Camps").doc(id).get();
    if (docSnap.data() != null) {
      List temp = [];
      temp.add(docSnap.data());
      for (var tempData in temp) {
        campDetail = CampsModel.fromMap(tempData);
      }
    }
    return campDetail;
  }

  static Future<NgoModel?> getngoModelById({required String ngoid}) async {
    NgoModel? ngoDetail;
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("Ngos").doc(ngoid).get();
    if (docSnap.data() != null) {
      List temp = [];

      temp.add(docSnap.data());
      for (var tempData in temp) {
        ngoDetail = NgoModel.fromMap(tempData);
      }
      return ngoDetail;
    }
    return null;
  }

  static Future<UserModel?> getUserModelById({required String uid}) async {
    UserModel? userModel;
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    if (docSnap.data() != null) {
      userModel = UserModel.fromMap(docSnap.data() as Map<String, dynamic>);
    }

    return userModel;
  }
}
