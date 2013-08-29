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
Menu
Item
Ingredient
Store

#note that properties have to be tabbed in
Menu
	str name restaurantName
	arr items menuItems(Items) 

Item
	str name
	arr Ingredients 
