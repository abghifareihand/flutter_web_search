import 'package:flutter/material.dart';
import 'package:wifipos_web/core/components/button_gradient.dart';
import 'package:wifipos_web/presentation/pages/download_page.dart';
import 'package:wifipos_web/presentation/pages/kontak_page.dart';
import 'package:wifipos_web/presentation/pages/login_page.dart';
import 'package:wifipos_web/presentation/pages/tentang_page.dart';
import '../constants/fonts.dart';
import 'responsive_widget.dart';

class NavbarLanding extends StatelessWidget {
  const NavbarLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopNavbar(),
      mobile: MobileNavbar(),
      tablet: TabletNavbar(),
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/wipos_logo.png',
            height: 48,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KontakPage(),
                    ),
                  );
                },
                child: Text(
                  'Kontak',
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TentangPage(),
                    ),
                  );
                },
                child: Text(
                  'Tentang',
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(width: 40),
              ButtonGradient(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                width: 100,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletNavbar extends StatelessWidget {
  const TabletNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/wipos_logo.png',
            height: 48,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KontakPage(),
                    ),
                  );
                },
                child: Text(
                  'Kontak',
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TentangPage(),
                    ),
                  );
                },
                child: Text(
                  'Tentang',
                  style: AppFont.blackText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(width: 40),
              ButtonGradient(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                width: 100,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/wipos_logo.png',
            height: 48,
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.blue),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )
        ],
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'Home',
              style: AppFont.blackText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Download',
              style: AppFont.blackText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DownloadPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Kontak',
              style: AppFont.blackText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KontakPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Tentang',
              style: AppFont.blackText.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TentangPage(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ButtonGradient(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              width: double.infinity,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
