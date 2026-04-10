# 🛍️ Products App

A Flutter application that displays a product listing page using a public API. Built with a **Feature-first + Clean Architecture** approach for scalability, maintainability, and clean separation of concerns.

---

## 🚀 Features

* 📦 Product listing from API
* 🧱 2-column responsive grid (Flipkart-style)
* 📱 Adaptive UI (mobile & tablet)
* 🖼️ Displays:

  * Product image
  * Title
  * Price
  * Category
  * Rating
* ✨ Smooth UI animations using `flutter_animate`
* ⚠️ Robust error handling with `fpdart`
* 🧩 Dependency injection using `get_it`

---

## 📸 Screenshots

<p align="center">
  <img src="assets/images/onboarding_one.png" width="200"/>
  <img src="assets/images/onboarding_two.png" width="200"/>
  <img src="assets/images/onboarding_three.png" width="200"/>
</p>

<p align="center">
  <img src="assets/images/home.png" width="250"/>
  <img src="assets/images/products.png" width="250"/>
</p>

---

## 🏗 Architecture

This project follows:

### 🧠 Feature-first + Clean Architecture

```
lib/
 │
 ├── app.dart
 ├── main.dart
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
```

---

## 📦 Packages Used

* 🧠 **Bloc** → State management
* 🌐 **dio** → API calls
* ⚙️ **fpdart** → Functional error handling (`Either`)
* 🧩 **get_it** → Dependency injection
* ✨ **flutter_animate** → UI animations

---

## 🌐 API

Base URL:

```
https://api.escuelajs.co/api/v1/products
```

---

## 🔄 Data Flow

```
UI → Bloc → UseCase → Repository → DataSource → API
                                      ↓
                               Model → Entity
```

---

## 🧠 State Management

Uses **Bloc** for predictable and scalable state handling.

Handles:

* ⏳ Loading state
* ✅ Success state
* ❌ Error state

---

## ❗ Error Handling

* 🚫 Network errors handled via `DioException`
* 🧾 Wrapped using custom `AppError`
* 🔁 Returned using `Either<AppError, Data>`

---

## 👤 Author

**Sojin**
Flutter Developer
