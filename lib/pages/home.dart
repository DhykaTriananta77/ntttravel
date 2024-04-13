// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ntt_travel/pages/detail.dart';
import 'package:ntt_travel/pages/drawer.dart';
import 'package:ntt_travel/pages/search.dart';

import '../utils/var_global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.transparent,
        child: DrawerScren(),
      ),
      appBar: AppBar(
        title: Text('Beranda'),
        actions: [
         
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: VarGlobal.data.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        img: VarGlobal.data[index]['img'],
                        title: VarGlobal.data[index]['title'],
                        deskripsi: VarGlobal.data[index]['deskripsi'],
                        harga: VarGlobal.data[index]['harga'],
                        data_ulasan: VarGlobal.data[index]['ulasan'],
                      ),
                    ));
              },
              child: Container(
                height: 90,
                margin: EdgeInsets.only(bottom: 20),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.5),
                        blurRadius: 5,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          VarGlobal.data[index]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            VarGlobal.data[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            VarGlobal.data[index]['deskripsi'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              VarGlobal.data[index]['harga'],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),

    );
  }
}
