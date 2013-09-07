#cobgin
#this is a hypothetical test of what an objective-c scaffolding engine would look like in Ruby
#pound signs deliniate comments. These lines are ignored

#types in .cob and their objective-c equivalents
#str = NSString
#arr = NSArray
#bool = BOOL
#int = int
#flt = float
#dict = NSDictionary

#the format is as follows: type name apiKey(ReturnType) 
#the parenthesis tells cobgin that the item returned at that API key is an array/dictionary of a custom
#item type (included in this document). MUST BE INCLUDED TO BE HOOKED UP

#objects, can be pre-declared or not (duplicate declarations of the objects are ignored)

#note that properties have to be tabbed in
#Menu url/Menu
#	str name restaurantName
#	arr items menuItems(Item) 

#Item url/Item
#	str name itemName
#	arr ingredients ingredientAPI(Ingredient) 

Restaurant http://www.culvers.com/cws2/queryalllocations.aspx
	str restaurantID restaurantKey
	str number restaurantNumber
	str name restaurantName
	str hours hours
	str mailingAddress mainAddress
	str city city
	str state state
	str zip zipCode
	str phone phone
	str address physicalAddress
	str url url

Flavor http://www.culvers.com/cws2/queryflavors.aspx
	str flavorID flavorID
	str name flavorName
	str description flavorDescription
	bool live isLive
	str image fotdImage

Menu http://www.culvers.com/cws2/querymenudisplay.aspx
	arr groups GroupNode(Group)

Ingredient
	str ingredientID 
	str name aIngredient
	str calories calories
	str caloriesFat calFromFat
	str totalFat totalFat
	str satFat satFat
	str transFat transFat
	str carbs carbs
	str protein protein
	str sugar sugar
	str cholesterol cholesterol
	str fiber dietFiber
	str servingSize servingSize
	str sodium sodium

Item
	str itemID aIdMenuItem
	str description aDescription
	str image afileName
	str name aMenuItem
	arr ingredients IngNode(Ingredient)
	bool androidEnabled IsAndroidEnabled
	bool ecoprintEnabled IsEconoprintEnabled
	bool iphoneEnabled IsIPhoneEnabled
	arr allergens zAllergenNode

Group
	str menuID aIdMenuGroup
	str name aMenuGroup
	arr items MenuItemNode(Item)

#note: haven't done FOTD yet