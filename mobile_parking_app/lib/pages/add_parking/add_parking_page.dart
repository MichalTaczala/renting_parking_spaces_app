import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_parking_app/cubits/add_parking_spot_cubit/add_parking_spot_cubit.dart';
import 'package:mobile_parking_app/cubits/add_parking_spot_cubit/add_parking_spot_state.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';

class AddParkingScreen extends StatelessWidget {
  const AddParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FlaskRepository(),
      child: BlocProvider(
        create: (context) =>
            AddParkingSpotCubit(context.read<FlaskRepository>()),
        child: const AddParkingPage(),
      ),
    );
  }
}

class AddParkingPage extends StatefulWidget {
  const AddParkingPage({super.key});

  @override
  State<AddParkingPage> createState() => _AddParkingPageState();
}

class _AddParkingPageState extends State<AddParkingPage> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      onChanged: context.read<AddParkingSpotCubit>().nameChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name for the parking spot';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Description'),
      onChanged: context.read<AddParkingSpotCubit>().descriptionChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a description for the parking spot';
        }
        return null;
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Price Per Day'),
      onChanged: (value) {
        context.read<AddParkingSpotCubit>().priceChanged(double.parse(value));
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a price';
        }
        return null;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      onChanged: context.read<AddParkingSpotCubit>().addressChanged,
      decoration: const InputDecoration(labelText: 'Address'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an address';
        }
        return null;
      },
    );
  }

  Future _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(limit: 10);
    if (pickedFiles.isNotEmpty) {
      if (!mounted) return;
      context.read<AddParkingSpotCubit>().imagesChanged(
            pickedFiles
                .map(
                  (file) => File(file.path),
                )
                .toList(),
          );
    }
  }

  Widget _buildImagesField() {
    return ElevatedButton(
      onPressed: _getImageFromGallery,
      child: const Text('Add Images'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddParkingSpotCubit, AddParkingSpotState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  _buildNameField(),
                  _buildDescriptionField(),
                  _buildPriceField(),
                  _buildAddressField(),
                  const SizedBox(height: 20),
                  _buildImagesField(),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AddParkingSpotCubit>().addParkingSpot();
                      }
                    },
                    child: const Text('Create Parking Spot'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _createParkingSpot(AddParkingSpotState state) {
    ParkingDetailsModel newSpot = ParkingDetailsModel(
      name: state.name,
      description: state.description,
      images: state.images,
      price: state.price,
      address: state.address,
      currency: 'USD',
    );
    Navigator.pop(context); // Optionally close this page after creation
  }

  @override
  void dispose() {
    super.dispose();
  }
}
