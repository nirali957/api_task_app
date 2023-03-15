import 'package:flutter/material.dart';

import '../model/location_model.dart';

class DataScreen extends StatelessWidget {
  final Results? results;
  final Info? info;

  const DataScreen({Key? key, this.results, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${results!.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      decoration: TextDecoration.underline,
                    )),
                const SizedBox(height: 16),
                Text('\nID: ${results!.id}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('pages: ${info!.pages}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('count: ${info!.count}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('type: ${results!.type}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('dimension: ${results!.dimension}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\n==>created: ${results!.created}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('==>url: ${results!.url}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('==>residents: ${results!.residents}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\n\n\n==>next: ${info!.next}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\n==>prev: ${info!.prev}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
