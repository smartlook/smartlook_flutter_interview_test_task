# Flutter interview – test task 

## Element tree 

The Flutter framework is rendering all application views directly to the GL layer, so it's hard to extract the application's elements tree directly.

Smartlook SDK heavily relies on the view tree "knowledge" so your "job" in this interview task is to obtain the view tree on Flutter. 

## The solution

- Clone the project at https://github.com/krystofcelba/flutter_interview_test_task 
- In the file `movie_streaming_app/lib/main.dart` there is a method `startServer()` with a simple embedded `HTTP` server running on port `8080` and a mocked request handler returning a sample `JSON`
- Your task is to replace this mocked `JSON` with a real `JSON` data of the elements tree extracted from the app

## Format

Each item of the list should correspond to one element currently visible on the screen and should contain these properties: 
- `top` – the top coordinate of the element on the screen 
- `left` – the left coordinate of the element on the screen 
- `width` – the width of the element 
- `height` – the height of the element 
- `color` – color of the element, this should be for example, background color of plain view or text color of a text element 

## Credits
The testing app is `movie_streaming_app` from the [awesome-flutter-ui](https://github.com/Chromicle/awesome-flutter-ui) project released under a MIT license.
