local PackUTF8 = {} do
	function PackUTF8:Pack(RawString : string) : string
		local NewString = ""

		for _, Letter in next, RawString:split("") do 
			if tonumber(Letter) then 
				NewString ..= `,{Letter},`
			end

			NewString ..= `#{Letter:byte()}#`
		end

		return NewString
	end
	
	function PackUTF8:Unpack(RawString : string) : string
		local Letter_Pattern = "#[%d]+#"
		local Number_Pattern = ",[%d]+,"

		return RawString
			:gsub(Letter_Pattern, function(str : string)  
				local Byte = tonumber(str:match("[%d]+")) 

				if Byte then 
				return string.char(Byte)
			end

				return ""
			end)
			:gsub(Number_Pattern,function(str : string) 
				local Number = tonumber(str:match("[%d]*")) 

				if Number then 
				return Number
			end

				return ""
		end)
	end
end

return PackUTF8