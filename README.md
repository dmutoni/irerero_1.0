# 📚 Irerero – English Learning App for Rwandan Children

_Irerero_ is a mobile learning application designed to help Rwandan children learn English through engaging visuals, interactive storytelling, voice feedback, and fun educational activities. Built with Flutter, the app creates a playful environment that supports vocabulary building, number recognition, speaking, and listening skills.

---

## 🌟 Project Goals

Many students in Rwanda face challenges with English language proficiency due to limited access to engaging, context-aware learning tools. **Irerero** is designed to solve this by:

- Making learning English fun and interactive  
- Providing culturally relevant visuals and storylines  
- Offering offline access to reduce dependency on internet connectivity  
- Supporting both visual and auditory learning styles

---

## ✨ Features

| Feature                  | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| 📖 Story Mode            | Flip-through digital storybooks with narration and illustrations            |
| 🔊 Voice Assistance      | Text-to-speech to help with pronunciation and comprehension                 |
| 🎮 Learning Games        | Fun challenges that help with numbers, fruits, animals, etc.                |
| 🧩 Flashcards & Matching | Visual games to reinforce vocabulary retention                              |
| ✅ Simple UI             | Progress-friendly layout for young learners                                 |
| 🎨 Rich Illustrations    | Kid-friendly visuals and animated feedback                                  |
| 📱 Offline Friendly      | Loads resources locally so children can learn without internet              |

---

## 🧪 Screenshots

<img width="456" alt="Screenshot 2025-04-09 at 11 21 26 PM" src="https://github.com/user-attachments/assets/5bab832b-1801-4f78-b6aa-593cb9711bf6" />
<img width="456" alt="Screenshot 2025-04-09 at 11 21 35 PM" src="https://github.com/user-attachments/assets/c10f207c-60e7-4ee0-bbd4-871d6e0d8fbb" />
<img width="456" alt="Screenshot 2025-04-09 at 11 22 27 PM" src="https://github.com/user-attachments/assets/96886414-07ec-470a-92bb-c0848f7ce062" />
<img width="456" alt="Screenshot 2025-04-09 at 11 22 32 PM" src="https://github.com/user-attachments/assets/fab6576d-ecc4-48be-86e8-ee33bdf228e0" />
<img width="456" alt="Screenshot 2025-04-09 at 11 22 41 PM" src="https://github.com/user-attachments/assets/2fd9fa47-cd77-49ed-b523-8aeeb90cc618" />

---


## Demo

[Link to Demo](https://youtu.be/12YvMl0mbI8)

## 🛠 Tech Stack

| Tech / Tool              | Purpose                                     |
|--------------------------|---------------------------------------------|
| Flutter                  | Cross-platform frontend framework           |
| Riverpod                 | Modern state management                     |
| flutter_tts              | Text-to-speech for accessibility            |
| page_flip                | Book-like page flipping animations          |
| Firebase (optional)      | Analytics, auth, storage                    |

---

## 📂 Folder Structure

```bash
lib/
├── main.dart                # App entry point
├── screens/                 # UI screens like games, stories, onboarding
├── widgets/                 # Reusable components (buttons, dropdowns, etc.)
├── values/                  # Constants, assets, theme files
├── models/                  # Data models like story, vocabulary, etc.
├── helpers/                 # Utility functions (e.g. asset generation)
├── providers/               # Riverpod providers
└── services/                # Business logic (TTS, image loaders, etc.)

```

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Android Studio or VS Code
- An Android/iOS emulator or device

### 🧶 Run Locally

1. **Clone the repo**

```bash
git clone https://github.com/dmutoni/irerero_1.0.git
cd irerero_1.0

```

2. **Install dependencies**

```bash
flutter pub get
``` 

3. **Run the app**

```bash
flutter run
```

## 🧠 How It Works
- The app displays number learning screens, story pages, and games.

- Content is interactive, with feedback (e.g. shaking widgets or reading aloud).

- Text-to-Speech reads numbers, words, or story text aloud.

- Stories are paginated using PageFlipWidget to simulate book page-turning.
