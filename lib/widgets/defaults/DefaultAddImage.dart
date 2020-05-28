import 'dart:io';
import 'dart:async';
import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class DefaultAddImage extends StatefulWidget {
  final Function(File) imagePicked;

  const DefaultAddImage({Key key, this.imagePicked}) : super(key: key);

  @override
  _DefaultAddImageState createState() => _DefaultAddImageState();
}

class _DefaultAddImageState extends State<DefaultAddImage> {
  File _image;

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);
    widget.imagePicked(image);

    setState(() {
      _image = image;
    });

    await _cropImage(_image);
  }

  Future<void> _cropImage(File image) async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: image.path,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Är nöjd med din bild?',
          toolbarColor: Colors.primary,
          cropFrameColor: Colors.primary,
          cropGridColor: Colors.primary,
          activeControlsWidgetColor: Colors.primary,
          backgroundColor: Colors.white,
          toolbarWidgetColor: Colors.primary),
      iosUiSettings: IOSUiSettings(
        title: 'Cropper',
      ),
    );

    setState(() {
      _image = cropped ?? image;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hämta bild från?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                color: Colors.primary,
                child: Text('Galleri'),
                onPressed: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Colors.primary,
                child: Text('Ta foto'),
                onPressed: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _image == null
              ? AssetImage("lib/assets/transparent.png")
              : FileImage(
                  _image,
                ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: 2.0,
          color: _image == null ? Colors.grey : Colors.primary,
        ),
      ),
      child: IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.grey,
          size: _image == null ? 40 : 0,
        ),
        onPressed: () {
          _showMyDialog();
        },
      ),
    );
  }
}
