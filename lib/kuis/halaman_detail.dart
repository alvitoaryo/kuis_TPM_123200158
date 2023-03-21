import 'package:flutter/material.dart';
import 'data_buku.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;
  const HalamanDetail({Key? key, required this.buku}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.buku.title),
              centerTitle: true,
                actions: <Widget>[
                  IconButton(icon: new Icon(Icons.search, color: Colors.white),
                  onPressed:(){
                    // Future<void> _launchURL(link) async {
                    //   if (await canLaunch(link)) {
                    //     await launch(link);
                    //   } else {
                    //     throw 'Could not launch $link';
                    //   }
                    // }
                      },
                  ),
                 ],
            ),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        // child: PageView.builder(
                        //   scrollDirection: Axis.vertical,
                        //   itemCount: widget.buku.imageLink.length,
                        //   itemBuilder:(context) {
                        //     return Container(
                        //       padding: EdgeInsets.symmetric(vertical: 8),
                        child: Image.network(widget.buku.imageLink),
                        //     );
                        //   },
                        //   pageSnapping: true,
                        // ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('judul                    : ' + widget.buku.title),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Penulis                  : ' + widget.buku.author),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Bahasa                  : ' + widget.buku.language),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Negara                  : ' + widget.buku.country),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Jumlah Halaman    : ' + widget.buku.pages.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Tahun terbit        : ' + widget.buku.year.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Status                : ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  widget.buku.isAvailable ? 'Tersedia' : 'Tidak Tersedia',
                                  style: TextStyle(
                                    color: widget.buku.isAvailable? Colors.green : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: 0.95 * MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: widget.buku.isAvailable
                            ? () {
                          setState(() {
                            widget.buku.isAvailable = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Berhasil Meminjam Buku'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                            : null,
                        child: Text(widget.buku.isAvailable ? 'Pesan' : 'Pesan'),
                        style: ElevatedButton.styleFrom(
                          primary: widget.buku.isAvailable ? Colors.blue : Colors.grey,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.95,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Text(
                    //             'Deskripsi',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Text(widget.buku.description),
                    //       SizedBox(height: 10.0),
                    //     ],
                    //   ),
                    // ),
                  ],
                )
            )
        ));
  }
}
