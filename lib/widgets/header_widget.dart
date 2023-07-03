import 'package:floxy_pay/core/colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.blueLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 72),
            child: Row(
              children: [
                const Icon(Icons.arrow_back),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
/*

// DropdownButtonHideUnderline(
// child: DropdownButtonFormField2(
decoration: const InputDecoration(
isDense: true,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
enabledBorder: InputBorder.none,
border: InputBorder.none,
focusedBorder: InputBorder.none,
focusedErrorBorder: InputBorder.none,
),
buttonHeight: 37,
buttonWidth: MediaQuery.of(context).size.width,
buttonDecoration: BoxDecoration(
color: CustomColors.white,
borderRadius: BorderRadius.circular(4),
border: Border.all(
color: CustomColors.textFieldBorderColor,
width: 1,
),
),
itemPadding: EdgeInsets.symmetric(horizontal: 15),
itemHeight: MediaQuery.of(context).size.height * 0.056,
icon: const Padding(
padding: EdgeInsets.only(right: 10),
child: Icon(
Icons.keyboard_arrow_down_rounded,
color: CustomColors.primeColour,
),
),
iconOnClick: const Padding(
padding: EdgeInsets.only(right: 10),
child: Icon(
Icons.keyboard_arrow_up,
color: CustomColors.primeColour,
),
),
hint: Padding(
padding: const EdgeInsets.symmetric(horizontal: 12),
child: Text(
'Status of Job',
style: Theme.of(context)
.textTheme
    .titleSmall!
.copyWith(
color: CustomColors.textFieldTextColour),
),
),
items: statusList
    .map((item) => DropdownMenuItem(
value: item,
child: Padding(
padding: EdgeInsets.symmetric(horizontal: 5),
child: Text(
item.toString(),
style: Theme.of(context)
.textTheme
    .titleSmall!
.copyWith(
color: CustomColors.primeColour),
),
)))
.toList(),
onChanged: (val) {
jobStatus = val.toString();
BlocProvider.of<JobsCubit>(context)
    .getAllJobsByStatus(val.toString());
},
),
),*/

}


