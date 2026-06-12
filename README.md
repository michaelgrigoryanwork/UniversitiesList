<div align="center">
  
# 🎓 Universities List

**A premium, highly modular iOS application for discovering universities across the globe.**

![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue.svg)
![Swift 5.10](https://img.shields.io/badge/Swift-5.10%2B-F05138.svg?logo=swift&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-VIPER-brightgreen.svg)
![SPM](https://img.shields.io/badge/Dependency-SPM-orange.svg)
![Concurrency](https://img.shields.io/badge/Swift_6-Strict_Concurrency-purple.svg)

</div>

---

## 📖 Overview

Built with modern Swift, this project serves as a showcase for strict **Clean Architecture**, **VIPER** design patterns, and advanced **Swift Package Manager (SPM)** modularization. The app provides a fast, robust, and visually stunning way to search for and discover universities worldwide, featuring seamless online/offline synchronization, smart pagination, and a highly polished UI.

---

## ✨ Key Features

* 🌍 **Global Country Filtering:** Effortlessly switch between countries using a native toolbar menu. Changing a country instantly updates the data state, triggering a fresh network fetch or loading seamlessly from the local cache.
* 🔍 **Online & Offline Search:** Search for universities by name with a custom debounce mechanism to optimize API calls. If the device loses connection, the search automatically falls back to querying the locally cached database.
* 📜 **Smart Pagination Logic:** Built-in pagination ensures smooth, infinitely scrolling lists. Data is fetched in chunks, maintaining a low memory footprint and high performance even for countries with massive university directories.
* 📶 **Resilient Offline Fallback:** Fully functional `PersistenceKit` ensures that previously fetched universities are always available, providing a flawless user experience regardless of network conditions.
* 🔗 **Direct Web Access:** Instantly launch a university's official website in Safari via safely isolated `.openURL` buttons.
* 🎨 **Premium UI:** A 100% SwiftUI interface featuring continuous corner radii, soft elevated cards, and consistent state views (Empty, Loading, Error).

---

## 🏗 Architecture & Modularization

This application adheres to strict **Clean Architecture** principles. The app is split into independent local Swift Packages to enforce boundaries. The UI modules cannot access the database, the Network and Persistence kits operate completely independently with zero inbound dependencies, and the Core Domain is fully separated.

### 📦 Package Structure

```text
UniversitiesApp (Composition Root)
├── 🧠 CoreDomainKit        (Separated pure business logic, Protocols, Services)
├── 📦 CoreDataKit          (Shared Entities, DTOs, and DB Models)
├── 🌐 NetworkKit           (Fully functional API layer - Zero inbound dependencies)
├── 💾 PersistenceKit       (Fully functional local DB - Zero inbound dependencies)
├── 🎨 UISharedKit          (Reusable SwiftUI components, Design System)
├── 📱 UniversitiesList     (VIPER Feature - Depends on Domain & SharedUI)
└── 📄 UniversityDetails    (VIPER Feature - Depends on Domain & SharedUI)
