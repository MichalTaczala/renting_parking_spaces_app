import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_parking_app/cubits/main_data/main_data_cubit.dart';
import 'package:mobile_parking_app/cubits/main_data/main_data_state.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/pages/main_page/widgets/garage_tile.dart';
import 'package:mobile_parking_app/utils/location_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ChooseParkingView extends StatefulWidget {
  const ChooseParkingView({super.key});

  @override
  State<ChooseParkingView> createState() => _ChooseParkingViewState();
}

class _ChooseParkingViewState extends State<ChooseParkingView> {
  Location locationController = Location();

  Widget _buildTitle() {
    return const Text(
      "ParkNest",
      style: TextStyle(
        fontSize: 60,
      ),
    );
  }

  Widget _buildLocationChooseButton(MainDataState state) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.location_on_outlined),
      label: Text(
        state.choosenLocationForGarageName ?? "Where?",
      ),
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context1) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final location =
                      await fetchCurrentLocation(locationController);
                  if (!mounted) return;
                  if (location != null) {
                    if (!context1.mounted) return;
                    Navigator.of(context1).pop();
                    context
                        .read<MainDataCubit>()
                        .setLocationAndFetchParkingSpots(
                          location,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Location not found",
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Current location",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final location =
                      await Navigator.of(context).pushNamed("/maps") as LatLng?;
                  if (!mounted) return;
                  if (location != null) {
                    if (!context1.mounted) return;
                    Navigator.of(context1).pop();
                    context
                        .read<MainDataCubit>()
                        .setLocationAndFetchParkingSpots(
                          location,
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Location not found",
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Choose on map",
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDateChooseButton(MainDataState state) {
    return ElevatedButton.icon(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context1) {
          return SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            showActionButtons: true,
            onCancel: Navigator.of(context1).pop,
            onSubmit: (Object? pickerDateRange) {
              context.read<MainDataCubit>().setDateRangeAndFetchParkingSpots(
                    pickerDateRange as PickerDateRange,
                  );
              Navigator.of(context1).pop();
            },
            extendableRangeSelectionDirection:
                ExtendableRangeSelectionDirection.forward,
            initialSelectedRange: PickerDateRange(
              DateTime.now(),
              DateTime.now().add(
                const Duration(
                  days: 5,
                ),
              ),
            ),
            enablePastDates: false,
          );
        },
      ),
      icon: const Icon(Icons.date_range_outlined),
      label: Text(
        state.startDate == null || state.endDate == null
            ? "When?"
            : "${state.startDate.toString().substring(0, 10)} - ${state.endDate.toString().substring(0, 10)}",
      ),
    );
  }

  Widget _buildListOfGarages() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            "/parkingDetails",
            arguments: ParkingDetailsModel(
              id: "id",
              name: "name",
              address: "address",
              phone: "phone",
              email: "email",
              images: [],
              description: "description",
              latitude: "latitude",
              longitude: "longitude",
              price: 21.37,
              currency: "USD",
              rating: "rating",
              distance: "distance",
            ),
          ),
          child: const GarageTile(
            address: "a",
            cost: "a",
            dateRange: "a",
            imagelink: "a",
          ),
        );
      },
      padding: EdgeInsets.zero,
      itemCount: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDataCubit, MainDataState>(
      builder: (context, state) {
        var children = <Widget>[
          const SizedBox(
            height: 20,
          ),
          _buildTitle(),
          Row(
            children: [
              Expanded(child: _buildDateChooseButton(state)),
              Expanded(
                child: _buildLocationChooseButton(state),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _buildListOfGarages(),
          ),
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
      },
    );
  }
}
