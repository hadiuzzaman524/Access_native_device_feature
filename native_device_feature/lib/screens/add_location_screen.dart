import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_device_feature/providers/items.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systempath;
import 'dart:io';
import 'package:provider/provider.dart';

class AddLocaionScreen extends StatefulWidget {
  static const routeName = '/AddLocationScreen';

  @override
  _AddLocaionScreenState createState() => _AddLocaionScreenState();
}

class _AddLocaionScreenState extends State<AddLocaionScreen> {
  String address;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    //used this getImage using Image_Picker package
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = null;
      }
    });

    final appDirectory = await systempath.getApplicationDocumentsDirectory();
    /*
    systempath.getApplicationDocumentDirectory() return memory card location which
    data can be store.
     */
    final fileName = path.basename(_image.path);
    /*
    path.basename() uses for get image name.
     */
    final savedImage = await _image.copy('${appDirectory.path}/$fileName');
    /*
    finaley copy image into applicationdirectory/filename.ext
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: _image == null
                              ? Center(
                                  child: Text("No Image"),
                                )
                              : Image.file(
                                  _image,
                                  height: 150,
                                  width: 150,
                                ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: () {
                            getImage();
                          },
                          icon: Icon(Icons.camera),
                          label: Text('Take a Picture'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            color: Colors.amber,
            onPressed: () {
              Provider.of<ItemProvider>(context, listen: false)
                  .addItem(address, _image);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.add),
            label: Text("Add Location"),
          ),
        ],
      ),
    );
  }
}
