import 'dart:convert';
import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/modules/notification/pages/notification.dart';
import 'package:floxy_pay/modules/profile/pages/profile.dart';
import 'package:floxy_pay/modules/sale/pages/sale.dart';
import 'package:floxy_pay/modules/swap/pages/swap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../../../services/storage_services.dart';
import '../../receive/pages/receive_page.dart';
import '../../send/pages/send.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {


  final myAddress = '0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6';

  final tokenAddress = EthereumAddress.fromHex('0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB');

  final userAddress = EthereumAddress.fromHex('0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6');


  final httpClient = Client();

  final ethClient = Web3Client('https://rpc-mumbai.matic.today', Client());


  String _address = '';


  Future<DeployedContract> loadContract()async{
    String abi = await rootBundle.loadString('assets/ethereum.abi.json');
    String contractAddress = '0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB';
    final contract = DeployedContract(ContractAbi.fromJson(abi, 'MyToken'),EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<DeployedContract> getAbi() async {

    String abiStringFile = await rootBundle.loadString("assets/ethereum.abi.json");
    var jsonAbi = jsonDecode(abiStringFile);
    String contractAddress = '0xf4598c0e529E56B1ec322Ba7ee58dfB62dEd58aB';
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonAbi, 'MyToken'),
      EthereumAddress.fromHex(contractAddress),
    );
    return contract;

  }


  Future<List<dynamic>> query (String functionName, List<dynamic> args)async{

    final contract = await loadContract();

    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(contract: contract, function: ethFunction, params: [EthereumAddress.fromHex('0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6')]);


    return result;

  }


  Future<List> getWalletBalance(dynamic targetAddress) async{

   List<dynamic> result = await query('balanceOf',  [EthereumAddress.fromHex('0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6')]);

   debugPrint(result.toString());

   return result;
  }







  @override
  void initState() {
    _getAddress();
    super.initState();



  }

/*
  Future<DeployedContract> loadContract () async{

    String abi = await rootBundle.loadString('assets/ethereum.abi.json');
    String contractAddress = "0xc2132D05D31c914a87C6611C10748AEb04B58e8F";

    final contract = DeployedContract(ContractAbi.fromJson(abi, 'UChildERC20Proxy',), EthereumAddress.fromHex(contractAddress));

    return contract;
  }


  Future<List<dynamic>> query (String functionName, List<dynamic> args)async{

    final contract = await loadContract();

    final ethFunction = contract.functions
  }


  Future<Void> getWalletBalance(String targetAddress) async{

    EthereumAddress address = EthereumAddress.fromHex(targetAddress);
  }


  String rpcUrl = 'https://rpc.ankr.com/eth';

  String _result = '';

  String _address = '';*/


  Future<Web3Client> createWeb3Client() async {
    final rpcUrl = 'https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c';
    final httpClient = Client();
    final chainId = 1; // Use 1 for Ethereum mainnet
    final web3Client = Web3Client(rpcUrl, httpClient);
    return web3Client;
  }
  Future<EtherAmount> getWalletBalanceNew(String userAddress, String walletAddress) async {

    final contract = await getAbi();
    final ethFunction = contract.function('balanceOf');
    final result = await ethClient.call(contract: contract, function: ethFunction, params: [EthereumAddress.fromHex(walletAddress)]);
    final balanceInWei = result[0] as BigInt;
    final balanceInEther = EtherAmount.fromUnitAndValue(EtherUnit.wei, balanceInWei);
    return balanceInEther;
  }


  void fetchBalance() async {
    final userAddress = '0x25Ce743E4A39Dd5873039Ac9f9e77f412246c6A6';
    final walletAddress = '0xdAC17F958D2ee523a2206206994597C13D831ec7'; // Replace with the desired wallet address
    final balance = await getWalletBalanceNew(userAddress,walletAddress);
    print('Wallet Balance: ${balance.getValueInUnit(EtherUnit.ether)} ETH');
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
                            "Address: ${_address.substring(0,8)}...",
                            style: theme.textTheme.titleLarge!.copyWith(fontSize: 16),
                          ),

                          const SizedBox(
                            height: 12,
                          ),
                          Row(
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
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {



                          getAbi();

                          // fetchBalance();

                          // getWalletBalance(userAddress);
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BuyFxy()));*/
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

  /*Future<EtherAmount> _getBalance() async {

    final StorageServices _servicesStorage = StorageServices();

    final privateKey = await _servicesStorage.getId()  ?? '0';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    final balance = await client.getBalance(address);
    debugPrint(balance.toString());

    setState(() {
      _result = balance.toString();
    });

    return balance;
  }*/

  Future<String> _getAddress() async {

    final StorageServices _servicesStorage = StorageServices();

    final privateKey = await _servicesStorage.getId()  ?? '0';

    debugPrint(privateKey);

    const String rpcUrl = 'https://rpc.ankr.com/eth_goerli';

    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    debugPrint("Account, ${address.hexEip55}");
    setState(() {
      _address = address.hexEip55.toString();
    });
    return address.hexEip55;
  }

}
