import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'color_theme.dart';
import 'adaptive_text_size.dart';
import 'text_style_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  int ayamKatsu = 0, ayamSlam = 0, blueBlood = 0, darkChocolate = 0;
  int hayamKatsu = 11000,
      hayamSlam = 9000,
      hblueBlood = 8000,
      hdarkChocolate = 12000;
  int voucher = 0;
  bool beli = false, useVoucher = false;
  final TextEditingController _controllerAyamKatsu = TextEditingController();
  final TextEditingController _controllerAyamSlam = TextEditingController();
  final TextEditingController _controllerBlueLava = TextEditingController();
  final TextEditingController _controllerDarkChoco = TextEditingController();
  final TextEditingController _controllerVoucher = TextEditingController();

  Future<void> _showMyDialog(String pesan) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(pesan),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Yakin'),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  ayamKatsu = 0;
                  ayamSlam = 0;
                  blueBlood = 0;
                  darkChocolate = 0;
                  _controllerAyamKatsu.text = "";
                  _controllerAyamSlam.text = "";
                  _controllerBlueLava.text = "";
                  _controllerDarkChoco.text = "";
                  beli = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            children: [
              item(
                width: width,
                context: context,
                productName: "Ayam Katsu",
                price: 11000,
                controller: _controllerAyamKatsu,
                value: ayamKatsu,
                onPressed: () {
                  setState(() {
                    ayamKatsu = ayamKatsu + 1;
                  });
                },
                onPressedMin: () {
                  setState(() {
                    ayamKatsu == 0
                        ? ayamKatsu = 0
                        : setState(() {
                            ayamKatsu = ayamKatsu - 1;
                          });
                  });
                },
              ),
              item(
                width: width,
                context: context,
                productName: "Ayam Slam",
                price: 9000,
                controller: _controllerAyamSlam,
                value: ayamSlam,
                onPressed: () {
                  setState(() {
                    ayamSlam = ayamSlam + 1;
                  });
                },
                onPressedMin: () {
                  setState(() {
                    ayamSlam == 0
                        ? ayamSlam = 0
                        : setState(() {
                            ayamSlam = ayamSlam - 1;
                          });
                  });
                },
              ),
              item(
                width: width,
                context: context,
                productName: "Blue Blood",
                price: 8000,
                controller: _controllerBlueLava,
                value: blueBlood,
                onPressed: () {
                  setState(() {
                    blueBlood = blueBlood + 1;
                  });
                },
                onPressedMin: () {
                  setState(() {
                    blueBlood == 0
                        ? blueBlood = 0
                        : setState(() {
                            blueBlood = blueBlood - 1;
                          });
                  });
                },
              ),
              item(
                width: width,
                context: context,
                productName: "Dark Chocolate",
                price: 12000,
                controller: _controllerDarkChoco,
                value: darkChocolate,
                onPressed: () {
                  setState(() {
                    darkChocolate = darkChocolate + 1;
                  });
                },
                onPressedMin: () {
                  setState(() {
                    darkChocolate == 0
                        ? darkChocolate = 0
                        : setState(() {
                            darkChocolate = darkChocolate - 1;
                          });
                  });
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: useVoucher
          ? Container(
              padding: EdgeInsets.all(width * 0.05),
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.05),
                  topRight: Radius.circular(width * 0.05),
                ),
                color: pWhiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/Voucher.svg"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        "Punya kode voucher?",
                        style: pBoldBlackTextStyle.copyWith(
                            fontSize: const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 20)),
                      )
                    ],
                  ),
                  Text(
                    "Masukkan kode voucher",
                    style: pBoldBlackTextStyle.copyWith(
                      fontSize: const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 12),
                      height: 1,
                    ),
                  ),
                  TextField(
                    controller: _controllerVoucher,
                    decoration: InputDecoration(hintText: "puas"),
                    onChanged: (value) {
                      setState(() {
                        value == "puas" ? voucher = 10000 : voucher = 0;
                      });
                    },
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              width > height ? width * 0.02 : height * 0.02),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          useVoucher = false;
                        });
                      },
                      child: Text(
                        "Verifikasi",
                        style: pBoldWhiteTextStyle.copyWith(
                            fontSize: const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 12)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.05),
                  topRight: Radius.circular(width * 0.05),
                ),
                color: pSecondGreyColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total Pesanan ",
                                  style: pBoldBlackTextStyle.copyWith(
                                      fontSize: const AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 16)),
                                ),
                                Text(
                                  "(${ayamKatsu + ayamSlam + blueBlood + darkChocolate} Menu) :",
                                  style: pBlackTextStyle.copyWith(
                                      fontSize: const AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 16)),
                                )
                              ],
                            ),
                            Text(
                              "${ayamKatsu * hayamKatsu + ayamSlam * hayamSlam + blueBlood * hblueBlood + darkChocolate * hdarkChocolate}",
                              style: pBoldBlackTextStyle.copyWith(
                                fontSize: const AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 16),
                                color: pPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/Voucher.svg"),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(
                                  "Voucher",
                                  style: pBoldBlackTextStyle.copyWith(
                                      fontSize: const AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 16)),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  useVoucher = true;
                                });
                              },
                              child: voucher == 0
                                  ? Row(
                                      children: [
                                        Text(
                                          "Input Voucher",
                                          style: pBlackTextStyle.copyWith(
                                            fontSize: const AdaptiveTextSize()
                                                .getadaptiveTextSize(
                                                    context, 12),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.skip_next,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          "Hemat",
                                          style: pBlackTextStyle.copyWith(
                                            fontSize: const AdaptiveTextSize()
                                                .getadaptiveTextSize(
                                                    context, 12),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "$voucher",
                                          style: pBlackTextStyle.copyWith(
                                            fontSize: const AdaptiveTextSize()
                                                .getadaptiveTextSize(
                                                    context, 12),
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.1,
                    padding: EdgeInsets.all(width * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.05),
                        topRight: Radius.circular(width * 0.05),
                      ),
                      color: pWhiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/icons/keranjang.svg"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Pembayaran",
                              style: pBlackTextStyle.copyWith(
                                fontSize: const AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 14),
                                height: 1,
                              ),
                            ),
                            Text(
                              "Rp. ${(ayamKatsu * hayamKatsu + ayamSlam * hayamSlam + blueBlood * hblueBlood + darkChocolate * hdarkChocolate) - voucher}",
                              style: pBoldBlackTextStyle.copyWith(
                                fontSize: const AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 16),
                                height: 1,
                                color: pPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: pPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    width > height
                                        ? width * 0.02
                                        : height * 0.02),
                              ),
                            ),
                            onPressed: () {
                              beli
                                  ? _showMyDialog(
                                      "Yakin ingin membatalkan pesanan?")
                                  : setState(() {
                                      ayamKatsu +
                                                  ayamSlam +
                                                  blueBlood +
                                                  darkChocolate !=
                                              0
                                          ? beli = true
                                          : beli = false;
                                    });
                            },
                            child: Text(
                              beli ? "Batalkan Pesanan" : "Pesan Sekarang",
                              style: pBoldWhiteTextStyle.copyWith(
                                  fontSize: const AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  item({
    required width,
    required context,
    required String productName,
    required int price,
    required TextEditingController controller,
    required int value,
    required VoidCallback onPressed,
    required VoidCallback onPressedMin,
  }) {
    return Stack(
      children: [
        Container(
          height: width * 0.25,
          width: width,
          padding: EdgeInsets.all(width * 0.02),
          margin: EdgeInsets.only(bottom: width * 0.02),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3.0, 3.0),
                blurRadius: 5.0,
              ),
            ],
            color: pFirstGreyColor,
            borderRadius: BorderRadius.circular(width * 0.02),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.02),
                child: Container(
                  height: width * 0.1,
                  width: width * 0.1,
                  color: pRedColor,
                ),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: pBlackTextStyle.copyWith(
                          fontSize: const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 16)),
                    ),
                    Text(
                      "Rp. ${NumberFormat.decimalPattern().format(price)}",
                      style: pBoldBlackTextStyle.copyWith(
                          fontSize: const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: pPrimaryColor),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/note_icon.svg"),
                        SizedBox(
                          width: width * 0.4,
                          child: TextField(
                            controller: controller,
                            style: pBlackTextStyle.copyWith(
                              fontSize: const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 8),
                            ),
                            decoration: const InputDecoration(
                              hintText: "Tambah Catatan",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: width * 0.01),
                      child: beli
                          ? Container()
                          : InkWell(
                              child: SvgPicture.asset(
                                  "assets/icons/reduce_product.svg"),
                              onTap: onPressedMin,
                            ),
                    ),
                    Text(
                      value.toString(),
                      style: pBlackTextStyle,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: beli
                          ? Container()
                          : InkWell(
                              onTap: onPressed,
                              child: SvgPicture.asset(
                                  "assets/icons/add_product.svg"),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        beli && value == 0
            ? Container(
                height: width * 0.25,
                width: width,
                color: pWhiteColor.withAlpha(100),
              )
            : Container(),
      ],
    );
  }
}
