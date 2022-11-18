import 'package:image_picker/image_picker.dart';

Future<dynamic> takeUserProfileImage(
    {required ImageSource source, required Function state}) async {
  var image = await ImagePicker().pickImage(source: source);

  state(image);
}
