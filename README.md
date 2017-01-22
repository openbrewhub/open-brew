# Open-Brew
Let's design an international json-based standard format, used for the exchange and automisation of beer brewing receipes

The beer brewing scene changes. Since the craftbeer revolution came along, brewing beer became a popular sport again. Everyone has the ability to brew a custom beer. Everyone can make experiences and develop own receipes. And that's great. But the distribution of these receipes is a disaster.  
So much happened in the last years. There are so much cool projects (such as [craftbeerpi](https://github.com/Manuel83/craftbeerpi "Goto craftbeerpi"), [kleiner-brauhelfer](https://github.com/Gremmel/kleiner-brauhelfer "Goto kleiner-brauhelfer") and so on) but all of them use individual data exchange formats like sql and so on. So we still miss an offical standard for brewing receipes. Let us design a worldwide standard format in json schema together. Let's make the default for home brewing automation. Let's make it possible, sharing brew receipes across the world. Everyone with some experience in brewing and json is welcome!

#### Steps to version 1.0.0
- Finalize the json example_open_brew_v_0_0_1
- Extract json schema from example
- Add description, required fields, enum values
- Add GNU GPL License to repo
- Release version 1.0.0

#### Requirements:
- Json Schema as definition format
- Versioning for further development
- Multi language support
- Definement of multiple receipes in one document
- Free definition of brew steps
- Support for multiple units, etc.

#### Thoughts for future versions
- Swagger json definition
- Central online portal for all recipes worldwide
- Directly import your favourite receipes to your IoT-Device
- Address all automated parts (SSRs; Pumps; ...) in this json format

Have a look at the [JSON Example](https://github.com/SeeSharp7/Open-Brew/blob/master/v1.0.0/open-brew-example-1_0_0.json "JSON Example for Open Brew Version 1.0.0")
