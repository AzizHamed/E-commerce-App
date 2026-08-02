import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage{
  // Biometric storage with graceful degradation
final storage = FlutterSecureStorage(
  aOptions: AndroidOptions.biometric(
    enforceBiometrics: false, // Works without biometrics
    biometricPromptTitle: 'Authenticate to access data',
  ),
);



Future saveToken(String token)async{
  return await storage.write(key : "token", value : token);
}

Future<String?> getToken()async{
  return await storage.read(key: "token") ?? "";
}

Future removeToken()async{
  await storage.delete(key: "token");
}
}