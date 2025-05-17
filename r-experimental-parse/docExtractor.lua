return function(markdown)
    local lines = {}
    for line in markdown:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    local result = {
        title = nil,
        description = nil,
        signature = nil,
        parameters = {}
    }

    local current = "header"
    local insideCodeblock = false
    local codeblockLanguage = nil
    local insideAdmonition = false
    local descriptionCaptured = false

    for i = 1, #lines do
        local line = lines[i]

        if line:match("^!!!") then
            insideAdmonition = true
            goto continue
        elseif insideAdmonition then
            if line:match("^%s*$") or not line:match("^%s") then
                insideAdmonition = false
            else
                goto continue
            end
        end

        if line:match("^## Parameters") then
            current = "parameters"
        elseif line:match("^```") then
            if not insideCodeblock then
                insideCodeblock = true
                codeblockLanguage = line:match("^```(%w+)")
            else
                insideCodeblock = false
                codeblockLanguage = nil
            end
        elseif line:match("^# ") and current == "header" then
            result.title = line:match("^#%s+`(.-)`") or line:match("^#%s+(.-)$")
        elseif current == "header" and not descriptionCaptured and line:match("%S") then
            result.description = line
            descriptionCaptured = true
        elseif insideCodeblock and codeblockLanguage == "luau" and not result.signature then
            result.signature = line
        elseif current == "parameters" and line:match("|") then
            local param, desc = line:match("|%s*`.-luau%s+(.-)`%s*|%s*(.-)%s*|")
            if param and desc then
                result.parameters[param] = desc
            end
        end

        ::continue::
    end

    return result
end
