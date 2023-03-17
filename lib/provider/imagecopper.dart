import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';

Future cropImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primary,
            toolbarColor: primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            hideBottomControls: true,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}

Future userImagecopper({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      aspectRatioPresets: [CropAspectRatioPreset.original],
      cropStyle: CropStyle.circle,
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primary,
            toolbarColor: primary,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}
