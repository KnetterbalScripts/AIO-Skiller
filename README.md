# Knetterbal AIO Skiller


## Configuration UI Explained

When you start the script, a configuration window will appear. Here you can select your desired skill and options:

### Skill Tab
- **Skill:** Choose the main skill you want to train: `FLETCHING`, `COOKING`, or `FIREMAKING`.

### Fletching Tab
If you select `FLETCHING` as your skill, you must also select a **Sub Skill**. The available sub skills are:
- `FLETCH`: Cut logs into unstrung bows.
- `STRING`: String unstrung bows.
- `HEADLESS`: Make headless arrows.
- `ARROWS`: Make arrows from arrow shafts and arrowheads.

Other options for Fletching:
- **Log Type:** The type of log to use (e.g., `NORMAL`, `OAK`, `WILLOW`, etc.).
- **Arrowhead Type:** The type of arrowhead to use for making arrows.
- **Bow Type:** Choose between `SHORTBOW` or `LONGBOW`.
- **unf shortbows:** The id of the unstrung shortbows.
- **unf longbows:** The id of the for unstrung longbows.

### Cooking Tab
- **Fish Type:** Select the type of fish you want to cook.

### Firemaking Tab
- **Log Type:** Select the type of log you want to burn.

### Notes
- For Fletching, you **must** select a sub skill for the script to work correctly.
- If you select `NONE` for any dropdown, that option will be ignored by the script.
- The script will use your selected options to determine which items to use and which actions to perform.

---
Start the script in your RuneScape automation environment.
## How to Use

<img width="607" height="32" alt="image" src="https://github.com/user-attachments/assets/2fa9cf1b-01af-42f8-9b5b-140318e74e68" />


name folder : "Knetter AIO skiller"


1. Place all files in this folder folder.
2. Configure your desired skill and options in the UI.
3. Click `Save & Close` and start the script.
4. Start the script in your RuneScape automation environment.

---

## Extending
To add more skills or materials, simply update the `config.lua` and `data.lua` files. The resolver is designed to automatically pick up new options if you follow the same naming conventions.

---




