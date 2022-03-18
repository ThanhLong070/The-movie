import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/models/cast.dart';

class CastList extends StatelessWidget {
  Cast cast;
  Size size;
  CastList({required this.cast, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            margin: const EdgeInsets.only(right: 2.0, bottom: 2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: SizedBox(
              width: 125.0,
              child: Column(
                children: <Widget>[
                  // Image.network(cast.profileUrl),
                  CachedNetworkImage(
                    imageUrl: cast.profileUrl,
                    width: 125.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(
                              radius: 20.0,
                              color: Color.fromARGB(255, 1, 180, 228),
                            ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/img_not_found.jpg',
                      height: 140.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 125.0,
                          child: Text(
                            cast.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 125.0,
                          child: Text(
                            cast.character!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 125.0,
                        //   child: Text(
                        //     '${cast.episodes} Episodes',
                        //     style: const TextStyle(
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 14.0,
                        //       color: Color.fromRGBO(0, 0, 0, 0.5),
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
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }
}
