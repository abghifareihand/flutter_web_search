import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifipos_web/core/constants/fonts.dart';

import '../../core/components/button_gradient.dart';
import '../../core/components/responsive_widget.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

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
          'Silahkan Scan Qr Code atau Klik Download App',
          style: AppFont.blackText.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/qr_app.png',
          width: 200,
        ),
        const SizedBox(height: 40),
        const ButtonGradient(
          width: 200,
          height: 50,
          text: 'Download App',
          onPressed: _launchUrl,
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
          'Silahkan Scan Qr Code atau Klik Download App',
          style: AppFont.blackText.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/qr_app.png',
          width: 300,
        ),
        const SizedBox(height: 40),
        const ButtonGradient(
          width: 200,
          height: 50,
          text: 'Download App',
          onPressed: _launchUrl,
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
          'Silahkan Scan Qr Code atau Klik Download App',
          style: AppFont.blackText.copyWith(
            fontSize: 28,
            fontWeight: semiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Image.asset(
          'assets/images/qr_app.png',
          width: 300,
        ),
        const SizedBox(height: 40),
        const ButtonGradient(
          width: 200,
          height: 50,
          text: 'Download App',
          onPressed: _launchUrl,
        ),
      ],
    );
  }
}

/// Url Launch
final Uri _url = Uri.parse(
    'https://drive.google.com/uc?export=download&id=176MOl9LvqcFhZQoL53DN7DmO5Y3DuraC');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}
