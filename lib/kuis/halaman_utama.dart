import 'package:flutter/material.dart';

import 'halaman_detail.dart';
import 'data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Buku'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: listBuku.length,
          itemBuilder: (context, index){
            final DataBuku place = listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> HalamanDetail(buku : place,),),
                );
              },
              child: Card(
                  child: Row(
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width/3,
                        height:MediaQuery.of(context).size.width/3,
                        child: Image.network(place.imageLink),
                      ),
                      Text(place.title),
                    ],
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
