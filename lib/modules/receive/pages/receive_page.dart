import 'package:floxy_pay/services/storage_services.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';
import '../widgets/receive_body_widget.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {




  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: _getAddress(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final address = snapshot.data!;
            return ListView(
              children: [
                Stack(
                  children: <Widget>[
                    HeaderWidget(title: 'Receive'),
                    ReceiveBodyWidget(address: address),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }


  final web3Auth = Web3AuthFlutter();

  Future<String> _getAddress() async {

    final StorageServices _servicesStorage = StorageServices();

    final privateKey = await _servicesStorage.getId()  ?? '0';

    debugPrint('Private key ${privateKey}');

    const String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");
    return address.hexEip55;
  }
}
