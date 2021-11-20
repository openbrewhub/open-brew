# Open Brew - Format Description  
Here we go with some documentation. Each field will appear by it's name, type and description.

## Index
* [Supported Solids](#supported-solids)
* [Supported Unit Types](#supported-unit-types)
  * [Unit Type Value Description](#unit-type-value-description)
* [Elements in order of their apperance](#elements-in-order-of-their-apperance)
  * [Document Body](#document-body)
  * [Author](#author)
    * [Address](#address)
    * [Geo](#geo)
  * [Ingredients](#ingredients)
    * [Water](#water)
    * [Solid](#solid)
    * [Hop](#hop)
    * [Yeast](#yeast)
  * [Brewing](#brewing)
    * [Mashing](#mashing)
    * [Sparging](#sparging)
    * [Fermentation](#fermentation)
* [Recurring Types](#recurring-types)
  * [Multi language texts](#multi-language-texts)
  * [Amount](#amount)

## Supported Solids
TODO: Translate grain types and add them to "Wording"  

| Value             | Grain Type            | Extract in Grams |
|-------------------|-----------------------|-----------------:|
| pilsenerMalt      | Pilsener Malz         |        800 - 840 |
| viennaMalt        | Wiener Malz           |        800 - 820 |
| munichMalt        | Münchner Malz         |        790 - 820 |
| caraMalt          | Caramalz              |        720 - 750 |
| caraMaltDark      | Caramalz, dunkel      |        720 - 760 |
| wheatMalt         | Weizenmalz            |        800 - 820 |
| roastedMalt       | Röstmalz              |        700 - 750 |
| corn              | Mais                  |        800 - 810 |
| rice              | Reis                  |              800 |
| grainFlakes       | Getreideflocken       |        650 - 750 |
| saccharose        | Haushaltszucker       |             1000 |
| dryMaltExtract    | Malzextrakt (trocken) |              990 |
| liquidMaltExtract | Flüssigmalzextrakt    |              800 |
| honey             | Honig                 |        680 - 750 |

## Supported Unit Types
Some elements need a concrete specification of their unit types. The supported unit types for the respective element are  defined below.  

| Element     | Type   | Possible Values                         |
|-------------|--------|-----------------------------------------|
| ratioUnit   | string | gramPerLiter, percent, degreePlato      |
| tempUnit    | string | celsius, fahrenheit, kelvin             |
| timeUnit    | string | week, hour, minute, second, millisecond |
| tasteUnit   | string | ibu                                     |
| chemicalUnit| string | dh, ppm                                 |
| colorUnit   | string | srm, lovibond, ebc                      |

#### Unit Type Value Description
| Value         | Display Hint     | Description                                                                 |
|---------------|------------------|-----------------------------------------------------------------------------|
| gramPerLiter  | g/L              | Defines the ratio amount of grams for each liter                            |
| percent       | %                | Defines the ratio amount in percent (fraction of 100)                       |
| volumePercent | % vol.           | MISSING: Has anyone a good description?                                     |
| degreePlato   | °P               | MISSING: Has anyone a good description?                                     |
| celsius       | °C               | Temperature using Celsius skala                                             |
| fahrenheit    | °F               | Temperature using Fahrenheit skala                                          |
| kelvin        | °K               | Temperature using Kelvin skala                                              |
| week          |                  | You don't know that? Go back to school ;)                                   |
| hour          |                  | You don't know that? Go back to school ;)                                   |
| minute        |                  | You don't know that? Go back to school ;)                                   |
| second        |                  | You don't know that? Go back to school ;)                                   |
| millisecond   |                  | You don't know that? Go back to school ;)                                   |
| ibu           | IBU              | International Bitterness Unit for measuring bitterness                      |
| dh            | °dH              | Measuring unit for alkalinity or "hardness" of water                        |
| ppm           | ppm              | Measuring unit for alkalinity or "hardness" of water                        |
| srm           | SRM              | "Standard Reference Method" Standard color measuring unit outside of europe |
| lovibond      | °L               | "Degree Lovibond" First, oldest and rareliest color measuring unit          |
| ebc           | EBC              | "European Brewing Convention" Standard color measuring unit in europe       |

## Elements in order of their apperance
#### Document Body  
| Element            | Type                                                  | Description                                                                                                                        |
|--------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| openBrewVersion    | string                                                | Defines the version of the Open Brew Format (major.minor.patch)                                                                    |
| encoding           | string                                                | Defines the encoding of the current json document, standard ist "UTF-8"                                                            |
| recipeName         | string                                                | The Name of the beer brewing recipe                                                                                                |
| recipeVersion      | number                                                | Defines the version of the recipe. Every change increases the value by 1, beginning by 1                                           |
| createDate         | date-time                                             | Provides the date and time when this recipe has been created                                                                       |
| changeDate         | date-time                                             | Provides the date and time of the last change to this recipe                                                                       |
| brewStyle          | string                                                | Brew style, i. e. "Amber Lager". Freetext, too much variations here                                                                |
| descriptions       | array  [Multi language texts](#multi-language-texts)  | Describe your recipe in a few words. Muliple languages supported                                                                   |
| matureTime         | object [Amount](#amount)                              | The expected timespan the beer needs to mature                                                                                     |
| originalWort       | object [Amount](#amount)                              | The amount of original wort in your maish. Nearly always describes in percent                                                      |
| bitterness         | object [Amount](#amount)                              | Describes the bitterness of your beer. IBU is the unit                                                                             |
| carbonDioxide      | object [Amount](#amount)                              | The little thing, that makes you burp comes up with that likely name. It's preferred to define it in gram per liter                |
| author             | object [Author](#author)                              | Provides information about the author of the current recipe                                                                        |
| ingredients        | object [Ingredients](#ingredients)                    | Provides every commodity you need to start brewing                                                                                 |
| brewing            | array  [Brewing](#brewing)                            | Describes the hard way to glory. The steps to your own beer. And that manual and also fully automated. Automated is not so hard ;) |

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

#### Address
| Element        | Type          | Description                                                              |
|----------------|---------------|--------------------------------------------------------------------------|
| street         | string        | Full street name with house number and additions (i. e. "Street 14 A")   |
| zip            | string        | Zip of the address, string for international use                         |
| city           | string        | The city of the address. For multilingual citynames, use english version |
|federated State | string        | The federated state (not available in all countries) i. e. "Bavaria"     |
| country        | string        | The name of the brewers country                                          |

#### Geo
| Element   | Type   | Description                                           |
|-----------|--------|-------------------------------------------------------|
| latitude  | number | Latitude of the address (value between -90 and 90)    |
| longitude | number | Longitude of the address (value between -180 and 180) |

#### Ingredients
| Element | Type                     | Description                                                              |
|---------|--------------------------|--------------------------------------------------------------------------|
| water   | object [Water](#water)   | An object that provides some data about the brewing water                |
| solids  | array  [Solid](#solid)   | This array contains all used solids and their details                    |
| hops    | array  [Hop](#hop)       | This array contains all hops and their details                           |
| yeast   | object [Yeast](#yeast)   | The details about the yeast to use                                       |

#### Water
| Element       | Type                     | Description                                                      |
|---------------|--------------------------|------------------------------------------------------------------|
| alkalinity    | object [Amount](#amount) | Defines the required, ideal alkalinity of brewing water          |

#### Solid
| Element        | Type                     | Description                                                                               |
|----------------|--------------------------|-------------------------------------------------------------------------------------------|
| name           | string                   | Name of the used solid                                                                    |
| type           | enum                     | Type of the used solid ([Supported Solids](#supported-solids))                            |
| relativeAmount | object [Amount](#amount) | The relative amount in percent. All amounts found in solids-array together must yield 100 |
| color          | object [Amount](#amount) | The color in the unit type. So that the final color of the beer can be calculated         |

#### Hop
Seems like here is something to do...

#### Yeast
| Element | Type   | Description            |
|---------|--------|------------------------|
| name    | string | Name of the used yeast |

#### Brewing
| Element      | Type                                 | Description                                          |
|--------------|--------------------------------------|------------------------------------------------------|
| mashing      | object [Mashing](#mashing)           | Stop! Mashing Time! Here are all rest steps defined. |
| sparging     | object [Sparging](#sparging)         | Steps for sparging                                   |
| fermentation | object [Fermentation](#fermentation) | Steps for fermentation                               |

#### Mashing
| Element           | Type                     | Description                                                     |
|-------------------|--------------------------|-----------------------------------------------------------------|
| mashInTemperature | object [Amount](#amount) | When this temperature has been reached, add solids to your mash |
| rests             | array [Rest](#rest)      | Defines the rests at each temperature levels                    |

#### Mash In Temperature
Seems like here is something to do...

#### Rest
Seems like here is something to do...

#### Sparging
Seems like here is something to do...

#### Fermentation
Seems like here is something to do...

## Recurring Types
Some types are more or less often reused in open brew format.

#### Multi language texts
| Element  | Type   | Description                                   |
|----------|--------|-----------------------------------------------|
| language | string | Defines the language by ISO 639-1, i. e. "en" |
| text     | string | The text value in the specified language      |

#### Amount
| Element       | Type   | Description                                                                                                           |
|---------------|--------|-----------------------------------------------------------------------------------------------------------------------|
| amout         | number | A double-precision floating point number representing the value                                                       |
| {current}Unit | string | The unit type of the amount. For possible element names and  values see [Supported Unit Types](#supported-unit-types) |