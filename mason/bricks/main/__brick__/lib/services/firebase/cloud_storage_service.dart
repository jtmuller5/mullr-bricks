import 'dart:typed_data';

import 'package:blurhash/blurhash.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

@injectable
class CloudStorageService extends ChangeNotifier {

  FirebaseStorage get storage {
    return FirebaseStorage.instance;
  }

  /// Temporary storage for compressed images
  Future<String> get _tempPath async {
    return 'test';
  }

  // path = 'example/name'
  Reference getCloudReference(String path) {
    return FirebaseStorage.instance.ref(path);
  }

  ///
  Future<Stream> getVideoStream(String path) async {
    File tempFile = await getTempFile('temp.mp4');
    Reference ref = FirebaseStorage.instance.ref(path);


    return tempFile.openRead();
  }

  Future<File> getTempFile(
      String fileName,
      ) async {
    final path = await _tempPath;
    return File('$path/${fileName}');
  }

  Future<String> getBlurHash(File file) async {
    Uint8List pixels = file.readAsBytesSync();
    String blurHash = await BlurHash.encode(pixels, 4, 3);
    return blurHash;
  }

  // TODO make sure to clean temp storage after compression
  /// Generic method to upload a single file to Cloud Storage
  /// Has an optional callback that gets called after the file upload has completed
  /// Returns the newly uploaded file's URL
  Future<String> saveFileToCloudStorage({
    required Reference storageReference,
    required File? file,
    String? localId,
    Function(String, File, String)? afterUploadCallback, // returnURL, file, localId
    Function(double)? progressCallback,
    String? compressionType, // 'image' or 'video'
  }) async {
    /// Built-in compression for images
    if (compressionType == 'image') {
    }

    if (compressionType == 'video') {
    }

    UploadTask uploadTask = storageReference.putFile(file!);

    if (progressCallback != null) {
      /// Listen to the progress of the upload, used to show progress indicator outside of upload screen
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Task state: ${snapshot.state}');
        print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');

        progressCallback((snapshot.bytesTransferred / snapshot.totalBytes) * 100);
      }, onError: (e) {
        print('File upload error ' + uploadTask.snapshot.toString());

        if (e.code == 'permission-denied') {
          print('User does not have permission to upload to this reference.');
        }
      });
    }

    try {
      await uploadTask;

      String returnURL = await storageReference.getDownloadURL();

      if (afterUploadCallback != null) {
        return afterUploadCallback(returnURL, file, localId!);
      }

      print('File Uploaded: $returnURL');
      return returnURL;
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  /// Get all of the files inside a directory
  Future<List<Reference>> getFileList(Reference ref) async {

    List<Reference> refs = [];

    ListResult result = await ref.listAll();

    result.items.forEach((Reference ref) {
      print('Found file: $ref');
      refs.add(ref);
    });

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });

    return refs;
  }

  Future<String> getDownloadUrl(Reference reference) async {
    String url = await reference.getDownloadURL();
    return url;
  }
}
