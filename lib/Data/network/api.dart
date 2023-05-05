import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../../../App/constants.dart';
import '../../App/app_preferences.dart';
import '../request/request.dart';

class AppServiceClient {
  final Account _account;
  final Databases _databases;
  final Storage _storage;

  AppServiceClient(Client client, AppPreferences appPreferences)
      : _account = Account(client),
        _databases = Databases(client),
        _storage = Storage(client);

  Future<Session> login(LoginRequest loginRequest) =>
      _account.createEmailSession(
          email: loginRequest.email, password: loginRequest.password);

  Future<User> register(LoginRequest loginRequest) => _account.create(
      userId: 'unique()',
      email: loginRequest.email,
      password: loginRequest.password,
      name: loginRequest.name);

  Future<Session> anonymousSession() => _account.createAnonymousSession();

  Future<Token> forgotPassword(String email) =>
      _account.createRecovery(email: email, url: Constant.baseUrl);

  Future<dynamic> deleteSession(String sessionId) =>
      _account.deleteSession(sessionId: sessionId);

  Future<File> createFile(Uint8List uint8list, String name) =>
      _storage.createFile(
        bucketId: Constant.buckedId,
        fileId: 'unique()',
        /*file: InputFile(
              file: MultipartFile.fromBytes('file', uint8list,
                  filename: name, contentType: MediaType('image', 'jpg'))),*/
        file: InputFile(filename: name, contentType: 'jpg', bytes: uint8list),
      );

  Future deleteFile(String idFile) =>
      _storage.deleteFile(bucketId: Constant.buckedId, fileId: idFile);

  Future<Uint8List> getFilePreview(String id) => _storage.getFilePreview(
        bucketId: Constant.buckedId,
        fileId: id,
      );

  Future<DocumentList> getAllProducts() => _databases.listDocuments(
        databaseId: Constant.databaseId,
        collectionId: Constant.productsCollection,
      );

  Future<Document> getSingleProduct(String productId) => _databases.getDocument(
        databaseId: Constant.databaseId,
        collectionId: Constant.productsCollection,
        documentId: productId,
      );

  Future<DocumentList> getAllCategories() => _databases.listDocuments(
        databaseId: Constant.databaseId,
        collectionId: Constant.categoriesCollection,
      );

  Future<Document> getSingleCategory(String catId) => _databases.getDocument(
        databaseId: Constant.databaseId,
        collectionId: Constant.categoriesCollection,
        documentId: catId,
      );
}
