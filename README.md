# pokedex
## How build/run this project? 
* *make sure you have flutter on its latest version (3.10.5)*
* *if you want to test in mobile, just select your mobile device*
* *if you want to test in web just select a browser in device list*
* *When opening the project for the first time, if you record using the `flutter pub get` command* 


## Usage decisions (Packages)

Based on the task description, these were the decisions made regarding the packages:

* **UI:**
    * flutter_svg: to show pokemon types.
    * shimmer_animation: for easy create widget loaders.
    * show_up_animation: for easy control of animations in widgets.
    * palette_generator: to get palette from pokemons.
* **Routes:**
    * Flutter_Modular
* **HTTP:**
    * dio: to make HTTP requests to the PokeAPI.
* **State Management:**
    * mobx: to manage the state of the application.

### Business rule and the like

* Create required models.
* Integrate services.
* Implement and test services with Dio.
* Create integration with Modular.

### Welcome Screen

* Create a welcome screen with a loading animation and welcome messages, with random pokemons per message.
### Home Screen

* Display a list of Pokemon with pagination.
* The list should be filtered by type of Pokemon.
* Each Pokemon in the list should display its name and image.
* There should be a button to show a random Pokemon.
* When the button is tapped, a random Pokemon will be displayed on the details screen.

### Pokemon Details Screen

* Display the Pokemon's name, image, type, weight, height and abilitys.
* There should be a button to navigate back to the home screen.

## API
* The API that should be used as a base is the PokeAPI provided by https://pokeapi.co.
* The API should be used to fetch information about Pokemon.
