
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>  {

var received = '';
sendUDP(String data) async {
  RawDatagramSocket udp = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 1234);
  udp.send(utf8.encode(data), InternetAddress('192.168.0.10'), 1234);
  }
receiveUDP() async {
  var mensagem = '';
  RawDatagramSocket udp = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 1234);

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
        break;
      case RawSocketEvent.closed:
        break;
      default:
        throw "Unexpected event $event";
    }
  });
  return mensagem;
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
          Text(  'CONTROLE DE CHOCADEIRAS ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:20,fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
  
  SizedBox(height: 80), 
     
          Card(
            elevation:10,child:
          Column(
             mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
            SizedBox(height: 10),
              Text(  'CHOCADEIRA 1 ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:20,fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
   SizedBox(height: 10), 
          Row(
       mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
             SizedBox(width: 10), 
               Center(
        child:  Icon(
      Icons.thermostat,
      color: Colors.green,
      size: 35.0,
   )),Center(
   child:Text(  'Temperatura: ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'),)),
    SizedBox(width: 30), 

 Text(received.toString(), textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:30,color:Colors.orange, fontFamily: 'Raleway'),),

  
  Text('°C', textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:25,fontFamily: 'Raleway'),),
  
  
   ],
  ),
         SizedBox(height: 20),
          const  Row(  mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[   SizedBox(width: 10), Icon(
      Icons.opacity,
      color: Colors.green,
      size: 35.0,
    ),
    SizedBox(width: 5), 
     Text('Umidade: ',textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'))]),
  SizedBox(height: 20),
  
        ])),
          Card(
            elevation:10,child:
          Column(
             mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
            SizedBox(height: 10),
              Text(  'CHOCADEIRA 2 ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:20,fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
   SizedBox(height: 10), 
          Row(
       mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
             SizedBox(width: 10), 
               Center(
        child:  Icon(
      Icons.thermostat,
      color: Colors.pink,
      size: 35.0,
   )),Center(
   child:Text(  'Temperatura: ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'),)),
    SizedBox(width: 30), 

 Text(received.toString(), textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:30,color:Colors.orange, fontFamily: 'Raleway'),),

  
  Text('°C', textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:25,fontFamily: 'Raleway'),),
  
  
   ],
  ),
         SizedBox(height: 20),
          const  Row(  mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[   SizedBox(width: 10), Icon(
      Icons.opacity,
      color: Colors.pink,
      size: 35.0,
    ),
    SizedBox(width: 5), 
     Text('Umidade: ',textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'))]),
  SizedBox(height: 20),
  
        ])),
          Card(
            elevation:10,child:
          Column(
             mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
            SizedBox(height: 10),
              Text(  'CHOCADEIRA 3 ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:20,fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
   SizedBox(height: 10), 
          Row(
       mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
             SizedBox(width: 10), 
               Center(
        child:  Icon(
      Icons.thermostat,
      color: Colors.blue,
      size: 35.0,
   )),Center(
   child:Text(  'Temperatura: ',
  textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'),)),
    SizedBox(width: 30), 

 Text(received.toString(), textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:30,color:Colors.orange, fontFamily: 'Raleway'),),

  
  Text('°C', textAlign: TextAlign.right,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:25,fontFamily: 'Raleway'),),
  
  
   ],
  ),
         SizedBox(height: 20),
          const  Row(  mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[   SizedBox(width: 10), Icon(
      Icons.opacity,
      color: Colors.blue,
      size: 35.0,
    ),
    SizedBox(width: 5), 
     Text('Umidade: ',textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style:  TextStyle(fontSize:18,fontFamily: 'Raleway'))]),
  SizedBox(height: 20),
  
        ])),

        //  ElevatedButton(
        //     style: style,
        //     onPressed:() {sendUDP('BOTÃO 1 PRESSIONADO');},
        //     child: const Text('Enviar dados'),
        //   ),
        //   const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed:() { 
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