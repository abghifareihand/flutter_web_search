import 'package:flutter/material.dart';
import 'package:wifipos_web/core/constants/fonts.dart';

import '../../core/components/responsive_widget.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xff0CBAF9),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: const ResponsiveWidget(
              mobile: MobileContent(),
              tablet: TabletContent(),
              desktop: DesktopContent(),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileContent extends StatelessWidget {
  const MobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Silahkan Hubungi Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/contact.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'rizkyrafiandy@gmail.com\nthariqaziz@gmail.com\nachmadhildan@gmail.com',
          style: AppFont.blackText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TabletContent extends StatelessWidget {
  const TabletContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Silahkan Hubungi Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/contact.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'rizkyrafiandy@gmail.com\nthariqaziz@gmail.com\nachmadhildan@gmail.com',
          style: AppFont.blackText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Silahkan Hubungi Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/contact.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'rizkyrafiandy@gmail.com\nthariqaziz@gmail.com\nachmadhildan@gmail.com',
          style: AppFont.blackText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
