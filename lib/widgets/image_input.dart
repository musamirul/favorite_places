import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//StatefulWidget to update ui and manage state
class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async{
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if(pickedImage == null){
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });


  }
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: Icon(Icons.camera),
      label: Text('Take Picture'),
    );

    if(_selectedImage != null){
      content = Image.file(_selectedImage!, fit: BoxFit.cover, width: double.infinity,);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Theme.of(context).colorScheme.primary.withOpacity(0.2))
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child:content,
    );
  }
}
