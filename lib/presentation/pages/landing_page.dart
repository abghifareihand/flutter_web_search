import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifipos_web/core/components/custom_navbar.dart';
import 'package:wifipos_web/presentation/pages/search_page.dart';

import '../../core/components/button_gradient.dart';
import '../../core/components/responsive_widget.dart';
import '../../core/constants/fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ResponsiveWidget.isMobile(context) ? const MobileDrawer() : null,
      body: ListView(
        children: [
          const CustomNavbar(),
          Container(
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wifi\nPositioning System',
          style: AppFont.blackText.copyWith(
            fontSize: 40,
            fontWeight: bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Temukan kemudahan di setiap langkah dengan Wi-Pos',
          style: AppFont.blackText.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        const SizedBox(height: 40),
        const ButtonGradient(
          width: 200,
          height: 50,
          text: 'Download Now',
          onPressed: _launchUrl,
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/images/logo_wipos.png',
            height: 400,
          ),
        ),
      ],
    );
  }
}

class TabletContent extends StatelessWidget {
  const TabletContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wifi\nPositioning System',
                style: AppFont.blackText.copyWith(
                  fontSize: 40,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Temukan kemudahan di setiap langkah dengan Wi-Pos',
                style: AppFont.blackText.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 40),
              const ButtonGradient(
                width: 200,
                height: 50,
                text: 'Download Now',
                onPressed: _launchUrl,
              )
            ],
          ),
          Image.asset(
            'assets/images/logo_wipos.png',
            height: 400,
          ),
        ],
      ),
    );
  }
}

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wifi\nPositioning System',
                style: AppFont.blackText.copyWith(
                  fontSize: 60,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Temukan kemudahan di setiap langkah dengan Wi-Pos',
                style: AppFont.blackText.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 40),
              ButtonGradient(
                width: 200,
                height: 50,
                text: 'Download Now',
                // onPressed: _launchUrl,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ));
                },
              ),
            ],
          ),
          Image.asset(
            'assets/images/logo_wipos.png',
            height: 500,
          ),
        ],
      ),
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
