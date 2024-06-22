import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/core/components/button_gradient.dart';
import 'package:wifipos_web/core/components/navbar_home.dart';
import 'package:wifipos_web/core/constants/fonts.dart';
import 'package:wifipos_web/data/datasources/auth_local_datasource.dart';
import '../../core/components/responsive_widget.dart';
import '../bloc/tracking_bloc/tracking_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TrackingBloc>().add(ResetTracking());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarHome(),
            ResponsiveWidget(
              mobile: MobileContent(),
              tablet: DesktopContent(),
              desktop: DesktopContent(),
            ),
          ],
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        ButtonGradient(
          width: 200,
          height: 50,
          text: 'Download Now',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        ButtonGradient(
          width: 200,
          height: 50,
          text: 'Tracking',
          onPressed: () {},
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
              FutureBuilder<String>(
                future: AuthLocalDatasource().getUsername(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final username = snapshot.data;
                    return Text(
                      'Halo $username,\nSelamat datang di Wi-Pos, temukan kemudahan di setiap langkah',
                      style: AppFont.blackText.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  ButtonGradient(
                    width: 200,
                    height: 50,
                    text: 'History Tracking',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const HistoryTrackingPage(),
                      //   ),
                      // );
                      Navigator.pushNamed(context, '/history');
                    },
                  ),
                  const SizedBox(width: 20),
                  ButtonGradient(
                    width: 200,
                    height: 50,
                    text: 'Tracking',
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SearchTrackingPage(),
                      //   ),
                      // );
                      Navigator.pushNamed(context, '/tracking');
                    },
                  ),
                ],
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
