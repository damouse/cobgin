class Wire_Internal
	attr_accessor :properties

	def initialize properties
		@properties = properties
	end

	def write

		#write out the internal MKMapping fucntion
		ret = ''

		ret << mapping_opening
		ret << attributes
		ret << relationships

		ret << "\treturn mapping;\n}\n"
	end


	def mapping_opening
		#write the boring crap in the mapper
		boring =  "\n\n#pragma mark Connection Manager\n"
		boring << "+ (RKObjectMapping *) mapping {\n"
		boring << "\t//returns the mapping needed by RestKit to perform API calls\n"
		boring << "\tRKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];\n"
		boring << "\t[restaurantMapping addAttributeMappingsFromDictionary:@{"
	end

	def attributes
		#write out a mapping for every mapping
		ret = ''
		properties.each do |p| 
			if p.nested == nil
				ret << "\n\t@\"#{p.api}\": @\"#{p.name}\"," 
			end
		end
		
		#remove the last comma
		ret.chop!

		#add the last bit of formatting to the end
		ret << "  }];\n\n"

		ret
	end

	def relationships
		ret = ''

		properties.each do |p| 
			unless p.nested == nil
				#get the object mapping
				object = p.nested

				mapping = object.downcase << "Mapping"
				relationship = object.downcase << "Relation"

				ret << "\tRKObjectMapping *#{mapping} = [#{p.nested} mapping];\n"

				ret << "\tRKRelationshipMapping *#{relationship} = "
				ret << "[RKRelationshipMapping relationshipMappingFromKeyPath:@\"#{p.api}\" toKeyPath:@\"#{p.name}\" withMapping:#{mapping}];\n"

				ret << "\t[mapping addPropertyMapping:#{relationship}];\n\n"
			
			end
		end

		ret		
	end
end