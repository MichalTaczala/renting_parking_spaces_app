import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_parking_app/cubits/add_parking_spot_cubit/add_parking_spot_cubit.dart';
import 'package:mobile_parking_app/cubits/add_parking_spot_cubit/add_parking_spot_state.dart';
import 'package:mobile_parking_app/pages/main_page/widgets/checkbox_with_text.dart';

class AddParkingSpotView extends StatefulWidget {
  const AddParkingSpotView({super.key});

  @override
  State<AddParkingSpotView> createState() => _AddParkingSpotViewState();
}

class _AddParkingSpotViewState extends State<AddParkingSpotView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressEditingController = TextEditingController();

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text(
        "Create new spot",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

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
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Price Per Day', icon: Text("\$")),
      onChanged: (value) {
        if (value.isEmpty) {
          return;
        }
        context
            .read<AddParkingSpotCubit>()
            .priceChanged(double.tryParse(value));
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a price';
        }
        return null;
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildAddressField(AddParkingSpotState state) {
    return GooglePlacesAutoCompleteTextFormField(
      key: const Key('addressField'),
      textEditingController: addressEditingController,
      validator: (value) {
        if (value == null || value.isEmpty || state.address == null) {
          return 'Please enter an address';
        }
        return null;
      },
      decoration: const InputDecoration(labelText: "Address"),
      googleAPIKey: dotenv.env['GOOGLE_MAPS_API_KEY']!,
      countries: const ["PL"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (prediction) {
        // this method will return latlng with place detail
        if (prediction.placeId == null ||
            prediction.placeId!.isEmpty ||
            prediction.description == null) {
          return;
        }
        context.read<AddParkingSpotCubit>().addressChanged(prediction.placeId!);
      }, // this callback is called when isLatLngRequired is true
      itmClick: (postalCodeResponse) {
        if (postalCodeResponse.description == null) {
          return;
        }
        addressEditingController.value = TextEditingValue(
          text: postalCodeResponse.description!,
        );
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

  Widget paddingVertical(Widget widget, {double padding = 8.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: widget,
    );
  }

  Widget _buildSize() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Width [m]'),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              context
                  .read<AddParkingSpotCubit>()
                  .widthChanged(double.tryParse(value));
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a width';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Length [m]'),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              context
                  .read<AddParkingSpotCubit>()
                  .lengthChanged(double.tryParse(value));
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Height [m]'),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              context
                  .read<AddParkingSpotCubit>()
                  .heightChanged(double.tryParse(value));
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a height';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxes(AddParkingSpotState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CheckboxWithText(
                onChanged: context.read<AddParkingSpotCubit>().changeIsSecured,
                value: state.isSecurity,
                text: "Is secured?",
              ),
            ),
            Expanded(
              flex: 1,
              child: CheckboxWithText(
                onChanged:
                    context.read<AddParkingSpotCubit>().changeIsEasyAccess,
                value: state.isEasyAccess,
                text: "Is easy access?",
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CheckboxWithText(
                onChanged: context.read<AddParkingSpotCubit>().changeIsCharger,
                value: state.isCharger,
                text: "Has charger?",
              ),
            ),
            Expanded(
              flex: 1,
              child: CheckboxWithText(
                onChanged: context.read<AddParkingSpotCubit>().changeIsInternal,
                value: state.isInternal,
                text: "Is internal?",
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddParkingSpotCubit, AddParkingSpotState>(
        builder: (context, state) {
      return LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTitle(),
                          paddingVertical(_buildNameField()),
                          paddingVertical(_buildDescriptionField()),
                          paddingVertical(_buildAddressField(state)),
                          paddingVertical(_buildPriceField()),
                          paddingVertical(_buildImagesField()),
                          paddingVertical(_buildSize()),
                          paddingVertical(_buildCheckboxes(state)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AddParkingSpotCubit>()
                                .addParkingSpot();
                            Navigator.of(context).pushReplacementNamed("/home");
                          }
                        },
                        child: const Text('Create Parking Spot'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
