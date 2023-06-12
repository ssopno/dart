import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widget/common_text_field.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {



  @override
  Widget build(BuildContext context) {


    bool _switch = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Complete Profile',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Get Started with us with your details',
                style: subtitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              CommonTextField(
                controller: TextEditingController(),
                hintText: 'First Name',
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {},
              ),
              const SizedBox(
                height: 24,
              ),
              CommonTextField(
                controller: TextEditingController(),
                hintText: 'Last Name',
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {},
              ),
              const SizedBox(
                height: 24,
              ),
              CommonTextField(
                controller: TextEditingController(),
                hintText: 'Mobile',
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {},
              ),
              const SizedBox(
                height: 24,
              ),
              CommonTextField(
                controller: TextEditingController(),
                hintText: 'City',
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {},
              ),
              const SizedBox(
                height: 24,
              ),
              CommonTextField(
                controller: TextEditingController(),
                hintText: 'Shipping Address',
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {},
                maxlines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Complete'),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


