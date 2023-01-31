import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homestay_raya/models/homestay.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/user.dart';
import '../serverconfig.dart';

class HomestayDetails extends StatefulWidget {
  final HomeStay homeStay;
  final User user;
  final User seller;
  const HomestayDetails(
      {super.key,
      required this.homeStay,
      required this.user,
      required this.seller});

  @override
  State<HomestayDetails> createState() => _HomestayDetailsState();
}

class _HomestayDetailsState extends State<HomestayDetails> {
  late double screenHeight, screenWidth, resWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 150) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.90;
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Center(child: Text("Details"))),
      body: Column(
        children: [
          Container(
              height: 225,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Row(children: [
                  Card(
                    elevation: 8,
                    child: Container(
                        height: screenHeight / 3,
                        width: resWidth,
                        child: CachedNetworkImage(
                          width: resWidth,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${ServerConfig.SERVER}assets/productimages/${widget.homeStay.homestayId}.png",
                          placeholder: (context, url) =>
                              const LinearProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                  ),
                  Card(
                    elevation: 8,
                    child: Container(
                        height: screenHeight / 3,
                        width: resWidth,
                        child: CachedNetworkImage(
                          width: resWidth,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${ServerConfig.SERVER}assets/productimages/${widget.homeStay.homestayId}.png",
                          placeholder: (context, url) =>
                              const LinearProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                  ),
                  Card(
                    elevation: 8,
                    child: Container(
                        height: screenHeight / 3,
                        width: resWidth,
                        child: CachedNetworkImage(
                          width: resWidth,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${ServerConfig.SERVER}assets/productimages/${widget.homeStay.homestayId}.png",
                          placeholder: (context, url) =>
                              const LinearProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                  ),
                ])
              ])),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            width: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.indigo,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.homeStay.homestayName.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: screenWidth - 16,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Table(
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.none,
                            width: 1),
                        columnWidths: const {
                          0: FixedColumnWidth(100),
                          1: FixedColumnWidth(200),
                        },
                        children: [
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Description',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.homeStay.homestayDesc.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("RM ${widget.homeStay.homestayPrice}",
                                      style: const TextStyle(fontSize: 18))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Available',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${widget.homeStay.homestayQty}" +
                                          " Homestay",
                                      style: const TextStyle(fontSize: 18))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Locality',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.homeStay.homestayLocal}",
                                      style: const TextStyle(fontSize: 18))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('State',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.homeStay.homestayState}",
                                      style: const TextStyle(fontSize: 18))
                                ]),
                          ]),
                          TableRow(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Owner',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.seller.name}",
                                      style: const TextStyle(fontSize: 18))
                                ]),
                          ])
                        ]),
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Card(
                child: SizedBox(
                  child: Container(
                    color: Color.fromARGB(255, 187, 188, 190),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            iconSize: 32,
                            onPressed: _makePhoneCall,
                            icon: const Icon(Icons.call),
                            color: Colors.black),
                        IconButton(
                            iconSize: 32,
                            onPressed: _makeSmS,
                            icon: const Icon(Icons.message),
                            color: Colors.black),
                        IconButton(
                            iconSize: 32,
                            onPressed: openwhatsapp,
                            icon: const Icon(Icons.whatsapp),
                            color: Colors.black),
                        IconButton(
                            iconSize: 32,
                            onPressed: _onRoute,
                            icon: const Icon(Icons.map),
                            color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.seller.phone,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeSmS() async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: widget.seller.phone,
    );
    await launchUrl(launchUri);
  }

  Future<void> _onRoute() async {
    final Uri launchUri = Uri(
        scheme: 'https',
        // ignore: prefer_interpolation_to_compose_strings
        path: "www.google.com/maps/@" +
            widget.homeStay.homestayLat.toString() +
            "," +
            widget.homeStay.homestayLng.toString() +
            "20z");
    await launchUrl(launchUri);
  }

  openwhatsapp() async {
    var whatsapp = widget.seller.phone;
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=hello";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    }
  }

  int generateIds() {
    var rng = Random();
    int randomInt;
    randomInt = rng.nextInt(100);
    return randomInt;
  }
}
