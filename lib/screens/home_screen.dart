import 'dart:convert';

import 'package:api_task_app/model/location_model.dart';
import 'package:api_task_app/screens/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationModel? locationModel;

  @override
  void initState() {
    // TODO: implement initState
    getLocationAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        centerTitle: true,
      ),
      body: locationModel == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: locationModel!.results!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataScreen(
                        info: locationModel!.info,
                        results: locationModel!.results![index],
                      ),
                    ),
                  );
                },
                tileColor: Colors.green,
                title: Text(
                  'LocationName :  ${locationModel!.results![index].name}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
    );
  }

  getLocationAPI() async {
    var client = http.Client();
    try {
      Response response = await client.get(Uri.parse("https://rickandmortyapi.com/api/location"));
      if (response.statusCode == 200) {
        locationModel = LocationModel.fromJson(jsonDecode(response.body));
        debugPrint("characterModal -------------->>> ${locationModel!.toJson()}");
        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }
}
// https://rickandmortyapi.com/api/location
