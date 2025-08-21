
# Knetterbal AIO Skiller

## Features

* **Fletching**
	* Subskills:
		* FLETCH: Cut logs into unstrung bows
		* STRING: String unstrung bows
		* HEADLESS: Make headless arrows
		* ARROWS: Make arrows from arrow shafts and arrowheads
* **Cooking**
* **Firemaking**
* **Crafting**
	* Subskills:
		* CUT: Cut uncut gems
		* GLASS: Make glass items from sandstone
		* FLASKS: Make flasks from glass
		* ARMOR: Craft armor from leather

## Configuration UI Explained

Before starting the script, you can click the config button.
Here you will select stuff that you wanna do 

### Skill Tab
- **Skill:** Choose the main skill you want to train: `FLETCHING`, `COOKING`, `FIREMAKING`, or `CRAFTING`.

- FLETCHING AND COOKING ARE DONE AT FORT.
- FIREMAKING IS AT BONFIRE PRIFF.
- CRAFTING GLASS IS DONE AT PRIFF
- MAKING FLASKS AT FORT BANK (WORKSHOP)

### Notes for Crafting
- If you want to craft something with multiple options (for example dragonhide bodies), you MUST craft 1 first so the script will keep crafting that item

### Fletching Tab
- **Sub Skill:** Kies tussen `FLETCH`, `STRING`, `HEADLESS`, of `ARROWS`.
  - `FLETCH`: Cut logs into unstrung bows.
  - `STRING`: String unstrung bows.
  - `HEADLESS`: Make headless arrows.
  - `ARROWS`: Make arrows from arrow shafts and arrowheads.
- **Log Type:** Select the type of log to use (e.g., `NORMAL`, `OAK`, `WILLOW`, etc.).
- **Arrowhead Type:** Select the type of arrowhead to use for making arrows.
- **unf shortbows:** Select the type of unstrung shortbows.
- **unf longbows:** Select the type of unstrung longbows.

### Cooking Tab
- **Fish Type:** Select the type of fish you want to cook.

### Firemaking Tab
- **Log Type:** Select the type of log you want to burn.

### Crafting Tab
- **Sub Skill:** Choose between `CUT`, `GLASS`, `FLASKS`, or `ARMOR`.
  - `CUT`: Cut uncut gems.
  - `GLASS`: Make glass items from sandstone.
  - `FLASKS`: Make flasks from glass.
  - `ARMOR`: Craft armor from leather.
- **Sandstone:** Select the type of sandstone for glassmaking.
- **Glass:** Select the type of glass for flask making.
- **Uncut gem:** Select the type of gem to cut.
- **Leather:** Select the type of leather for armor crafting.

### Notes
- For Fletching and Crafting, you **must** select a sub skill for the script to work correctly.
- If you select `NONE` for any dropdown, that option will be ignored by the script.
- The script will use your selected options to determine which items to use and which actions to perform.

---


## How to Use

<img width="140" height="35" alt="image" src="https://github.com/user-attachments/assets/62d52b4b-3242-41c4-97ca-49555610cf47" />

1. Place all files in the folder "Knetter AIO skiller".
2. Configure your desired skill and options in the UI.
3. Click `Save & Close` and start the script.


---

## Extending
To add more skills or materials, simply update the `config.lua` and `data.lua` files. The resolver is designed to automatically pick up new options if you follow the same naming conventions.

---

## Future updates
- Herblore in fort.






