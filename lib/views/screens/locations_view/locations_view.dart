import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/views/screens/locations_view/location_listview.dart';
import 'package:rick_and_morty/views/screens/locations_view/location_viewmodel.dart';
import 'package:rick_and_morty/views/widgets/appbar_widget.dart';
import 'package:rick_and_morty/views/widgets/decorated_container.dart';
import 'package:rick_and_morty/views/widgets/shimmer_loading_widget.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    super.initState();
    context.read<LocationViewmodel>().getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppBarWidget(
          title: 'Locations',
          transparentBackground: true,
        ),
        body: DecoratedContainer(
          topChild: const SizedBox(height: 74),
          child: _locationListView(),
        ),
      ),
    );
  }

  Widget _locationListView() {
    return Consumer<LocationViewmodel>(
      builder: (context, viewModel, child) {
        if (viewModel.locationModel == null) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const LocationShimmer(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: LocationListView(
              locationModel: viewModel.locationModel!,
              onLoadMore: viewModel.getMoreLocation,
              loadMore: viewModel.loadMore,
            ),
          );
        }
      },
    );
  }
}
