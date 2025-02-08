import 'package:device_model/device_info.dart';
import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Information'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, String>>(
          future: getDeviceDetails(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) // to check the connection
              {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Device Model: ${snapshot.data!['Device Model']}'),
                    Text('OS Version: ${snapshot.data!['Operating System Version']}'),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}