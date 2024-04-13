// ignore_for_file: unused_import

import 'package:awesome_dialog/awesome_dialog.dart' show AnimType, AwesomeDialog, DialogType;
import 'package:flutter/material.dart';
import 'package:ntt_travel/pages/pembayaran.dart';
import 'package:ntt_travel/utils/var_global.dart';

class DetailPage extends StatefulWidget {
  final String img, title, deskripsi, harga;
  final List data_ulasan;

  const DetailPage(
      {super.key,
      required this.img,
      required this.title,
      required this.deskripsi,
      required this.harga,
      required this.data_ulasan});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List data_ulasan = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data_ulasan);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 10),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.deskripsi,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          Text(
                            'Rating',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.data_ulasan.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                          widget.data_ulasan[index]['user'])),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(widget.data_ulasan[index]
                                            ['ulasan']),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(widget.data_ulasan[index]
                                                    ['rating']
                                                .toString()),
                                            Icon(
                                              Icons.star,
                                              size: 27,
                                              color: Colors.amber,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: ,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
        // color: Colors.amber,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => PembayaranPage(),
                  //     ));
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        widget.harga,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow()],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.purple, Colors.purple.shade200])),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: IconButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          body: Column(
                            children: [
                              Text('Pesan tempat?'),
                              Text(
                                widget.harga,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pembayaran(),
                                ));
                          },
                        ).show();
                      },
                      icon: Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.white,
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
