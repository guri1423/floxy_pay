



import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web3dart/web3dart.dart';

import '../core/strings.dart';

class StorageServices{


  final storage =  const FlutterSecureStorage();
  setAddress(EthereumAddress address) async {
    String addressString = address.hex; // Convert EthereumAddress to string
    await storage.write(key: Strings.address, value: addressString);
  }

  setEmail(String email)async{
    await storage.write(key: Strings.emailKey, value: email);
  }

  setPrivateKey(String privateKey)async{
    await storage.write(key: Strings.privateKey, value: privateKey);
  }

  setPassword(String password)async{
    await storage.write(key: Strings.passwordKey, value: password);
  }
  removeEmailAndPass()async{
    await storage.delete(key: Strings.emailKey);
    await storage.delete(key: Strings.passwordKey);
  }
  setUserLoggedIn(String val)async{
    await storage.write(key: Strings.loggedKey, value: val);
  }

  Future<String?> getEmail()async{
    return await storage.read(key: Strings.emailKey);

  }

  Future<String?> getAddress() async {
    String? addressString = await storage.read(key: Strings.address);
    return addressString;
  }


  Future<String?> getPassword()async{
    return await storage.read(key: Strings.passwordKey);

  }

  setUserId(String id)async{
    await storage.write(key: Strings.userIdKey, value: id);
  }

  Future<String?>getUserId()async{
    return await storage.read(key: Strings.userIdKey);
  }

  setId(String id)async{
    await storage.write(key: Strings.IdKey, value: id);
  }

  Future<String?>getId()async{
    return await storage.read(key: Strings.IdKey);
  }

  Future<String?>getLoggedInStatus()async{
    return await storage.read(key: Strings.loggedKey);
  }


  clearStorage()async{
    await storage.deleteAll();
  }

}