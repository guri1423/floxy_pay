import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:floxy_pay/modules/buy_fxy/pages/buy_fxy.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';


class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {

  TextEditingController _address = TextEditingController();
  TextEditingController _amount = TextEditingController();


  late Client httpClient;
  late Web3Client ethereumClient;

  TextEditingController controller = TextEditingController();

  String address = '0x26b9497F5E52FeacDf735d11656c9885eD483A2b';
  String ethereumClientUrl =
      'https://sepolia.infura.io/v3/f77800ff05bf49d1b12787b2e7c24b6c';
  String contractName = "MyToken";
  String private_key = "";

  int balance = 0;
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



  Future<void> send() async {

    String walletAddress = "0xdbCa6c664224E5AE2400f10584E255f789C50c68";

    String receiverAddrss = '0x510a23606050b6bA1Ae37BdACb4e221756E31533';

    List<dynamic> result = await query('transferFrom', [EthereumAddress.fromHex(walletAddress),EthereumAddress.fromHex(receiverAddrss),BigInt.parse('100')]);

    debugPrint(result.toString());

  }






  @override
  void initState() {
    httpClient = Client();
    ethereumClient = Web3Client(ethereumClientUrl, httpClient);
    super.initState();



  }



  @override
  Widget build(BuildContext context) {
    SizedBox sizebox = const SizedBox(height: 10);
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(

        children: [
          Stack(
              children: <Widget>[

                HeaderWidget(title: Strings.send),

                Padding(
                  padding: const EdgeInsets.only(top: 106,left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,

                        decoration:  const BoxDecoration(
                          color: CustomColors.yellowLight,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.currentBalance,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),

                              sizebox,

                              Text(
                                Strings.tenThousandFXY,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),

                              sizebox,

                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyFxy()));
                                  },
                                  child: customSmallButton(context, Strings.buyFxy, CustomColors.white, CustomColors.black)),


                            ],
                          ),
                        ),

                      ),

                      sizebox,

                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 24),
                        child: Text(
                          Strings.sendFXY,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),

                     customTextFieldForm(context, controller: _address, hintText: Strings.address),

                     customTextFieldForm(context, controller: _amount, hintText: Strings.amount),

                      GestureDetector(
                          onTap: (){

                            send();

                            // transferFrom(EthereumAddress.fromHex('0xdbCa6c664224E5AE2400f10584E255f789C50c68'),  EthereumAddress.fromHex('0x9C7c177836f36527AC2A55Cc762B0D0f05C52De2'), BigInt.parse(_amount.text));
/*
                           send(BigInt.parse(_amount.text), EthereumAddress.fromHex('0xdbCa6c664224E5AE2400f10584E255f789C50c68'),
                               EthereumAddress.fromHex('0x9C7c177836f36527AC2A55Cc762B0D0f05C52De2'));*/


                            // Navigator.push(context, MaterialPageRoute(builder: (context) => SalePage()));
                          },
                          child: customButtonNew(context, Strings.process, CustomColors.black, CustomColors.white)),


                    ],
                  ),
                )
              ]
          ),

        ],
      ),

    );
  }
}
