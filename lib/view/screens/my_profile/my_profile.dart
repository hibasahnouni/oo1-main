import 'package:oo/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/my_profile'; // ✅ route claire et standard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          InkWell(
            onTap: () {
              // send report to school management
            },
            child: Padding(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  const Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text('Report', style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            // Profile Header Section
            Container(
              width: 100.w,
              height: SizerUtil.deviceType == DeviceType.tablet ? 19.h : 15.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kBottomBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius:
                        SizerUtil.deviceType == DeviceType.tablet ? 12.w : 13.w,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: const AssetImage(
                      'assets/images/student_profile.jpeg',
                    ),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aisha Mirza',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Class X-II A | Roll no: 12',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sizedBox,
            // Profile Detail Rows (Basic Info)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileDetailRow(
                  title: 'Registration Number',
                  value: '2020-ASDF-2021',
                ),
                ProfileDetailRow(title: 'Academic Year', value: '2020-2021'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileDetailRow(title: 'Admission Class', value: 'X-II'),
                ProfileDetailRow(title: 'Admission Number', value: '000126'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileDetailRow(
                  title: 'Date of Admission',
                  value: '1 Aug, 2020',
                ),
                ProfileDetailRow(title: 'Date of Birth', value: '3 May 1998'),
              ],
            ),
            sizedBox,
            // Profile Detail Columns (Additional Info)
            const ProfileDetailColumn(
              title: 'Email',
              value: 'aisha12@gmail.com',
            ),
            const ProfileDetailColumn(
              title: 'Father Name',
              value: 'John Mirza',
            ),
            const ProfileDetailColumn(
              title: 'Mother Name',
              value: 'Angelica Mirza',
            ),
            const ProfileDetailColumn(
              title: 'Phone Number',
              value: '+923066666666',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailRow({Key? key, required this.title, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: kTextBlackColor,
                  fontSize:
                      SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 9.sp,
                ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              kHalfSizedBox,
              SizedBox(width: 35.w, child: const Divider(thickness: 1.0)),
            ],
          ),
          Icon(Icons.lock_outline, size: 10.sp),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailColumn({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: kTextBlackColor,
                fontSize:
                    SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 11.sp,
              ),
            ),
            kHalfSizedBox,
            Text(value, style: Theme.of(context).textTheme.bodySmall),
            kHalfSizedBox,
            SizedBox(width: 92.w, child: const Divider(thickness: 1.0)),
          ],
        ),
        Icon(Icons.lock_outline, size: 10.sp),
      ],
    );
  }
}
