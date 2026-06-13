# flutter_content_safety

A Flutter package for on-device image content moderation. Detect and classify sensitive content using a lightweight TensorFlow Lite model — no server required.

## Features

- **On-device inference** — all processing stays on the device, no data leaves the app
- **Image moderation** — classify images as safe, suggestive, explicit, or anime/hentai
- **Moderation recommendations** — receive allow / warn / blur / block actions based on configurable thresholds
- **SafeImage widget** — drop-in widget with automatic blur and reveal interaction
- **Android & iOS** support

## Getting started

### 1. Add dependency

```yaml
dependencies:
  flutter_content_safety: ^1.0.0
```

### 2. Initialize

Call `initialize` once at app startup. The model is downloaded and cached on first launch.

```dart
await ContentSafety.initialize();
```

## Usage

### Analyze a file

```dart
final result = await ContentSafety.analyzeImage(imageFile);

if (!result.isSafe) {
  print(result.category);       // ContentCategory.explicit
  print(result.confidence);     // 0.91
  print(result.recommendation); // ModerationAction.blur
}
```

### Analyze bytes (network / memory images)

```dart
final result = await ContentSafety.analyzeBytes(imageBytes);
```

### SafeImage widget

Automatically scans, blurs sensitive content, and shows a reveal button.

```dart
SafeImage(
  imageProvider: NetworkImage(url),
)
```

Optional parameters:

```dart
SafeImage(
  imageProvider: NetworkImage(url),
  blurSigma: 15,
  revealButtonText: 'Reveal',
  autoReveal: false,
)
```

### Custom thresholds

```dart
await ContentSafety.initialize(
  config: ModerationConfig(
    suggestiveThreshold: 0.5,
    explicitThreshold: 0.8,
    blurSensitiveContent: true,
    autoBlock: false,
  ),
);
```

## Models

### ModerationResult

| Field          | Type              | Description                          |
|----------------|-------------------|--------------------------------------|
| isSafe         | bool              | Whether content is considered safe   |
| category       | ContentCategory   | Detected content category            |
| confidence     | double            | Confidence score (0.0 – 1.0)         |
| recommendation | ModerationAction  | Suggested action                     |
| scores         | Map<String,double>| Raw per-category model probabilities |

### ContentCategory

| Value       | Description              |
|-------------|--------------------------|
| safe        | No sensitive content     |
| suggestive  | Mildly suggestive        |
| explicit    | Explicit adult content   |
| hentai      | Anime explicit content   |

### ModerationAction

| Value | Triggered when                       |
|-------|--------------------------------------|
| allow | Content is safe                      |
| warn  | Content is suggestive                |
| blur  | Content is explicit                  |
| block | Content is explicit + autoBlock true |

## Error handling

| Exception                          | Cause                        |
|------------------------------------|------------------------------|
| ContentSafetyNotInitializedException | `analyzeImage` called before `initialize` |
| InvalidImageException              | Image could not be decoded   |
| UnsupportedImageFormatException    | Format is not jpg/png/webp   |
| ModelLoadException                 | Model file is corrupt        |

## Supported formats

`jpg` · `jpeg` · `png` · `webp`

## Performance

| Metric       | Target          |
|--------------|-----------------|
| Initialization | < 500 ms      |
| Image analysis | < 300 ms (1080p, modern device) |
| Memory usage   | < 50 MB during inference |
| Model size     | < 10 MB        |

## Privacy

All inference runs on-device. No image data is transmitted unless you explicitly configure a cloud provider (future feature).

## Roadmap

| Version | Feature                          |
|---------|----------------------------------|
| V1.1    | OCR moderation (`analyzeImageText`) |
| V1.2    | Text moderation (`analyzeText`)  |
| V2.0    | Violence, gore, weapons, drugs detection |
| V3.0    | Pluggable provider marketplace   |
