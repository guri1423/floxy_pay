import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../core/colors.dart';



class BalanceWallet extends StatefulWidget {

  BalanceWallet({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BalanceWalletState createState() => _BalanceWalletState();
}

class _BalanceWalletState extends State<BalanceWallet> {

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

  Future<void> getBalance() async {

    debugPrint('******');

    String walletAddress = "0xdbCa6c664224E5AE2400f10584E255f789C50c68";

    List<dynamic> result = await query('balanceOf', [EthereumAddress.fromHex(walletAddress)]);

    balance = int.parse(result[0].toString());

    debugPrint(result.toString());

    debugPrint(balance.toString());

  }

  Future<void> deposit(int amount) async {
    BigInt parsedAmount = BigInt.from(amount);
    var result = await transaction("deposit", [parsedAmount]);
    print("deposited");
    print(result);
  }

  Future<void> withdraw(int amount) async {
    BigInt parsedAmount = BigInt.from(amount);
    var result = await transaction("withdraw", [parsedAmount]);
    print("withdraw done");
    print(result);
  }

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethereumClient = Web3Client(ethereumClientUrl, httpClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Balance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),

            Text(
              balance.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('amount')),
              ),
            ),
            Spacer(),

            GestureDetector(
              onTap: () {

                getBalance();

                getContract();
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
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: CustomColors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: getBalance,
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                    onPressed: () => deposit(int.parse(controller.text)),
                    icon: Icon(Icons.upload),
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: IconButton(
                    onPressed: () => withdraw(int.parse(controller.text)),
                    icon: Icon(Icons.download),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
