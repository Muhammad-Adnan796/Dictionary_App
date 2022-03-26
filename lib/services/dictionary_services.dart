import 'dart:convert';
import 'package:dictionary_app/app_texts/api_urls.dart';
import 'package:dictionary_app/app_texts/error_string.dart';
import 'package:dictionary_app/data/word.dart';
import 'package:http/http.dart' as http;

class DictionaryServices {
  Future<Word> getData(String word) async {
    Uri url = Uri.parse('${ApiUrls.apiurl}/${word}?key=${ApiUrls.keyurl}');

    print("Fetching data in progress");
    final response = await http.get(url);
    print("Data fetching complete...");

    if (response.statusCode != 200) {
      throw Exception("Error fetching data from server");
    }

    final List decodedData = jsonDecode(response.body);
    final parsedData = decodedData.isNotEmpty ? decodedData[0] : {};
    final meaning = parsedData["shortdef"]?[0] ?? "";
    final audiofile = parsedData['hwi'] != null
        ? parsedData['hwi']['prs'].length != 0
            ? parsedData['hwi']['prs'][0]['sound']['audio']
            : ''
        : '';

    return Word(
      word: word,
      meaning: meaning,
      audioName: audiofile,
    );
  }

  String getAudioUrl(String audioFileName) {
    String folderName = '';
    final startWithAlphabetsOnly = RegExp(r'^[A-Za-z]');

    if (audioFileName.isEmpty) {
      throw new Exception(ErrorStrings.invalidAudioFile);
    }

    if (audioFileName.startsWith('gg')) {
      folderName = 'gg';
    } else if (audioFileName.startsWith('bix')) {
      folderName = 'bix';
    } else if (!startWithAlphabetsOnly.hasMatch(audioFileName)) {
      folderName = '_';
    } else {
      folderName = audioFileName[0];
    }

    return '${ApiUrls.audioBaseUrl}${folderName}/${audioFileName}${ApiUrls.audioFileExtension}';
  }
}
