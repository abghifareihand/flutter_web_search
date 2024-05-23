import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/core/components/button_gradient.dart';
import 'package:wifipos_web/core/components/input_search.dart';
import 'package:wifipos_web/core/constants/fonts.dart';
import 'package:wifipos_web/data/datasources/auth_local_datasource.dart';
import '../../core/components/responsive_widget.dart';
import '../bloc/tracking_bloc/tracking_bloc.dart';
import 'landing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: ResponsiveWidget(
                mobile: buildMobileContent(),
                tablet: buildTabletContent(),
                desktop: buildDekstopContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileContent() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            width: 150,
            height: 150,
            'assets/images/user.png',
          ),
          const SizedBox(height: 20),
          FutureBuilder<String>(
            future: AuthLocalDatasource().getUsername(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final username = snapshot.data;
                return Text(
                  'Selamat datang, ${username?.toUpperCase()}',
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
          const SizedBox(height: 20),
          ButtonGradient(
            width: 150,
            height: 48,
            text: 'Logout',
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Apa kamu yakin mau logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AuthLocalDatasource().removeAuthData();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingPage(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: InputSearch(
                    controller: searchController,
                  ),
                ),
                const SizedBox(width: 16),
                ButtonGradient(
                  text: 'Search',
                  onPressed: () {
                    context
                        .read<TrackingBloc>()
                        .add(SearchTracking(query: searchController.text));
                  },
                  width: 100,
                  height: 48,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, state) {
              if (state is TrackingSearchLoaded) {
                if (state.listTracking.isEmpty) {
                  return Center(
                    child: Text(
                      'Data tidak ditemukan',
                      style: AppFont.blackText.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Username',
                          style: AppFont.blackText.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: AppFont.blackText.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Time',
                          style: AppFont.blackText.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Lokasi',
                          style: AppFont.blackText.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ],
                    rows: state.listTracking.map((tracking) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              tracking.username,
                              style: AppFont.blackText.copyWith(),
                            ),
                          ),
                          DataCell(
                            Text(
                              tracking.date,
                              style: AppFont.blackText.copyWith(),
                            ),
                          ),
                          DataCell(
                            Text(
                              tracking.time,
                              style: AppFont.blackText.copyWith(),
                            ),
                          ),
                          DataCell(
                            Text(
                              tracking.lokasi,
                              style: AppFont.blackText.copyWith(),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }

              if (state is TrackingSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const Center(
                child: SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTabletContent() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            width: 120,
            height: 120,
            'assets/images/user.png',
          ),
          const SizedBox(height: 20),
          FutureBuilder<String>(
            future: AuthLocalDatasource().getUsername(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final username = snapshot.data;
                return Text(
                  'Selamat datang, ${username?.toUpperCase()}',
                  style: AppFont.blackText.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 20),
          ButtonGradient(
            width: 150,
            height: 48,
            text: 'Logout',
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Apa kamu yakin mau logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AuthLocalDatasource().removeAuthData();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingPage(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 500,
            child: Row(
              children: [
                Expanded(
                  child: InputSearch(
                    controller: searchController,
                  ),
                ),
                const SizedBox(width: 16),
                ButtonGradient(
                  text: 'Search',
                  onPressed: () {
                    context
                        .read<TrackingBloc>()
                        .add(SearchTracking(query: searchController.text));
                  },
                  width: 100,
                  height: 48,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, state) {
              if (state is TrackingSearchLoaded) {
                if (state.listTracking.isEmpty) {
                  return Center(
                    child: Text(
                      'Data tidak ditemukan',
                      style: AppFont.blackText.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  );
                }
                return DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Username',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Time',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Lokasi',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ],
                  rows: state.listTracking.map((tracking) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            tracking.username,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.date,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.time,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.lokasi,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }

              if (state is TrackingSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const Center(
                child: SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildDekstopContent() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            width: 150,
            height: 150,
            'assets/images/user.png',
          ),
          const SizedBox(height: 20),
          FutureBuilder<String>(
            future: AuthLocalDatasource().getUsername(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final username = snapshot.data;
                return Text(
                  'Selamat datang, ${username?.toUpperCase()}',
                  style: AppFont.blackText.copyWith(
                    fontSize: 24,
                    fontWeight: medium,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 20),
          ButtonGradient(
            width: 150,
            height: 48,
            text: 'Logout',
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Apa kamu yakin mau logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AuthLocalDatasource().removeAuthData();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingPage(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 500,
            child: Row(
              children: [
                Expanded(
                  child: InputSearch(
                    controller: searchController,
                  ),
                ),
                const SizedBox(width: 16),
                ButtonGradient(
                  text: 'Search',
                  onPressed: () {
                    context
                        .read<TrackingBloc>()
                        .add(SearchTracking(query: searchController.text));
                  },
                  width: 100,
                  height: 48,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, state) {
              if (state is TrackingSearchLoaded) {
                if (state.listTracking.isEmpty) {
                  return Center(
                    child: Text(
                      'Data tidak ditemukan',
                      style: AppFont.blackText.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  );
                }
                return DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Username',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Time',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Lokasi',
                        style: AppFont.blackText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ],
                  rows: state.listTracking.map((tracking) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            tracking.username,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.date,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.time,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                        DataCell(
                          Text(
                            tracking.lokasi,
                            style: AppFont.blackText.copyWith(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }

              if (state is TrackingSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const Center(
                child: SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}