
  import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';

Future ShowModelBottomSheet(EditProfileCubit cubit, dynamic context) {
    return  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180.0,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () {
                  cubit.pickImageFromCamera();
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  cubit.pickImageFromGallery();
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }