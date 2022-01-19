local function BaseClass(super)
	local class_type={}
	class_type.Constructor=false
	class_type.DefaultVar=false
	class_type.super=super
	class_type.New=function(...) 
		local obj=nil
		local create
		create = function(c, obj, ...)
			if c.super then
				create(c.super, obj, ...)
			end
			if c.Constructor then
				c.Constructor(obj,...)
			end
		end
		-- if class_type.DefaultVar then
		-- 	obj = class_type.DefaultVar(obj)
		-- else
			obj = {}
		-- end
		local function meta_func(t, k)
			local ret = class_type[k]
			obj[k] = ret
			return ret
		end
		setmetatable(obj, { __index=meta_func })
		create(class_type, obj, ...)
		return obj
	end

	if super then
		setmetatable(class_type,{__index=
			function(t,k)
				local ret=super[k]
				class_type[k]=ret
				return ret
			end
		})
	end
 
	return class_type
end

return BaseClass