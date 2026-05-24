import 'package:flutter/material.dart';
import 'jakartaPlaces.dart';

class WisataCard extends StatelessWidget {
  final Wisata wisata;

  const WisataCard({
    super.key,
    required this.wisata,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(25),

        boxShadow: [

          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: ClipRRect(

        borderRadius:
            BorderRadius.circular(25),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // IMAGE
            Expanded(

              flex: 8,

              child: SizedBox(
                width: double.infinity,

                child: Image.asset(
                  wisata.gambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // CONTENT
            Expanded(

              flex: 2,

              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    Text(
                      wisata.nama,

                      maxLines: 1,

                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      wisata.lokasi,

                      maxLines: 2,

                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}