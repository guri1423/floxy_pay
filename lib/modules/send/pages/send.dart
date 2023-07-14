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
                              Strings.tenThousandFXY,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
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
                        selectedOption: 'Ethereum',
                        onChanged: (selectedValue) {
                          debugPrint('Selected: $selectedValue');
                        },
                      ),
                    ),
                    customTextFieldForm(context, controller: _address, hintText: Strings.address),
                    customTextFieldForm(context, controller: _amount, hintText: Strings.amount),

                    GestureDetector(
                      onTap: () {
                        if (_selectedOptionIndex == 0) {
                          debugPrint('Option 1');
                          // sendBalance.transferTokens(_address.text, double.parse(_amount.text));

                        } else if (_selectedOptionIndex == 1) {

                          debugPrint('Option 2');

                          // polyHandler.transferTokens(_address.text, double.parse(_amount.text));

                        } else if (_selectedOptionIndex == 2) {

                          debugPrint('Option 3');

                          balanceHandler.transferTokens(_address.text, double.parse(_amount.text));
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
}
