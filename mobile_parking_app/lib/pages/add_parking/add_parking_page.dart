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

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  late final List<File> _images;

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Name'),
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
      controller: _descriptionController,
      decoration: const InputDecoration(labelText: 'Description'),
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
      controller: _priceController,
      decoration: const InputDecoration(labelText: 'Price Per Day'),
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
      controller: _addressController,
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
    setState(() {
      _images = pickedFiles.map((e) => File(e.path)).toList();
    });
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
                // padding: const EdgeInsets.all(32.0),
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
                        _createParkingSpot();
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

  void _createParkingSpot() {
    ParkingDetailsModel newSpot = ParkingDetailsModel(
      name: _nameController.text,
      description: _descriptionController.text,
      images: _images,
      price: double.parse(_priceController.text),
      address: _addressController.text,
      currency: 'USD',
    );

    // Here you could save the new parking spot to a database or a state management solution
    print('Parking Spot Created: ${newSpot.name}');
    Navigator.pop(context); // Optionally close this page after creation
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
