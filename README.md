<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

:four_leaf_clover: Package help show popup reaction like Facebook and wrapper for widget (Show anyone who reaction this message).

## :four_leaf_clover::four_leaf_clover: Preview
<p>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0470.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0471.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0465.png?raw=true" width=180/>
<img src="https://github.com/Askany-NDN/reaction_button_askany/blob/main/screenshots/IMG_0467.png?raw=true" width=180/>
</p>

## Features

* Support show popup emotions picker
* Support reaction wrapper for message card use case

## Usage
- Show reaction popup

```dart
        GestureDetector(
          onTapDown: (details) {
            ReactionAskany.showReactionBox(
              context,
              offset: details.globalPosition,
              boxParamenters: boxParamenters,
              emotionPicked: _emotion,
              handlePressed: (Emotions emotion) {
                setState(() {
                  _emotion = emotion;
                });
              },
            );
          },
          child: widget.buttonReaction,
        ),
```
    
- Use reaction wrapper - useful for reaction message
    
```dart
            ReactionWrapper(
              boxParamenters: ReactionBoxParamenters(
                brightness: Brightness.light,
                iconSize: 26,
                iconSpacing: 10,
                paddingHorizontal: 30,
                radiusBox: 40,
                quantityPerPage: 6,
              ),
              buttonReaction: const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.face_outlined,
                  size: 20.0,
                  color: Colors.grey,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Message from lambiengcode <3',
                ),
              ),
            ),
```

### ReactionBoxParamenters
| parameter                  | description                                                                           | default                                                                                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| iconSize          | Size of emotion in reaction box                                           |20|
| iconSpacing                  | Padding horizontal value for each emotion |8|
| paddingHorizontal            | Padding horizontal value for reaction box                                                        | 16 |
| radiusBox               | Radius circular of reaction box                             | 10 |
| quantityPerPage      | Number of emotions per page view                           | 5 |
| brightness                  | Set brightness for show background color compatitive                                  | Brightness.light
## Download Askany

<p>
<a href="https://apps.apple.com/vn/app/askany/id1589217505"><img src="https://askany.com/images/app-store.png" height="60px" width="180px"/></a>
<a href="https://play.google.com/store/apps/details?id=com.askany"><img src="https://askany.com/images/ch-play.png" height="60px" width="180px"/></a>
</p>

## License - lambiengcode

```terminal
MIT License

Copyright (c) 2022 Askany

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
