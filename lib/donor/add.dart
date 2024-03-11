import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:donor/common/custom_button.dart';
import 'package:donor/common/custom_textfield.dart';
import 'package:donor/common/dropdown.dart';
import 'package:donor/global/global.dart';
import 'package:donor/global/snackdar.dart';
import 'package:donor/services/donor.dart';

class AddDonorPage extends StatefulWidget {
  static const routeName = '/register';
  AddDonorPage({super.key});
  @override
  _AddDonorPageState createState() => _AddDonorPageState();
}

class _AddDonorPageState extends State<AddDonorPage> {
  final DonorService _donorService = DonorService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _bloodGroup = 'a+';
  String _district = 'alappuzha';

  final _formKey = GlobalKey<FormState>();

  void _addDonor() async {
    try {
      _donorService.addDonor(
        context: context,
        name: _nameController.text,
        age: _ageController.text,
        address: _addressController.text,
        phoneNumber: _phoneNumberController.text,
        district: _district,
        bloodGroup: _bloodGroup,
      );
    } catch (e) {
      showSnackbar(context, 'error adding donor $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become a Donor'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextfield(
                  controller: _nameController,
                  hintText: 'Name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: _ageController,
                  hintText: 'Age',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  controller: _addressController,
                  hintText: 'Address',
                  maxlines: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {},
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                CustomDropdown(
                    listitem: listItem2,
                    hintText: 'select district',
                    selectedValue: _district,
                    onChanged: (String? value) {
                      setState(() {
                        _district = value!;
                      });
                    }),
                CustomDropdown(
                    listitem: listItem,
                    hintText: 'select Blood Group',
                    selectedValue: _bloodGroup,
                    onChanged: (String? newValue) {
                      setState(() {
                        _bloodGroup = newValue!;
                      });
                    }),
                SizedBox(height: 10.0),
                CustomButtom(
                    text: 'Register',
                    onclick: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        _addDonor();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
