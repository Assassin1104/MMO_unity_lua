ResPath = ResPath or {}

function ResPath.GetFullUIPath( relativePath )
	return "Assets/AssetBundleRes/ui/"..relativePath
end

function ResPath.GetRoleHeadRes( career, head_id )
	local res_id = career*1000 + head_id
	return "Assets/AssetBundleRes/ui/roleHead/head_"..res_id..".png"
end

return ResPath