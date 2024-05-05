

import 'package:flutter/material.dart';
import 'package:android_multicast_lock/android_multicast_lock.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>  {
InternetAddress multicastAddress = InternetAddress('244.1.1.1');
var received = 'vazio';
sendUDP(String data) async {
  
  RawDatagramSocket udp = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 1234);
  udp.send(utf8.encode(data), InternetAddress('192.168.0.10'), 1234);
  }
receiveUDP() async {
  var mensagem = '';
  final multicastLock = new MulticastLock();
  multicastLock.acquire();
  RawDatagramSocket udp = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 1234);
  udp.multicastHops = 1;
  udp.broadcastEnabled = true;
  udp.writeEventsEnabled = true;

  udp.listen((event) {
    
    switch (event) {
      case RawSocketEvent.read:
        final datagram = udp.receive();
        // debugPrint("${datagram?.data.runtimeType}");
       mensagem =  convertUint8ListToString(datagram?.data);
      print(mensagem);
      setState(() {
              received = mensagem;
              });
        // String s = new String.fromCharCodes(datagram?.data);
        // Parse `datagram.data`
        // udp.close();
        // multicastLock.release();
        break;
      case RawSocketEvent.closed:
        break;
      default:
        throw "Unexpected event $event";
    }
  });
  return mensagem;
  }


 

void receive() async {
    final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 1234);
    socket.multicastHops = 1;
    socket.broadcastEnabled = true;
    socket.writeEventsEnabled = true;
    socket.listen((RawSocketEvent event) {
      print("still listening...");

      final packet = socket.receive();
      print("The packet was $packet");
      print("It came from ${packet?.address}");
    });
  }

String convertUint8ListToString(uint8list) {
  return String.fromCharCodes(uint8list);
}


String mensagem = '';
  @override
  Widget build(BuildContext context) {
     
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
     
      return  Container(
      decoration: const BoxDecoration(color: Colors.white),
      child:Center(
      child:Card(elevation:0,child:
       Column(
    
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
                     new Container(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(minimum: 0.0, maximum: 1500.0, ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0.0, endValue: 300.0, color: Colors.blue),
                    GaugeRange(
                        startValue: 300.0, endValue: 750.0, color: Colors.orange),
                    GaugeRange(
                        startValue: 750.0, endValue: 1500.0, color: Colors.red)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value:  double.parse(received)?? double.parse('0.2'))
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                            child: Text(
                                "NH3\n" + "\n" +   "\n" +  "\n" +received + "ppm",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        angle: 90,
                        positionFactor: 0.1)
                  ])
                ],
              ),
            ),
     
          

        //  ElevatedButton(
        //     style: style,
        //     onPressed:() {sendUDP('BOTÃO 1 PRESSIONADO');},
        //     child: const Text('Enviar dados'),
        //   ),
        //   const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed:() { 
              // receive();
              receiveUDP();
            },
            child:  
            Text('Receber dados')
             ),
          // Container(
          //   height: 50,
          //   child:  
          //   Text(received.toString())
          //    ),
          
               ],)),),);}}



// import 'dart:io';

// void main(List<String> args){
//   RawDatagramSocket.bind(InternetAddress.ANY_IP_V4, 4444).then((RawDatagramSocket socket){
//     print('Datagram socket ready to receive');
//     print('${socket.address.address}:${socket.port}');
//     socket.listen((RawSocketEvent e){
//       Datagram d = socket.receive();
//       if (d == null) return;

//       String message = new String.fromCharCodes(d.data).trim();
//       print('Datagram from ${d.address.address}:${d.port}: ${message}');
//     });
//   });
// }



