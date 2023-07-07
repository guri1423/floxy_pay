import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../../widgets/header_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  ListView(
          children: [
            Stack(
                children: <Widget>[
                  HeaderWidget(title: Strings.notification),

                  Padding(
                    padding: const EdgeInsets.only(top: 91,left: 16, right: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                          child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 5,);
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:  const BoxDecoration(
                                    color: CustomColors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 14, bottom: 14, left: 14),
                                    child: Row(

                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [


                                        SvgPicture.asset('assets/svg_images/notification_icon_1.svg'),

                                         Padding(
                                           padding: const EdgeInsets.only(left: 16),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Sent 1.27 Matic Vikas Jain',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(top: 6),
                                                child: Text(
                                                  'Today - 11.30 AM',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.5),
                                                    fontSize: 10,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )
                                            ],
                                        ),
                                         ),

                                      ],
                                    ),
                                  ),
                                );
                              },

                              itemCount: 4),
                        ),
                      ],
                    ),
                  )



                ]
            ),

          ],
        )
    );
  }
}
