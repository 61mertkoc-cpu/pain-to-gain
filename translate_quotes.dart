import 'dart:io';
import 'package:translator/translator.dart';

void main() async {
  final file = File('lib/backend/quotes_repository.dart');
  var content = await file.readAsString();
  final translator = GoogleTranslator();

  // Pattern to match localizedText maps
  // Format: localizedText: {\n      'tr': '...', \n      'en': '...', ...\n    },
  final regex = RegExp(r"(localizedText:\s*\{)(.*?)(\},)", dotAll: true);
  
  final matches = regex.allMatches(content).toList();
  var newContent = content;

  for (var match in matches) {
    final prefix = match.group(1)!;
    final inner = match.group(2)!;
    final suffix = match.group(3)!;

    if (inner.contains("'it':") && inner.contains("'pt':")) {
      continue;
    }

    final enRegex = RegExp(r"'en':\s*'((?:\\'|[^'])*)'");
    final enMatch = enRegex.firstMatch(inner);
    
    if (enMatch != null) {
      final enText = enMatch.group(1)!.replaceAll("\\'", "'");
      try {
        final itTrans = await translator.translate(enText, to: 'it');
        final ptTrans = await translator.translate(enText, to: 'pt');
        
        final itText = itTrans.text.replaceAll("'", "\\'");
        final ptText = ptTrans.text.replaceAll("'", "\\'");
        
        final newInner = inner + "      'it': '$itText',\n      'pt': '$ptText',\n";
        
        final originalMatch = match.group(0)!;
        final replacement = prefix + newInner + suffix;
        newContent = newContent.replaceFirst(originalMatch, replacement);
        print("Translated: ${enText.substring(0, enText.length > 30 ? 30 : enText.length)}...");
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  await file.writeAsString(newContent);
  print("Done!");
}
