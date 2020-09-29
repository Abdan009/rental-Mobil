part of "shared.dart";

Future<File> getImage() async {
  final _picker = ImagePicker();
  PickedFile pickedFile;

  do {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
  } while (pickedFile == null);
  {
    return File(pickedFile.path);
  }
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);
  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);

  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}

Future<void> deleteImage(String urlImage) async {
  var fileUrl = Uri.decodeFull(basename(urlImage))
      .replaceAll(new RegExp(r'(\?alt).*'), "");

  final StorageReference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(fileUrl);
  await firebaseStorageRef.delete();
}

Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, targetPath,
        quality: 88,
        rotate: 180,
      );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }
