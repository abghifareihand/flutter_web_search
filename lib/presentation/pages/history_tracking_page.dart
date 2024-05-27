import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/components/responsive_widget.dart';
import '../../core/constants/fonts.dart';
import '../bloc/tracking_bloc/tracking_bloc.dart';

class HistoryTrackingPage extends StatefulWidget {
  const HistoryTrackingPage({super.key});

  @override
  State<HistoryTrackingPage> createState() => _HistoryTrackingPageState();
}

class _HistoryTrackingPageState extends State<HistoryTrackingPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrackingBloc>().add(GetTracking());
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
                mobile: buildDekstopContent(),
                tablet: buildDekstopContent(),
                desktop: buildDekstopContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDekstopContent() {
    return Center(
      child: Column(
        children: [
          Text(
            'Riwayat Data Pencarian',
            style: AppFont.blackText.copyWith(
              fontSize: 28,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          BlocBuilder<TrackingBloc, TrackingState>(
            builder: (context, state) {
              if (state is TrackingLoaded) {
                if (state.trackingResponse.data.isEmpty) {
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
                  rows: state.trackingResponse.data.map((tracking) {
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
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
