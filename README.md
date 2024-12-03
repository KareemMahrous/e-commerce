# My Flutter App - User Guide

This is a Flutter app that supports multiple platforms: **iOS**, **Android**, and **Web**. The app displays various metrics and graphs based on the data provided. Depending on the platform, the app's layout and navigation will adapt accordingly.

## Table of Contents

- [Installation](#installation)
- [Platform-Specific Behavior](#platform-specific-behavior)
  - [Web](#web)
  - [Mobile (iOS/Android)](#mobile-iosandroid)
- [Features](#features)

## Installation

To install the app on your device, follow the platform-specific instructions:

### For Android:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    cd your-repository-name
    ```

2. **Open the project in Android Studio or Visual Studio Code**.
3. **Run the app**:

    - Make sure you have an Android emulator running or a device connected.
    - In Android Studio, click the "Run" button.
    - Alternatively, use the terminal:

      ```bash
      flutter run
      ```

### For iOS:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    cd your-repository-name
    ```

2. **Open the project in Xcode**:

    - Open the `ios/Runner.xcworkspace` file in Xcode.

3. **Run the app**:

    - Make sure you have an iOS simulator running or a device connected.
    - In Xcode, click the "Run" button.
    - Alternatively, use the terminal:

      ```bash
      flutter run
      ```

### For Web:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    cd your-repository-name
    ```

2. **Run the app in a browser**:

    - To launch the app in a web browser, use:

      ```bash
      flutter run -d chrome
      ```

## Platform-Specific Behavior

### Web

When you run the app on a web browser, it will display the following:

1. **Drawer Navigation**: 
   - On the left side, there is a drawer that allows you to navigate between different sections of the app (e.g., Metrics and Graph).

2. **Metrics and Graph on the Same Page**:
   - Initially, both the metrics and the graph are displayed on the same page.
   - The metrics section shows the total count, average price, and number of returns.
   - The graph displays a time-based visualization of the orders (e.g., orders over time).

3. **Responsive Layout**:
   - The layout adjusts according to the screen's width and height, ensuring the app looks good on different screen sizes (desktop, tablet, mobile).
   - The app is responsive and adapts to the web page's size, adjusting the layout for the metrics and graphs accordingly.

### Mobile (iOS/Android)

When you run the app on a mobile device, you will see the following features:

1. **Bottom Navigation Bar**:
   - The app uses a **bottom navigation bar** to switch between two main screens: **Metrics** and **Graph**.

2. **Metrics Screen**:
   - The first screen displays various metrics such as the total number of orders, average price, and number of returns.
   - By default, the **Metrics** screen is displayed when the app opens.

3. **Graph Screen**:
   - The second screen shows a graph with time on the **x-axis** and the number of orders on the **y-axis**.
   - There is a toggle button that allows you to switch between the **Average** graph and the **Main** graph. This toggle changes the data being shown in the graph.
   
4. **Drawer Navigation**:
   - The app also includes a drawer for navigation, which can be accessed by tapping the menu icon in the top-left corner.
   - The drawer allows you to easily navigate between the **Metrics** and **Graph** pages.

## Features

- **Responsive Design**: The app is fully responsive, adapting its layout to different screen sizes (mobile, tablet, desktop, web).
- **Metrics Display**: The app shows key metrics like total orders, average price, and returns on both web and mobile platforms.
- **Graphs**: The app includes interactive graphs that plot orders over time, with the ability to switch between average and main data views.
- **Navigation**: 
  - On the web, the app uses a drawer for navigation.
  - On mobile, the app uses a bottom navigation bar to switch between metrics and graphs.
