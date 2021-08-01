import 'package:crypto_converter_app/models/crypto_model.dart';
import 'package:crypto_converter_app/screens/android/android.dart';
import 'package:crypto_converter_app/services/crypto_services.dart';
import 'package:crypto_converter_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IosScreen extends StatefulWidget {
  const IosScreen({Key key}) : super(key: key);

  @override
  _IosScreenState createState() => _IosScreenState();
}

class _IosScreenState extends State<IosScreen> {
  List<Drop> l = [
    Drop(val: "USD"),
    Drop(val: "ALL"),
    Drop(val: "DZD"),
    Drop(val: "ARS"),
    Drop(val: "AMD"),
    Drop(val: "AUD"),
    Drop(val: "AZN"),
    Drop(val: "BHD"),
    Drop(val: "BDT"),
    Drop(val: "EUR"),
    Drop(val: "DOP"),
    Drop(val: "IDR"),
    Drop(val: "INR"),
    Drop(val: "JOD"),
    Drop(val: "KWD"),
    Drop(val: "NAD"),
    Drop(val: "PKR"),
    Drop(val: "ZAR"),
  ];
  Future<CryptoModel> crypto;
  bool val1 = false;
  int selectedValue = 0;
  String currencyname;
  @override
  void initState() {
    super.initState();
    crypto = CryptoService.getData(l[0].val);

    currencyname = l[0].val;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoSwitch(
            value: val1,
            activeColor: CupertinoColors.destructiveRed,
            onChanged: (val) {
              setState(() {
                val1 = val;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AndroidApp(),
                  ),
                );
              });
            },
          ),
          backgroundColor: Color(0xff355070),
          middle: Text(
            "🤑  Crypto Converter",
            style: GoogleFonts.lato(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Color(0xfff6bd60),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        getContainer("BCH", currencyname, 1),
                        SizedBox(
                          height: 10,
                        ),
                        getContainer("BTC", currencyname, 2),
                        SizedBox(
                          height: 10,
                        ),
                        getContainer("XRP", currencyname, 3),
                        SizedBox(
                          height: 10,
                        ),
                        getContainer("ETH", currencyname, 4),
                        SizedBox(
                          height: 10,
                        ),
                        getContainer("TRX", currencyname, 5),
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  color: Color(0xff355070),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 150,
                            child: CupertinoPicker(
                              backgroundColor: Color(0xff355070),
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  selectedValue = value;

                                  currencyname = l[value].val;
                                  crypto = CryptoService.getData(l[value].val);
                                });
                              },
                              itemExtent: 40.0,
                              children: [
                                Text(
                                  'USD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'ALL',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'DZD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'ARS',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'AMD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'AUD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'AZN',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'BHD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'BDT',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'EUR',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'DOP',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'IDR',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'INR',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'JOD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'KWD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'NAD',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'PKR',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                Text(
                                  'ZAR',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Select Currency",
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getContainer(String name, String currencyname, int val) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff012a4a),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              "1 ${name}        = ",
              style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).size.height * 0.020,
                  color: Colors.white),
            )),
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: crypto,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "?",
                    style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        color: Colors.white),
                  );
                }

                switch (val) {
                  case 1:
                    return Center(
                      child: Text(
                        snapshot.data.bch + " ${currencyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 2:
                    return Center(
                      child: Text(
                        snapshot.data.btc + " ${currencyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 3:
                    return Center(
                      child: Text(
                        snapshot.data.xrp + " ${currencyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 4:
                    return Center(
                      child: Text(
                        snapshot.data.eth + " ${currencyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 5:
                    return Center(
                      child: Text(
                        snapshot.data.trx + " ${currencyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
