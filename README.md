# pokemondex_colaboraapp

## Usage decisions (Packages)

Based on the task description, these were the decisions made regarding the packages:

* **UI:**
    * shimmer_animation: for easy create widget loaders.
    * show_up_animation: for easy control of animations in widgets.
    * palette_generator: to get palette from pokemons.
* **Internationalization:**
    * intl: to manipulate dates/times.
    * intl_utils: to generate files related to translations.
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

### Splash Screen

* Create a splash screen with a loading animation.
* After the loading animation is finished, navigate to the home screen.

### Home Screen

* Display a list of Pokemon with pagination.
* The list should be filtered by name and type of Pokemon.
* Each Pokemon in the list should display its name and image.
* There should be a button to show a random Pokemon.
* When the button is tapped, a random Pokemon will be displayed on the details screen.

### Pokemon Details Screen

* Display the Pokemon's name, image, type, weight, and height.
* The Pokemon's image should be animated.
* There should be a button to navigate back to the home screen.

## API

* The API that should be used as a base is the PokeAPI provided by https://pokeapi.com.
* The API should be used to fetch information about Pokemon.
* The information about Pokemon should be cached locally to improve performance.
