import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'thank_you_screen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Form key to manage form state
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text indicating the purpose of the form
              Text(
                'Enter Your Information:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // TextFormField for entering name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // TextFormField for entering email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add more email validation logic here if needed
                  return null;
                },
              ),
              SizedBox(height: 16),
              // TextFormField for entering phone number
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // Add more phone number validation logic here if needed
                  return null;
                },
              ),
              SizedBox(height: 16),
              // TextFormField for entering card number
              TextFormField(
                controller: cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Row containing TextFormField for entering expiry date and CVV
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expiryDateController,
                      decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: cvvController,
                      decoration: InputDecoration(labelText: 'CVV'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        // Add more CVV validation logic here if needed
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Button to trigger payment process
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the payment
                    // Once payment is successful, navigate to the ThankYouScreen
                    Navigator.pushNamed(context, '/thank_you');
                  }
                },
                child: Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
