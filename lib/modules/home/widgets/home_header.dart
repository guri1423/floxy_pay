import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/notification/pages/notification.dart';
import 'package:floxy_pay/modules/profile/pages/profile.dart';
import 'package:floxy_pay/modules/sale/pages/sale.dart';
import 'package:floxy_pay/modules/swap/pages/swap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MethodChannel, PlatformException, rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:web3dart/web3dart.dart';
import '../../../services/storage_services.dart';
import '../../buy_fxy/pages/buy_fxy.dart';
import '../../receive/pages/receive_page.dart';
import '../../send/pages/send.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {


  final myAddress = '0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6';

  String _address = '';

  late Client httpClient;
  late Web3Client ethereumClient;

  TextEditingController controller = TextEditingController();

  String address = '0x26b9497F5E52FeacDf735d11656c9885eD483A2b';

  String ethereumClientUrl =
      'https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c';
  String contractName = "MyToken";
  String private_key = "";

  int balance = 0;
  int mainNetBalance = 0;
  bool loading = false;


  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {

    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethereumClient.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> transaction(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(private_key);
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    dynamic result = await ethereumClient.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString("assets/ethereum.abi.json");

    String contractAddress = "0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<void> getBalance() async {

    debugPrint('******');

    String walletAddress = "0xdbCa6c664224E5AE2400f10584E255f789C50c68";

    List<dynamic> result = await query('balanceOf', [EthereumAddress.fromHex(walletAddress)]);

     setState(() {
       balance = int.parse(result[0].toString());
     });

    debugPrint(result.toString());

    debugPrint(balance.toString());


  }

  late Client httpClient1;

  late Web3Client ethereumClient1;


  String address1 = '0xdAC17F958D2ee523a2206206994597C13D831ec7';
  String ethereumClientUrl1 =
      'https://mainnet.infura.io/v3/4cf5ea966d084aceb3c25b05c7a0089e';
  String contractName1 = "TetherToken";
  String private_key1 = "";

  static const MethodChannel _channel = MethodChannel('web3auth_flutter');

  Future<String?> _getPrivKey() {
    return Web3AuthFlutter.getPrivKey();
  }


  Future<List<dynamic>> query1(String functionName, List<dynamic> args) async {

    DeployedContract contract = await getContract1();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await ethereumClient1.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> transaction1(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(private_key);
    DeployedContract contract = await getContract1();
    ContractFunction function = contract.function(functionName);
    dynamic result = await ethereumClient1.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );

    return result;
  }

  Future<DeployedContract> getContract1() async {
    String abi = await rootBundle.loadString("assets/tether_token.abi.json");

    String contractAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName1),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<void> getBalance1() async {

    debugPrint('****** get balance 1');

    String walletAddress = "0x510a23606050b6bA1Ae37BdACb4e221756E31533";

    List<dynamic> result = await query1('balanceOf', [EthereumAddress.fromHex(walletAddress)]);

    setState(() {
      mainNetBalance = int.parse(result[0].toString());
    });


    debugPrint(result.toString());

    debugPrint(mainNetBalance.toString());


  }



  @override
  void initState() {
    httpClient = Client();
    ethereumClient = Web3Client(ethereumClientUrl, httpClient);

    _getAddress();

    super.initState();

  }


  Future<Web3Client> createWeb3Client() async {
    final rpcUrl = 'https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c';
    final httpClient = Client();
    final chainId = 1; // Use 1 for Ethereum mainnet
    final web3Client = Web3Client(rpcUrl, httpClient);
    return web3Client;
  }



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Container(
          decoration: const BoxDecoration(
            color: CustomColors.blueLight,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),

              bottomRight: Radius.circular(20), // Adjust radiusValue as needed
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: CustomColors.white),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      },
                      child: SvgPicture.asset(
                        'assets/svg_images/notificationImage.svg',
                        height: 28,
                        width: 28,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _address,
                            style: theme.textTheme.titleLarge!.copyWith(fontSize: 12,fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),


                          const SizedBox(
                            height: 12,
                          ),
                         /* Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Text(
                                    "-2.49%",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("+67.53%",
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.w400)),
                            ],
                          )*/
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyFxy()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Center(
                              child: Text(
                                "Buy FXY",
                                style: theme.textTheme.headlineSmall!.copyWith(
                                    color: CustomColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
                // thirdRow(context)
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x193D566E),
                blurRadius: 12,
                offset: Offset(0, 3),
                spreadRadius: -2,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SendPage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/sendButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Receive()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/receiveButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SwapPage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/swapButton.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SalePage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg_images/saleButton.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }


  Future<String> _getAddress() async {

    final StorageServices _servicesStorage = StorageServices();

    final privateKey = await _servicesStorage.getId()  ?? '0';

    debugPrint('Private key ${privateKey}');

    const String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");

    _servicesStorage.setAddress(address);
    setState(() {
      _address = address.hexEip55.toString();
    });
    return address.hexEip55;
  }



}
