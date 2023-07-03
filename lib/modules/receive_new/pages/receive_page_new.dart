import 'package:floxy_pay/modules/receive_new/widgets/receive_body_widget.dart';
import 'package:floxy_pay/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(children: const <Widget>[
          HeaderWidget(title: 'Receive'),
          ReceiveBodyWidget()
        ]),
      ],
    ));
  }
}
