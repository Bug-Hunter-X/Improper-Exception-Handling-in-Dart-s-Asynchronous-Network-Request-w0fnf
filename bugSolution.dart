```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData is List) {
        for (var item in jsonData) {
          if (item is Map && item.containsKey('name')) {
            print(item['name']);
          } else {
            print('Error: Invalid JSON format. Expected a list of maps with a "name" key.');
          }
        }
      } else {
        throw Exception('Error: Invalid JSON format. Expected a list.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    print('Error: Invalid JSON format: $e');
  } on http.ClientException catch (e) {
    print('Error: Network request failed: $e');
  } catch (e) {
    print('Error: An unexpected error occurred: $e');
  }
}
```