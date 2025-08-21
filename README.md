
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

- `FLETCHING` AND `COOKING` ARE DONE AT FORT.
- `FIREMAKING` IS AT BONFIRE PRIFF.
- `CRAFTING` GLASS IS DONE AT PRIFF
- MAKING `FLASKS/ CUT GEMS/ CRAFT ARMOR` IS DONE AT AT FORT BANK (WORKSHOP)

### Notes for Crafting
- If you want to craft something with multiple options (for example dragonhide bodies), you MUST craft 1 first so the script will keep crafting that item


### Fletching Tab
- **Sub Skill:** Select from `FLETCH`, `STRING`, `HEADLESS`, or `ARROWS`.
- **Log Type:** Select the type of log to use.
- **Arrowhead Type:** Select the type of arrowhead to use.
- **unf shortbows:** Select the type of unstrung shortbows.
- **unf longbows:** Select the type of unstrung longbows.

### Cooking Tab
- **Fish Type:** Select the type of fish you want to cook.

### Firemaking Tab
- **Log Type:** Select the type of log you want to burn.

### Crafting Tab
- **Sub Skill:** Select from `CUT`, `GLASS`, `FLASKS`, or `ARMOR`.
- **Sandstone:** Select the type of sandstone for glassmaking.
- **Glass:** Select the type of glass for flask making.
- **Uncut gem:** Select the type of gem to cut.
- **Leather:** Select the type of leather for armor crafting.

### Notes
- For Fletching and Crafting, you **must** select a sub skill for the script to work correctly.
- If you select `NONE` for any dropdown, that option will be ignored by the script.


---


## How to Use

<img width="140" height="35" alt="image" src="https://github.com/user-attachments/assets/62d52b4b-3242-41c4-97ca-49555610cf47" />

1. Place all files in the folder "Knetter AIO skiller".


<img width="286" height="68" alt="image" src="https://github.com/user-attachments/assets/0e733ee8-4111-4bc2-9731-ef57bf40e896" />

2. Click `Config`



<img width="533" height="245" alt="image" src="https://github.com/user-attachments/assets/44dc95f9-8f86-473b-8d02-143781b239c7" />

3. Choose desired settings
4. Click `Save & Close` and start the script.

<img width="290" height="76" alt="image" src="https://github.com/user-attachments/assets/d832a234-7cf0-4f57-aadf-b3f92338ebb0" />

5.Start the script in the script manager


<img width="200" height="123" alt="image" src="https://github.com/user-attachments/assets/e74ca33e-6eea-457b-b43f-d895e9d426f0" />

6.click start/pause in top left corner (script GUI)


---

## Extending
To add more skills or materials, simply update the `config.lua` and `data.lua` files. The resolver is designed to automatically pick up new options if you follow the same naming conventions.

---

## Future updates
- Herblore in fort.






