# 💼 Rajat Dagar - Developer Portfolio

This is a full-stack developer portfolio built with:

- 🚀 **Flutter Web (Frontend)**
- ⚙️ **Ktor Server (Backend)** using MongoDB & PostgreSQL

It showcases my skills, experiences, and projects as an Android developer.

---

## 📸 Live Preview

**Coming Soon:** Deployed link (e.g., Vercel, Firebase Hosting)

---

## 🧰 Tech Stack

### 👨‍💻 Frontend (Flutter Web)
- Flutter 3.x
- Jetpack Compose for Web UI
- Responsive Layouts (desktop & mobile)
- State Management using `StatefulWidgets` / `FutureBuilder`
- Image Assets integration

### 🔧 Backend (Ktor)
- Ktor Framework (Kotlin)
- MongoDB for dynamic content (Experience, Projects, Contact)
- PostgreSQL (for users/data if needed)
- JSON-based data loading
- CORS + Serialization Configured
- RESTful API Endpoints

---

## 🧱 Project Structure

Rajat-portfolio/
│
├── android/ or lib/ # Flutter frontend (UI, screens, models)
├── backend/ # Ktor backend (routes, models, db access)
│ ├── src/
│ ├── entityAndDataSourcesPortfolio/
│ ├── data/
│ └── resources/
│
├── dummy_data/ # JSON files for dummy portfolio data
├── ImagesForPortfolio/ # Screenshots for projects
├── assets/ # Profile pic and other media
├── pubspec.yaml # Flutter config
├── build.gradle.kts # Ktor project config
└── README.md


---

## 🖼️ Features

- 🎯 Landing section with name, title, call-to-action buttons
- 🛠️ Skills section with icons
- 📂 Projects section (fetched from backend)
- 💼 Experience timeline (fetched from backend)
- 📬 Contact screen with image, dynamic content from backend
- 📄 Download resume
- 🧪 Backend tested with Postman
- 📦 Uses MongoDB/PostgreSQL for dynamic data

---

## 🔗 API Endpoints (Ktor)

| Method | Endpoint             | Description              |
|--------|----------------------|--------------------------|
| GET    | `/projects`          | Get all project data     |
| GET    | `/experiences`       | Get all experience data  |
| GET    | `/contact`           | Get contact information  |

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/rajatdagar2005/Rajat-portfolio.git
cd Rajat-portfolio

🛡️ License
This project is under the MIT License. You are free to fork and use it for your own portfolio!

🙋‍♂️ Author
Rajat Dagar
📧 rajat.dagar.official@gmail.com
LinkedIn | GitHub
