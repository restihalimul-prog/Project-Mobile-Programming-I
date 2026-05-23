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
        borderRadius: BorderRadius.circular(25),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Card(
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),

        clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      wisata.nama,

                      maxLines: 1,

                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      wisata.lokasi,

                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 12,
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