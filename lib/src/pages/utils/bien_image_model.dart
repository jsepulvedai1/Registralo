import 'package:flutter/material.dart';

class BlogImage {
  const BlogImage({
    @required this.storagePath,
    @required this.originalUrl,
    @required this.bucketName,
    this.id
  });

  final String storagePath;
  final String originalUrl;
  final String bucketName;
  final String id;

  static String get collectionPath => "blogImages";

  create() {
    return "";
  }

  static Future<BlogImage> fromUrl(String url) async {

    return null;
  }

  Future delete() async {
    return null;
  }
}