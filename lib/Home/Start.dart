//Librerias para acceso a elementos de interfaz
import 'package:agrogob/provider/user_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:agrogob/provider/user_mode.dart';

//Clase Principal
class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

        body: Startful()
    );
  }
}

//Clase extendida
class Startful extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _Startful();
  }
}

//Clase de componentes
class _Startful extends State<StatefulWidget>{
//Sockets
  late IO.Socket socket;
  //Variables de carga visual
  String ubi= 'Guadalupe, Zac';
  String qna= '1';
  String date = '12/01/2023';
  String humedad = '';


//metodo de socket para carga y visualziación de datos
  void connect (){
    socket = IO.io("https://53da-2806-102e-b-12b-d1a0-1231-d868-d431.ngrok.io",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    //socket.onConnect((data) => print("Connected"));
    socket.onConnect((_) {
      print("Connected");
      //readline().listen((String line) => socket.emit('stream', line));
    });
   // socket.on('msg', (data) => _printFromServer(data));
    socket.onConnectError((data) => print('Connected Error: $data'));
   //print(socket.connected);

    socket.on("message", (data) =>
    { // print(data),
      humedad = data,
      _showToast()
    }
    );
  }


//Metodo de notifiación mediante toast
  late FToast fToast;

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent[750],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_alert_rounded),
          SizedBox(
            width: 12.0,
          ),
          Text(humedad,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow[750],
              fontSize: 13,
            ),),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 1),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 18.0,
            left: 18.0,
          );
        });
  }
//Iluminado de datos y documentación

  //Humedad
  Map<String, double> dataMap = {
    "Actual": 60,
   // "Máxima": 300,
    "Faltante": 40
  };
  List<Color> colorList = [
    const Color(0xFF00EC2F),
  //  const Color(0xFFFF0D00),
  //  const Color(0xFFF3FA1E),
    const Color(0xFFFF0D00),
  ];
  // Nitrogeno
  Map<String, double> dataMapNitro = {
    "Actual": 3.4,
  //  "Optima": 8.5,
    "Faltante": 6.6
  };
  List<Color> colorListNitro = [
    const Color(0xFFB9C116),
  //  const Color(0xFF00EC2F),
    const Color(0xFFFF0D00),
  ];
  // Fosforo
  Map<String, double> dataMapFosfo = {
    "Actual": 1.31,
  //  "Optima": 6.41,
    "Faltante": 8.69
  };
  List<Color> colorListFosfo = [
    const Color(0xFFB9C116),
   // const Color(0xFF00EC2F),
    const Color(0xFFFF0D00),
  ];
  // Potasio
  Map<String, double> dataMapPota = {
    "Actual": 3.5,
 //   "Optima": 9.5,
    "Faltante": 6.5
  };
  List<Color> colorListPota = [
    const Color(0xFFB9C116),
   // const Color(0xFF00EC2F),
    const Color(0xFFFF0D00),
  ];

  @override
  Widget build(BuildContext context) {
    //provider para intercambio de datos en toast
    final usermode = Provider.of<UserMode>(context);
    usermode.humedad = humedad;
    fToast = FToast();
    fToast.init(context);
    //alerta ();
    connect();
    //Elementos de widgets
    return Scaffold(
      //color: Colors.redAccent[750],//!.withOpacity(0.57),
      //color: Colors.yellow[750],
        appBar: AppBar(
          title: Text('TOMATE'),
          backgroundColor: Colors.redAccent[750],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                // <-- SEE HERE
                decoration: BoxDecoration(
                  color: const Color(0xFF822140),
                ),
                accountName:
                Text(
                  'Agricultor 1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                accountEmail:
                Text(
                  'Agricultor@gob.mx',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
                currentAccountPicture: Icon(Icons.account_circle_outlined, size: 80, color: Colors.yellow[750],),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.apple_outlined),
                title: const Text('Cosechas'),
                onTap: () {
                  // Navigator.pushReplacementNamed(context, '/categorias');
                },
              ),
              ListTile(
                leading: Icon(Icons.house_siding),
                title: const Text('Invernaderos'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.data_thresholding_outlined),
                title: const Text('Datos'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Perfil'),
                onTap: () {

                },
              ),
              SizedBox(
                //Use of SizedBox
                height: 280,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Cerrar Sesión'),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                  //Con esta linea sale y no puede regresar al menu, porque se cierra la app
                },
              ),
            ],

          ),
        ),
        body: Container(color:Colors.white,
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.all(38),
            children: <Widget>[
              Text(
                'Cultivo de Tomate',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset('assets/tomate1.png'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Información de Cultivo',
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          //Use of SizedBox
                          height: 9,
                        ),
                        Text(
                          'Ubicación: '+ubi,
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          //Use of SizedBox
                          height: 5,
                        ),
                        Text(
                          'Quincena: # '+qna,
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          //Use of SizedBox
                          height: 5,
                        ),
                        Text(
                          'Fecha: '+date,
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          //Use of SizedBox
                          height: 5,
                        ),

                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                //Use of SizedBox
                height: 20,
              ),
              Text(
                'Detalles de Humedad',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 5,
              ),
              PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width/2,
                centerText: "Humedad",
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              Text(
                'Descripción de Nutrientes',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 15,
              ),

              Text(
                'Nitrogeno',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 30,
              ),
              PieChart(
                dataMap: dataMapNitro,
                colorList: colorListNitro,
                chartRadius: MediaQuery.of(context).size.width/2,
                centerText: "Nitrógeno",
              ),
              Text(
                'Fósforo',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 30,
              ),
              PieChart(
                dataMap: dataMapFosfo,
                colorList: colorListFosfo,
                chartRadius: MediaQuery.of(context).size.width/2,
                centerText: "Fósforo",
              ),
              Text(
                'Potasio',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                //Use of SizedBox
                height: 30,
              ),
              PieChart(
                dataMap: dataMapPota,
                colorList: colorListPota,
                chartRadius: MediaQuery.of(context).size.width/2,
                centerText: "Potasio",
              ),



            ],
          ),


        )

    );
  }

}

Stream<String> readline() => stdin
    .transform(utf8.decoder)
    .transform(const LineSplitter());

void _printFromServer(String message) => print(message);

