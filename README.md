# shortly_challenge

A flutter project to shorten links.

## Getting Started

This project is my first flutter project where I tried to create a link shortener app using [shrtcode API](https://shrtco.de/docs/). I am not proud of the project architecture however I'm actually happy to create such a project from scratch in such short time.

## Using the App

Usage is really easy, one just have to paste a link and click the button. It will create a card showing the original link and the short link.

## Development

### Design Analysis

We are provided with four assets and we are required to create a main page which includes logo and an illustration, a bottom section which includes a form and a history section to show previously shortened links.

Main screen is pretty straightforward, requiring only two SVG images and a short text to be rendered. Provided illustration was buggy but a short research and simple formatting let me solve it (check [this](https://github.com/dnfield/flutter_svg/issues/102) out). These section also needed to be scrollable as bottom part is a form and overflows the content.

History section included cards which show the url's and included a button to easily copy the link. This part needs to be a list for us to add new cards.

Bottom section is a simple form to read the field and make an API call. It presents a validation method to prevent empty link calls.

Colors in the project are #3B3054, #2ACFCF, #EFF1F7 and #35323E.

### Architecture

As my React Native knowledge requires, I design apps in components. I also realised that there has to be a home screen, a bottom form, a history list and history cards. Then I created these objects. One problem I forgot about was the State. My components was sharing the same state and was interacting with it so I had to hold the AppState and communicate with it. One problem was I did not know how the app state works in flutter. I had to get rid of my components except HistoryCard and migrate the whole app into ephemeral state. It violates the Separation of Concerns principle however I did not have time to learn it at the moment (to learn it visit [this](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple) page).

This also is the reason why the does not hold any history between two different sessions.

So I'm left with a home screen that has a history array to hold cards, a form and a welcome screen. Welcome screen is conditionally generated if the history has a length "0". Bottom form making api calls and adding HistoryCards to the history.

### Making API Calls

Making an api call is rather easy. You just have to create a Future (just like the promise in JavaScript). As my app was in ephemeral state, I could simply make a call and get the result, setting the widget state instantly. Be aware that the result is JSON so I decoded it before using.

### Result

This project was great to learn how Flutter works. I am not proud of the architecture and general codebase of the project but I learned so much in such short time. I want to create a better architecture for this project soon and I want to solve remaining problems. To be precise: I learned the syntax of Dart and I learned how Flutter works. I created a main page. I made a list to add Cards. I created a card widget. I learned how to create forms, validate and submit them. I learned how to copy anything to clipboard (and it was the easiest thing about that project to be honest). I also made a test to create a HistoryCard widget and learned how testing works in Flutter. Most importantly, I had a lot of fun. Thank you. Find the demo in ./demo folder.

### Setup

I used VS Code to program the project. I debugged the app in Pixel 2 API 29 Emulator with the target of Android 10 version.
For details: https://docs.flutter.dev/get-started/install
