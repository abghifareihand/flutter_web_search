import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/core/components/input_search.dart';
import 'package:wifipos_web/core/constants/fonts.dart';
import 'package:wifipos_web/data/datasources/history_local_datasource.dart';
import 'package:wifipos_web/presentation/bloc/tracking_bloc/tracking_bloc.dart';

import '../../core/components/button_gradient.dart';
import '../../core/components/responsive_widget.dart';

class SearchTrackingPage extends StatefulWidget {
  const SearchTrackingPage({super.key});

  @override
  State<SearchTrackingPage> createState() => _SearchTrackingPageState();
}

class _SearchTrackingPageState extends State<SearchTrackingPage> {
  final TextEditingController searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _buttonSearch(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context
          .read<TrackingBloc>()
          .add(SearchTracking(query: searchController.text));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<TrackingBloc>().add(ResetTracking());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0CBAF9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: ResponsiveWidget(
                mobile: buildMobileContent(),
                tablet: buildDekstopContent(),
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
          Text(
            'Silahkan Masukkan Username Untuk Tracking',
            style: AppFont.blackText.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: InputSearch(
                      controller: searchController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  ButtonGradient(
                    text: 'Search',
                    onPressed: () {
                      _buttonSearch(context);
                    },
                    width: 100,
                    height: 48,
                  ),
                ],
              ),
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

  Widget buildDekstopContent() {
    return Center(
      child: Column(
        children: [
          Text(
            'Masukkan Username Untuk Tracking',
            style: AppFont.blackText.copyWith(
              fontSize: 28,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 500,
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: InputSearch(
                      controller: searchController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  ButtonGradient(
                    text: 'Search',
                    onPressed: () {
                      _buttonSearch(context);
                    },
                    width: 100,
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, state) {
              if (state is TrackingSearchLoaded) {
                HistoryLocalDatasource().saveHistorySearch(state.listTracking);
                // _handleTrackingSearchResponse(state.listTracking);
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
