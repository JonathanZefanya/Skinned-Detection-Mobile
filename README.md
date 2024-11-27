# Skinned Detection App

A Flutter-based mobile application for detecting skin conditions, leveraging TensorFlow for machine learning.

## Overview

The **Skinned Detection App** is a mobile application built using Flutter and TensorFlow Lite, designed to assist users in identifying potential skin conditions. The app provides an accessible way for users to get more information about their skin by searching related conditions online, promoting awareness and assisting in early detection.

## Technologies Used

- **Flutter**: Used for building the cross-platform mobile application.
- **TensorFlow Lite**: For on-device machine learning model inference, allowing efficient image processing and detection.
- **Dart**: The primary programming language used with Flutter.
- **URL Launcher**: Flutter plugin for launching URLs in the default browser, allowing the app to provide external information based on detected skin conditions.

## How to Run the App

To run this project locally:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/JonathanZefanya/Skinned-Detection-Mobile.git
   cd skinned_detection_app
   flutter run
   or
   flutter build apk

## To-Do List
1. Fix the TFLite Model: Optimize and adjust the TensorFlow Lite model for more accurate skin condition detection. (Done)
2. Improve Results Page: Enhance the user interface and user experience on the results page to display more informative data.
3. Fix Scanning Page Load Data 