
# News App

A Flutter project for displaying daily news  majorly focused on learning clean architecture.

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/damooola/news_app.git
   cd news_app
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:

   ```sh
   flutter run
   ```

## Project Structure

- core: Core functionalities and utilities used across the app.
  - `constants`: Contains constant values used in the app.
  - `resources`: Contains data state management classes.
  - `usecase`: Contains the base use case class.

- daily_news: Contains the main feature of the app.
  - `data`: Data layer including models, data sources, and repositories.
    - `data_sources`: Remote data sources for fetching news articles.
    - `models`: Data models representing news articles.
    - `repositories`: Repository implementations for data handling.
  - `domain`: Domain layer including entities and use cases.
    - `entities`: Data entities representing core data structures.
    - `usecases`: Use cases for fetching news articles.
  - `presentation`: Presentation layer including UI and state management.
    - `bloc`: Business Logic Components for state management.
    - `pages`: UI pages of the app.
    - `widgets`: Reusable UI components.

## Features

- Fetch and display top headlines from a news API.
- Filter news articles by country and category.
- Display article details including title, author, description, and publication date.

## API Integration

The app uses the [News API](https://newsapi.org/) to fetch news articles. Make sure to get your API key from News API and add it to the app.

## Resources

A few resources to get you started if this is your first Flutter project:

- [Flutter Guys Clean Architecture Tutorial](https://youtu.be/7V_P6dovixg?si=SA5DMux5CAUGd1mo)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
