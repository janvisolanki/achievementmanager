import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AchievementForm extends StatefulWidget {
  @override
  _AchievementFormState createState() => _AchievementFormState();
}

class _AchievementFormState extends State<AchievementForm> {
  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15), 
                        bottomRight: Radius.circular(15)
                      )
                    ),
                    child: _image != null
                      ? ClipRRect(
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                      )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15), 
                              bottomRight: Radius.circular(15)
                            )
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 400,
                margin: EdgeInsets.only(top: 10, bottom: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 8),
                    hintText: 'Enter category and description of achievement',
                  ),
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Color(0xff2F1E54),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// String _dropdownValue = 'AWS';
// List<String> _category = ['AWS', 'CCNA', 'Data Structure', 'Machine Learning'];

// DropdownButtonHideUnderline(
//   child: DropdownButton(
//       value: _dropdownValue,
//       items: _category.map((category) {
//         return DropdownMenuItem(
//           child: new Text(
//             category,
//             style: TextStyle(
//               fontSize: 20
//             ),
//           ),
//           value: category,
//         );
//       }).toList(),
//       onChanged: (value) {
//         setState(() {
//           _dropdownValue = value;
//         });
//       }),
// ),

// Container(
//   padding: EdgeInsets.all(10),
//   width: MediaQuery.of(context).size.width,
//   height: 250,
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.black, width: 5),
//     borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(40),
//         bottomRight: Radius.circular(40)),
//     shape: BoxShape.rectangle,
//     color: Colors.white,
//     image: DecorationImage(
//       fit: BoxFit.contain,
//       image: AssetImage('images/certificate.jpg'),
//     )
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(top: 10, left: 330),
//   child: CircleAvatar(
//     backgroundColor: Colors.black54,
//     child: IconButton(
//       icon: Icon(
//         Icons.camera_alt,
//         color: Colors.white,
//       ),
//       onPressed: () {},
//     ),
//   ),
// ),
