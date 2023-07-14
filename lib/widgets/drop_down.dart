import 'package:flutter/material.dart';

class DropdownBox extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String selectedOption;

  const DropdownBox({
    Key? key,
    this.onChanged,
    required this.selectedOption,
  }) : super(key: key);

  @override
  _DropdownBoxState createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String dropdownValue = 'Ethereum';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  widget.onChanged?.call(dropdownValue);
                });
              },
              items: <String>['Ethereum', 'Polygon', 'Mainnet']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
