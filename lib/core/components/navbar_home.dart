import 'package:flutter/material.dart';
import 'package:wifipos_web/data/datasources/auth_local_datasource.dart';
import 'package:wifipos_web/presentation/pages/download_page.dart';
import 'package:wifipos_web/presentation/pages/kontak_page.dart';
import 'package:wifipos_web/presentation/pages/landing_page.dart';
import 'package:wifipos_web/presentation/pages/tentang_page.dart';
import '../constants/fonts.dart';
import 'responsive_widget.dart';

class NavbarHome extends StatelessWidget {
  const NavbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopNavbar(),
      mobile: MobileNavbar(),
      tablet: DesktopNavbar(),
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
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Home',
              //     style: AppFont.blackText.copyWith(
              //       fontSize: 16,
              //       fontWeight: medium,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DownloadPage(),
                    ),
                  );
                },
                child: Text(
                  'Download',
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
              const SizedBox(width: 20),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                offset: const Offset(0, 60),
                iconSize: 40,
                icon: Image.asset(
                  'assets/images/user.png',
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: SizedBox(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          AuthLocalDatasource().removeAuthData();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LandingPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Logout',
                          style: AppFont.blackText.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                onPressed: () {},
                child: Text(
                  'Home',
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
                      builder: (context) => const DownloadPage(),
                    ),
                  );
                },
                child: Text(
                  'Download',
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
              PopupMenuButton(
                icon: Image.asset(
                  width: 70,
                  height: 70,
                  'assets/images/user.png',
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Logout'),
                      onTap: () {},
                    ),
                  ),
                ],
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
            child: Image.asset(
              width: 50,
              height: 50,
              'assets/images/user.png',
            ),
          ),
        ],
      ),
    );
  }
}
