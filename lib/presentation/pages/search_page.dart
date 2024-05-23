import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/data/models/tracking_response_model.dart';

import '../bloc/tracking_bloc/tracking_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: BlocBuilder<TrackingBloc, TrackingState>(
        builder: (context, state) {
          if (state is TrackingLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TrackingSearchLoaded) {
            return buildSearchResultList(state.listTracking);
          } else if (state is TrackingError) {
            return Center(child: Text(state.message));
          } else {
            return buildSearchField(context);
          }
        },
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Enter keyword',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              String query = _searchController.text;
              // Memicu event pencarian ketika tombol pencarian ditekan
              BlocProvider.of<TrackingBloc>(context).add(SearchTracking(query: query));
            },
          ),
        ),
      ),
    );
  }

  Widget buildSearchResultList(List<Data> searchResults) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final data = searchResults[index];
        return ListTile(
          title: Text(data.username),
          subtitle: Text('Time: ${data.time}'),
          // Tambahkan widget lain sesuai kebutuhan
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
