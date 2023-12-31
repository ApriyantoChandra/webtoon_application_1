import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:webtoon_application_1/data/models/comic_response.dart';

import '../models/chapter_model.dart';
import '../models/chapter_response.dart';
import '../models/comic_model.dart';
import '../models/detail_comic_model.dart';
import '../models/detail_comic_response.dart';

abstract class ComicRemoteDataSource {
  Future<List<ComicModel>> getComics();
  Future<List<ComicModel>> getHotComics();
  Future<DetailComicModel> getDetailComic(String param);
  Future<ChaptersModel> getChapter(String param);
  Future<List<ComicModel>> getPencarian(String query);
}

class ComicRemoteDataSourceImpl implements ComicRemoteDataSource {
  static const String BASE_URL = 'https://wibutools.live/api/komiku';
  static const String CHAPTER_URL = 'https://wibutools.live/api/komiku/chapter';
  final Dio dio;

  ComicRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ComicModel>> getComics() async {
    final response = await dio.get(BASE_URL);
    if (response.statusCode == 200) {
      return ComicResponse.fromJson(response.data).comicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<ComicModel>> getHotComics() async {
    final response = await dio.get('$BASE_URL/hot');
    if (response.statusCode == 200) {
      return ComicResponse.fromJson(response.data).comicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<DetailComicModel> getDetailComic(String param) async {
    final response = await dio.get('$BASE_URL/$param');
    if (response.statusCode == 200) {
      return DetailComicResponse.fromJson(response.data).detailComicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<ChaptersModel> getChapter(String param) async {
    final response = await dio.get('$CHAPTER_URL/$param');
    if (response.statusCode == 200) {
      return ChapterResponse.fromJson(response.data).chapterModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<ComicModel>> getPencarian(String query) async {
    final response = await dio.get('$BASE_URL/?s=$query');
    if (response.statusCode == 200) {
      return ComicResponse.fromJson(response.data).comicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
