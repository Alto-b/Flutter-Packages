## [0.0.6] - 2025-06-27
### Changed
- Minor UI tweaks to improve layout consistency.
- Enhanced performance by optimizing opacity and shadow rendering.
- Preview app updated for smoother rendering in dark and light modes.

---

## [0.0.5] - 2025-06-26
### Changed
- Replaced deprecated `withOpacity()` calls with `withAlpha()` across the widget.
- Refactored color transparency logic using alpha values for forward compatibility.
- Introduced `clampedOpacity` and `alphaValue` for better code clarity and reuse.

---

## [0.0.4] - 2025-06-15
### Added
- New `opacity` parameter to control background color transparency separately from blur.
- `blurSigma` parameter added to let users control the Gaussian blur intensity explicitly.

### Changed
- The original `blur` parameter has been renamed to `opacity` for clarity.
- Improved internal logic for color blending and theme adaptation.
- Updated widget doc comments for better API clarity.

### Example
- Added enhanced example showcasing both blur and background opacity usage.

---

## [0.0.3] - 2025-06-15
### Changed
- Renamed package from `glassy` to `glassify`.
- Updated README with new project name and GitHub link.
- Added LICENSE file.
- Cleaned up pubspec and versioning.

---

## [0.0.2] - 2025-06-14
### Fixed
- Added missing example project.
- Resolved `.gitignore` related publishing issue.
- Minor refinements to the widget implementation.

---

## [0.0.1] - 2025-06-13
### Added
- Initial release of the `Glassy` widget (now `glassify`).
- Support for blur, color overlays, border radius, and theme adaptation.
- Simple example project and test case.
