import 'package:floxy_pay/core/colors.dart';
import 'package:floxy_pay/core/strings.dart';
import 'package:floxy_pay/modules/buy_fxy/pages/buy_fxy.dart';
import 'package:floxy_pay/modules/handler/ether_scan_my_token.dart';
import 'package:floxy_pay/modules/handler/main_net.dart';
import 'package:floxy_pay/modules/handler/polygon_eth_handler.dart';
import 'package:floxy_pay/widgets/common_widgets.dart';
import 'package:floxy_pay/widgets/custom_textField.dart';
import 'package:floxy_pay/widgets/drop_down.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  TextEditingController _address = TextEditingController();
  TextEditingController _amount = TextEditingController();

  final sendBalance = SendBalanceHandler();
  final polyHandler = PolyHandler();
  final balanceHandler = BalanceHandler();

  String selectedDropdown = '';
  String? balance;
  String? unit;
  int _selectedOptionIndex = 0;

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
                padding: const EdgeInsets.only(top: 106, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      decoration: const BoxDecoration(
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
                              balance ?? Strings.tenThousandFXY,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            Text(
                              unit ?? 'USDT',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            sizebox,
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BuyFxy()),
                                );
                              },
                              child: customSmallButton(
                                context,
                                Strings.buyFxy,
                                CustomColors.white,
                                CustomColors.black,
                              ),
                            ),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child:   DropdownBox(
                        selectedOption: 'Tether USD (Ethereum)',
                        onChanged: (selectedValue) {
                          setState(() {
                            selectedDropdown = selectedValue;
                            _getBalance();
                            _getUnit();
                          });
                          debugPrint('Selected: $selectedValue');
                        },
                      ),
                    ),
                    customTextFieldForm(context, controller: _address, hintText: Strings.address),
                    customTextFieldForm(context, controller: _amount, hintText: Strings.amount),

                    GestureDetector(
                      onTap: () async{

                        if (selectedDropdown == 'Tether USD (Ethereum)') {

                          balanceHandler.transferTokens('0x9c7c177836f36527ac2a55cc762b0d0f05c52de2', 120);

                        } else if (selectedDropdown == 'Tether USD (Polygon)') {

                          polyHandler.transferTokens('0x9c7c177836f36527ac2a55cc762b0d0f05c52de2', 120);

                        } else if (selectedDropdown == 'MyTokenSymbol') {

                          sendBalance.transferTokens('0x9c7c177836f36527ac2a55cc762b0d0f05c52de2', 120);

                        } else {

                          print('Invalid option selected');
                        }
                      },
                      child: customButtonNew(context, Strings.process, CustomColors.black, CustomColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? _getBalance() {
    if (selectedDropdown == 'Tether USD (Ethereum)') {
      balanceHandler.getBalance1().then((String bal) {
        setState(() {
          balance = bal;
        });
      });

    } else if (selectedDropdown == 'Tether USD (Polygon)') {
      polyHandler.getBalance1().then((String balance1) {
        double dividedBalance = double.parse(balance1) / 1000000;
        setState(() {
          balance = dividedBalance.toString();
        });
      });
    } else if (selectedDropdown == 'MyTokenSymbol') {
      sendBalance.getBalance1().then((String bal) {
        double dividedBalance = double.parse(bal) / 1000000000000000000;
        double formattedBalance = dividedBalance;
        setState(() {
          balance = formattedBalance.toString();
        });
      });
    } else {
      print('Invalid option');
    }
    return null;
  }

  String? _getUnit() {
    if (selectedDropdown == 'Tether USD (Ethereum)') {

      setState(() {
        unit = 'USDT' ;
      });

    } else if (selectedDropdown == 'Tether USD (Polygon)') {
      setState(() {
        unit = 'USDT' ;
      });
    } else if (selectedDropdown == 'MyTokenSymbol') {
      setState(() {
        unit = 'MyTokenSymbol' ;
      });
    } else {
      print('Invalid option');
    }
    return null;
  }


}
