import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_kareem/modules/notification_ready_funcs.dart';
import 'package:ramadan_kareem/modules/settings/update_data_screen.dart';
import 'package:ramadan_kareem/shared/components/components/custom_dialog/custom_dialog.dart';
import 'package:ramadan_kareem/shared/components/components/custom_dialog/dialog_buttons.dart';
import 'package:ramadan_kareem/shared/components/components/push.dart';
import 'package:ramadan_kareem/shared/components/constants.dart';
import 'package:ramadan_kareem/shared/styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    Key key
  }) : super(key: key);

  final List<String> allowedDeviceIDs = [
    'b5515f47ea9d92df', // أبو يوسف
    'd1c4159a8fd1ac52', // آلاء عبد الفتاح
    '5e52c61a71751b03', // فاطم رياض
    '33df7de003ca17ad', // هدية ابراهيم
    '027e5a15c8257dff', // أنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        child: Column(
          children: [
            // screen design
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// تعديل الدعاء أو الاسم
                    ListTile(
                      title: Text(
                        'تعديل الاسم أو الدعاء',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          // color: greyColor,
                          color: pinkColor,
                        ),
                      ),
                      // subtitle: Text(
                      //   'اضغط لتعديل الاسم أو الدعاء',
                      //   style: TextStyle(
                      //     fontSize: 9.sp,
                      //     fontWeight: FontWeight.w500,
                      //     // height: 1.5,
                      //     color: greyColor.withAlpha(130),
                      //   ),
                      // ),
                      onTap: () {
                        push(context, const UpdateUserDataScreen());
                      },
                      leading: const Icon(Icons.edit_outlined,color: pinkColor,),
                    ),

                    /// إعادة ضبط الإشعارات
                    ListTile(
                      onTap: () async {
                        readyShowScheduledNotification(context);
                      },

                      title: Text(
                        'إعادة ضبط الإشعارات',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: greyColor,
                        ),
                      ),
                      leading: const Icon(Icons.notification_important_outlined),
                    ),

                    /// التواصل مع المبرمج
                    ListTile(
                      title: Text(
                        'تواصل مع المبرمج',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: greyColor,
                        ),
                      ),
                      onTap: () async {
                        await launch(
                          mailUs(),
                        );
                      },
                      leading: const Icon(Icons.email_outlined),
                    ),

                    /// عن التطبيق
                    ListTile(
                      title: Text(
                        'عن التطبيق',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: greyColor,
                        ),
                      ),
                      onTap: () {
                        showCustomDialog(
                          context: context,
                          title: 'عن التطبيق',
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'رمضان مبارك هو تطبيق بيخلينا ندعي لبعض وبيفكرنا قبل الفطار 🤲',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: greyColor,
                                ),
                              ),

                              SizedBox(height: 10.sp),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  'فكرة التطبيق بسيطة جداً',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: greyColor,
                                  ),
                                ),
                              ),

                              SizedBox(height: 5.sp),
                              Text(
                                'لما نفتح التطبيق هنلاقي ناس ممكن ما نكونش عارفينهم، هندعيلهم بظهر الغيب، والملك هيرد "ولك بمثل" فيكون دعاءنا أقرب للإجابة لينا وللمدعو ليه، زي ما قال سيدنا النبي ﷺ، واحنا كمان اسمنا بيكون ظاهر للمستخدمين التانيين وبيدعولنا هما كمان 💙',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                  color: greyColor,
                                ),
                              ),

                              // SizedBox(height: 10.sp),
                              // Align(
                              //   alignment: AlignmentDirectional.centerStart,
                              //   child: Text(
                              //     'شكراً للقارئ أحمد صقر على صوت الإشعارات',
                              //     style: TextStyle(
                              //       fontSize: 9.sp,
                              //       fontWeight: FontWeight.w500,
                              //       height: 1.5,
                              //       color: greyColor,
                              //     ),
                              //   ),
                              // ),

                            ],
                          ),
                          buttons: [
                            DialogButton(
                              title: 'رجوع',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                      leading: const Icon(Icons.info_outline),
                    ),

                    /// مشاركة التطبيق
                    // if (allowedDeviceIDs.contains(deviceId))
                      ListTile(
                        title: Text(
                          'مشاركة التطبيق',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: greyColor,
                          ),
                        ),
                        onTap: () async {
                          await Share.share(
                            'رمضان مبارك 🌙💙\nرمضان مبارك هو تطبيق بيخلينا ندعي لبعض وبيفكرنا قبل الفطار 🤲\nلما تنزل التطبيق وتفتحه هتلاقي ناس ممكن ما تكونش عارفهم بس هتدعيلهم بظهر الغيب والملك هيرد عليك "ولك بمثل" فيكون دعاءك أقرب للإجابة ليك وللمدعو ليه، زي ما قال سيدنا النبي ﷺ 💙\nتقدر تنضم لينا وتنزل التطبيق من الرابط ده: https://play.google.com/store/apps/details?id=malazhariy.ramadan_kareem',
                            subject:
                            'رمضان مبارك 🌙', // subject for emails only
                          );
                        },
                        leading: const Icon(Icons.share_outlined),
                      ),
                  ],
                ),
              ),
            ),

            // back button
            Align(
              alignment: AlignmentDirectional.center,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                shape: const StadiumBorder(),
                highlightElevation: 5,
                highlightColor: pinkColor.withAlpha(50),
                child: Ink(
                  decoration: BoxDecoration(
                    // gradient: const LinearGradient(
                    //   colors: [
                    //     Color(0XFFFF4AA3),
                    //     Color(0XFFF8B556),
                    //   ],
                    //   begin: Alignment.centerRight,
                    //   end: Alignment.centerLeft,
                    // ),
                    color: pinkColor,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50,
                    ),
                    width: 50.w,
                    child: Text(
                      'رجوع',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


String mailUs({
  String subject = '',
  String body = '',
}) {
  const String email = 'malazhariy.ramadankareem@gmail.com';
  return 'mailto:$email?subject=$subject&body=$body';
}
