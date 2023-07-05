import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;


class EncryptedDataSender extends StatefulWidget {
  @override
  _EncryptedDataSenderState createState() => _EncryptedDataSenderState();
}

class _EncryptedDataSenderState extends State<EncryptedDataSender> {
  final key = "TestCheck.......................";
  final plainText = "lorem ipsum example example";
  late encrypt.Encrypted encrypted;
  late String decryptedText;
  late String responseMessage;

  @override
  void initState() {
    super.initState();
    encryptAndSendData();
  }

  void encryptAndSendData() {
    encrypted = encryptData(key, plainText);

    // Convert the encrypted data to a JSON payload
    final payload = {
      'data': encrypted.base64,
    };

    // API endpoint URL
    final apiUrl = 'https://api.example.com/endpoint';

    // Send the encrypted data through API
    sendEncryptedData(apiUrl, payload).then((response) {
      if (response.statusCode == 200) {
        // Data sent successfully
        setState(() {
          responseMessage = 'Encrypted data sent successfully!';
        });
      } else {
        // Error occurred while sending data
        setState(() {
          responseMessage = 'Error sending encrypted data. Status code: ${response.statusCode}';
        });
      }
    }).catchError((error) {
      setState(() {
        responseMessage = 'Error sending encrypted data: $error';
      });
    });
  }

  String decryptData(String keyString, encrypt.Encrypted encryptedData) {
    final key = encrypt.Key.fromUtf8(keyString);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final initVector = encrypt.IV.fromUtf8(keyString.substring(16));
    return encrypter.decrypt(encryptedData, iv: initVector);
  }

  encrypt.Encrypted encryptData(String keyString, String plainText) {
    final key = encrypt.Key.fromUtf8(keyString);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final initVector = encrypt.IV.fromUtf8(keyString.substring(16));
    encrypt.Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  Future<http.Response> sendEncryptedData(String apiUrl, Map<String, dynamic> payload) async {
    // Send a POST request to the API endpoint with the encrypted data
    return await http.post(Uri.parse(apiUrl), body: payload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encrypted Data Sender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (responseMessage == null)
              CircularProgressIndicator()
            else
              Text(
                responseMessage,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
