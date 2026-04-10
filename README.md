# Products App

A Flutter application that displays a product listing page using a public API. The app follows **Feature-first + Clean Architecture**, ensuring scalability, maintainability, and separation of concerns.

---

## 🚀 Features

* Product listing from API
* 2-column responsive grid (Flipkart-style)
* Adaptive UI (mobile & tablet)
* Displays:

  * Product image
  * Title
  * Price
  * Category
  * Rating
* Smooth UI animations using `flutter_animate`
* Error handling with `fpdart`
* Dependency injection using `get_it`

---

## 📸 Screenshots

![Onboarding 1](assets/images/onboarding_one.png)
![Onboarding 2](assets/images/onboarding_two.png)
![Onboarding 3](assets/images/onboarding_three.png)
![Home](assets/images/home.png)
![Products](assets/images/products.png)

---

## 🏗 Architecture

This project follows:

### Feature-first + Clean Architecture

```
lib/
 │
 ├── features/
 │    └── products/
 │         ├── data/
 │         │    ├── datasource/
 │         │    ├── models/
 │         │    └── repository/
 │         │
 │         ├── domain/
 │         │    ├── entity/
 │         │    ├── repository/
 │         │    └── usecase/
 │         │
 │         └── presentation/
 │              ├── pages/
 │              ├── widgets/
 │              └── bloc/
 │
 └── main.dart

---

## 📦 Packages Used

* **Bloc** → State management
* **dio** → API calls
* **fpdart** → Functional error handling (`Either`)
* **get_it** → Dependency injection
* **flutter_animate** → UI animations

---

## 🌐 API

Base URL:

```
https://api.escuelajs.co/api/v1/products
```

---

## 🧠 State Management

Uses a clean and scalable approach using Bloc.

Handles:

* Loading state
* Success state
* Error state

---

## ❗ Error Handling

* Network errors handled via `DioException`
* Wrapped using custom `AppError`
* Returned using `Either<AppError, Data>`

---

## 👤 Author

Sojin
Flutter Developer
