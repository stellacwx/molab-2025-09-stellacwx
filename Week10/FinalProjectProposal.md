# Savored App


## Overview

This project is a minimalistic feelings-focused food journaling app designed to help users build a more mindful and personal relationship with what they eat. Instead of tracking calories or nutrition, the app centers on emotional reflection. It will offer a private space to log meals through photos, mood tags, notes, and optional location data, while also enabling users to share “story cards” externally. Users will be able to reflect on their meals and view their eating habits, with somewhat customizable user interface to make the product feel more personal.


## Features

1. Food Journal Entries
- A photo selected via PhotosPicker
- Title of the meal
- Mood tags (e.g., comfort, energized, nostalgic)
- Optional rating
- Short personal note
- Optional current location (if location is enabled)
- Entries are saved using SwiftData

2. Organization of Entries
- Entries are automatically grouped by day
- Each day will show up as one entry, and entries can be added to after they've been written

3. Two Customizable UI Modes
- Users can toggle between two interface styles:
    (1) a gallery-oriented visual feed with a photo from each day/entry as a sqaure in the gallery.
    (2) a page-by-page daily journal that mimics the style of a physical journal.

4. Map Integration
- Entries with location data appear as pins on a map.
- Each pin links back to its entry detail.


5. Customizable Color Themes
- User can select from more than one multiple visual themes/color palettes
- A theme affects the app’s accent colors, card styling, and key UI elements.


## Timeline

Week 1
- Create SwiftData storage model and basic CRUD
- Create Add Entry screen (photo, notes, mood tags, location)

Week 2
- Add UI customization (create two different UI layouts and different color palettes)
- Add Map View with annotations

Week 3
- Add social media sharing card view and function
- Polish UI and animations

Week 4
- Polish app and fix any remaining errors
- Add small features if time permits (e.g. activity insights)
