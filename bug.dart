```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = json.decode(response.body);
      // Assuming jsonData is a list
      for (var item in jsonData) {
        print(item['name']); // This line might throw an exception
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e'); //Generic error handling which needs to be more specific 
  }
}
```