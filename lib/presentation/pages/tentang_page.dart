import 'package:flutter/material.dart';
import 'package:wifipos_web/core/constants/fonts.dart';

import '../../core/components/responsive_widget.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Tentang Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/about.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'Indoor Wi-Fi Positioning System merupakan teknologi yang memanfaatkan jaringan Wi-Fi yang terdapat di dalam sebuah bangunan atau ruangan untuk menentukan lokasi pengguna di dalamnya. Website Wi-Pos bertujuan untuk memudahkan user dalam menggunakan dan mengakses beberapa fitur khususnya fitur Tracking. Selain dapat diakses melalui Website, Wi-Pos juga dapat diakses melalui aplikasi yang dapat di download pada link dibawah ini.',
          style: AppFont.blackText.copyWith(
            fontSize: 14,
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
          'Tentang Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/about.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'Indoor Wi-Fi Positioning System merupakan teknologi yang memanfaatkan jaringan Wi-Fi yang terdapat di dalam sebuah bangunan atau ruangan untuk menentukan lokasi pengguna di dalamnya. Website Wi-Pos bertujuan untuk memudahkan user dalam menggunakan dan mengakses beberapa fitur khususnya fitur Tracking. Selain dapat diakses melalui Website, Wi-Pos juga dapat diakses melalui aplikasi yang dapat di download pada link dibawah ini.',
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
          'Tentang Kami',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/about.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        Text(
          'Indoor Wi-Fi Positioning System merupakan teknologi yang memanfaatkan jaringan Wi-Fi yang terdapat di dalam sebuah bangunan atau ruangan untuk menentukan lokasi pengguna di dalamnya. Website Wi-Pos bertujuan untuk memudahkan user dalam menggunakan dan mengakses beberapa fitur khususnya fitur Tracking. Selain dapat diakses melalui Website, Wi-Pos juga dapat diakses melalui aplikasi yang dapat di download pada link dibawah ini.',
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
