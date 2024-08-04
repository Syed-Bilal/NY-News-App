# NY-News-App
NYTimesNewsApp is an iOS application built with Swift following the MVVM (Model-View-ViewModel) architecture. This app fetches the most popular news articles from the New York Times public API and displays them in a list. Tapping on an article shows its details on a separate screen.


## Features

- Fetch and display the most popular news articles from the New York Times.
- View detailed information about a selected article.
- Clean MVVM architecture for better code maintainability.


## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+


## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/NY-News-App.git
    cd NY-News-App
    ```

2. Install dependencies using CocoaPods:

    ```bash
    pod install
    ```

3. Open the project workspace:

    ```bash
    open NY App.xcworkspace
    ```

## Used Pods:

| Name | Description |
| --- | --- |
| Alamofire | For network requests. |
| SVProgressHUD | For loader |
| SDWebImage | For loading and caching images. |


NY App/Network/NetworkConstants NY_API_KEY

## Usage

1. Open `NY App.xcworkspace` in Xcode.
2. Find a file in project `NetworkConstants.swift` (NY App/Network/NetworkConstants) and set your NY API key in `NY_API_KEY`:

    ```swift
	let NY_API_KEY = "YOUR_API_KEY"
    ```

3. Build and run the project on a simulator


## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture.

- **Model**: Represents the data and business logic (e.g., `ArticleModels`, `ArticleRepository`).
- **View**: UI components (e.g., `ArticleVC`, `ArticleDetailVC`).
- **ViewModel**: Manages the data for a view (e.g., `ArticleListViewModel`).


## Utility Classes

- MyExtensions.swift
- Constant.swift


## Network Classes

- CheckNetworkReachability.swift
- NetworkManager.swift
- NetworkConstants.swift
- NetworkResponse.swift



