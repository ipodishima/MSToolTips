This project contains some tools to help you with your project
# DownloadManager
The first thing is a `DownloadManager`. It supports both a local file load and downloading JSON data from a server.
A controller `LocalFileViewController` shows you how to use the load of a local file.
This use `NSOperation` and `NSOperationQueue`, we'll discuss about that, but this is a common way to easily perform asynchronous operations. You really need to take a sheet of paper and draw the relationships between the class `DownloadManager`, `DownloadOperation` and `LocalFileViewController`. Then try to figure out how `YouTubeManager` is built.
# YouTubeManager
The second point is `YouTubeManager`. It is built on top of `DownloadManager` and shows you how to dialog with YouTube APIs to get the user feed as a JSON, parse it into objects, and then display some infos. There is also an example of `LBYouTubeView` integration for displaying the video (https://github.com/larcus94/LBYouTubeView).
Please note that the setup from the web site is not the right one, follow these steps instead :

1. Drag into your your project `LBYouTubePlayerController` folder and Submodules/JSONKit folder.
2. Import the `MediaPlayer.framework`.
3. Set `-fno-objc-arc` compiler flag to `JSONKit.m`. For that, select the blue icon of your project into Xcode, then the targets, Build phases, Compile Sources and double clic on `Compiler Flags` column to set the value.