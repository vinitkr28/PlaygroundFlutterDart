import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:rough_board/detail_model.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var config = Configuration.local([DetailModel.schema]);
    Realm realm;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Detail"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Name"),
            controller: nameController,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              realm = Realm(config);
              realm.write(() => {
                realm.all().changes.listen((event) {
                  print("Data");
                })
              });
              /*realm.all<DetailModel>().changes.listen((event) {
                print("Data");
              });*/
              Future.delayed(const Duration(seconds: 1));
              var detailModel = DetailModel("name");
              realm.write(() => () {
                    detailModel.name = nameController.text;
                  });
              realm.add(detailModel);
            },
            child: const Text("Add data"),
          ),
          SizedBox(height: 30,),
          GestureDetector(onTap: () {
            print("Getting all ");
            realm = Realm(config);
            var mm = realm.all<DetailModel>();
            print("There are ${mm.length} models.\nFirst: ${mm[0].name}");
          }, child: Text("Get all data"))
        ],
      ),
    );
  }
}
