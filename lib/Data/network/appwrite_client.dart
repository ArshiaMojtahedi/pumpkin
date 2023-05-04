import 'package:appwrite/appwrite.dart';

import '../../../App/constants.dart';

class AppWriteClientFactory {
  Future<Client> getClient() async {
    Client client = Client();
    client
        .setEndpoint(Constant.baseUrl)
        .setProject(Constant.projectId)
        .setSelfSigned(status: true);
    return client;
  }
}
