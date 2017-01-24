# Open-Brew
Let's design an international json-based standard format, used for exchange and automation of beer brewing recipes

The beer brewing scene changes. Since the craftbeer revolution came along, brewing beer became a popular sport again. Everyone has the ability to brew a custom beer. Everyone can make experiences and develop own recipes. And that's great. But the distribution of these recipes is a disaster. There are so much cool projects (such as [craftbeerpi](https://github.com/Manuel83/craftbeerpi "Goto craftbeerpi"), [kleiner-brauhelfer](https://github.com/Gremmel/kleiner-brauhelfer "Goto kleiner-brauhelfer") and so on) but all of them use individual data exchange formats like sql. So we still miss an offical, fully featured standard for brewing recipes. Let us design a worldwide standard format in json schema together. Let's make the default for home brewing automation. Let's make it possible, sharing brew recipes across the world. Everyone with some experience in brewing and json is welcome! 

#### Steps to version 1.0.0
- Finalize the [JSON Example](/v1.0.0/open-brew-1-0-0.example.json "JSON Example for Open Brew Version 1.0.0")
- Documentation in Wiki (See progress here [Wiki](https://github.com/SeeSharp7/Open-Brew/wiki))
- Extract json schema from example
- Add description, required fields, enum values
- Add GNU GPL License to repo
- Release version 1.0.0

#### Requirements:
- Json Schema as definition format
- Versioning for further development
- Multi language support
- Automation details possible but not required
- Free definition of brew steps
- Enums for often used values
- Support for multiple units, etc.

#### Thoughts for future versions
- Swagger json definition
- Library for extrapolating amounts
- Minimum requirements of brew equipment (container size, ...)
- Central online portal for all recipes worldwide (open-brew-hub.com)
- Directly import your favourite recipes to your IoT-Device
- Address all automated parts (SSRs; Pumps; ...) in this json format  

# Open Brew - Format Description  
Here we go with some documentation. Each field will appear by it's name, type and description.

## Supported Unit Types
Some elements need a concrete specification of their unit types. The supported unit types for the respective element are  defined below.  

| Element    | Type   | Possible Values                   |
|------------|--------|-----------------------------------|
| volumeUnit | string | liter, milliliter                 |
| weightUnit | string | kilogram, gram                    |
| ratioUnit  | string | gramPerLiter, percent             |
| tempUnit   | string | celsius, fahrenheit, kelvin       |
| timeUnit   | string | hour, minute, second, millisecond |
| tasteUnit  | string | ibu                               |
| chemicalUnit| string | dh, ppm                           |

## Elements in order of their apperance
#### Document Body  
| Element            | Type                                                  | Description                                                                                                                        |
|--------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| openBrewVersion    | string                                                | Defines the version of the Open Brew Format (major.minor.patch)                                                                    |
| encoding           | string                                                | Defines the encoding of the current json document, standard ist "UTF-8"                                                            |
| recipeName         | string                                                | The Name of the beer brewing recipe                                                                                                |
| recipeVersion      | number                                                | Defines the version of the recipe. Every change increases the value by 1, beginning by 1                                           |
| brewStyle          | string                                                | Brew style, i. e. "Amber Lager". Freetext, too much variations here                                                                |
| descriptions       | array  [Multi language texts](#multi-language-texts)  | Describe your recipe in a few words. Muliple languages supported                                                                   |
| totalAmount        | object [Amount](#amount)                              | Describes how much beer is being expected at the end of the day                                                                    |
| originalWort       | object [Amount](#amount)                              | The amount of original wort in your maish. Nearly always describes in percent                                                      |
| hightGravityFactor | object [Amount](#amount)                              | Brew kettle too small? Raise this value to brew a concentrate that will be thinned down afterwards. Describes in percent           |
| bitterness         | object [Amount](#amount)                              | Describes the bitterness of your beer. IBU is the unit                                                                             |
| carbonDioxide      | object [Amount](#amount)                              | The little thing, that makes you burp comes up with that likely name. It's preferred to define it in gram per liter                |
| author             | object [Author](#author)                              | Provides information about the author of the current recipe                                                                        |
| ingredients        | object [Ingredients](#ingredients)                    | Provides every commodity you need to start brewing                                                                                 |
| brewSteps          | array  [Brew Steps](#brew-steps)                      | Describes the hard way to glory. The steps to your own beer. And that manual and also fully automated. Automated is not so hard ;) |

#### Author
| Element    | Type                         | Description                                                          |
|------------|------------------------------|----------------------------------------------------------------------|
| private    | boolean                      | Indicates if the author is a private or commercial brewer            |
| brewery    | string                       | Name of the brewery                                                  |
| brewMaster | string                       | Full name of the brew master, i. e. "Hannes Pfaffenhuber"            |
| url        | string                       | A valid url to the authors homepage, i. e. "http://holdmybeer.de"    |
| phone      | string                       | The phone number with country code, i. e. "+49 911 123456789"        |
| address    | object [Address](#address)   | The full address of the brewery or the private brewmaster            |
| geo        | object [Geo](#geo)           | Provides geo coordinates of the address for displaying at maps, etc. |

#### Ingredients
| Element | Type                     | Description                                                              |
|---------|--------------------------|--------------------------------------------------------------------------|
| water   | object [Water](#water)   | An object that provides some data about the brewing water                |
| yeast   | object [Yeast](#yeast)   | The details about the yeast to use                                       |
| grains  | array  [grain](#grain)   | This array contains all used grains and their details                    |
| hops    | array  [hop](#hop)       | This array contains all hops and their details                           |
| customs | array  [custom](#custom) | This array contains all custom, free definable ingredients (i. e. honey) |

## Recurring Types

#### Multi language texts
| Element  | Type   | Description                                   |
|----------|--------|-----------------------------------------------|
| language | string | Defines the language by ISO 639-1, i. e. "en" |
| text     | string | The text value in the specified language      |

#### Amount
| Element       | Type   | Description                                                                                            |
|---------------|--------|--------------------------------------------------------------------------------------------------------|
| amout         | number | A double-precision floating point number representing the value                                        |
| {current}Unit | string | The unit type of the amount. For possible element names and  values see [Units](#supported-unit-types) |