import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:festival_post/utils/festival_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey imageKey = GlobalKey(); // Initialize imageKey

  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        imageKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage);

    ShareExtend.share(file.path, "Image");
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: const Color(0xFF339F74),
      appBar: AppBar(
        backgroundColor: const Color(0xFF339F74),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${Festivals.festivals[data]['name']}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          RepaintBoundary(
            key: imageKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(
                          "${Festivals.festivals[data]['image']}",
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.8,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${Festivals.festivals[data]['name']}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "${Festivals.festivals[data]['date']}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "${Festivals.festivals[data]['description']}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            // fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       data++;
                        //     });
                        //   },
                        //   child: Container(
                        //     height: 60,
                        //     alignment: Alignment.centerRight,
                        //     child: const Icon(
                        //       Icons.arrow_circle_right,
                        //       color: Colors.white,
                        //       size: 50,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white.withOpacity(0.2),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(height: 10),
                Divider(
                  thickness: 6,
                  endIndent: MediaQuery.of(context).size.height / 6,
                  indent: MediaQuery.of(context).size.height / 6,
                  color: Colors.black45,
                ),
                // const SizedBox(height: 10),
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        await FlutterClipboard.copy(
                                "${Festivals.festivals[data]['name']}          ${Festivals.festivals[data]['description']}")
                            .then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Your Text Copied Succesfully"),
                            ),
                          ),
                        );
                      },
                      child: const Text("COPY TEXT"),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        shareImage();
                      },
                      child: const Text("SHARE"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
