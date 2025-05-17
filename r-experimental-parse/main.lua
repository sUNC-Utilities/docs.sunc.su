local fs = require("coro-fs")
local json = require("json")

local exclusions = require("exclusions")

local extractIndex = require("indexExtractor")
local extractDoc = require("docExtractor")

local tree = {}
for item in fs.scandir("../docs") do
    if item.type == "directory" and not exclusions:contains(item.name) then
        local library = {}

        for func in fs.scandir("../docs/" .. item.name) do
            if func.type ~= "directory" then
                library[func.name:gsub(".md", "")] = fs.readFile(("../docs/%s/%s"):format(item.name, func.name))
            end
        end

        tree[item.name] = library
    end
end

local function clean(md)
    md = md:gsub("%*%*(.-)%*%*", "%1") --bold
    md = md:gsub("%*(.-)%*", "%1")     -- italic
    md = md:gsub("__(.-)__", "%1")     -- underline
    md = md:gsub("_(.-)_", "%1")       -- italic again but with underscores
    md = md:gsub("`(.-)`", "%1")       -- inline code
    md = md:gsub("%[(.-)%]%b()", "%1") -- markdown links

    return md
end

local function normaliseSnippets(md)
    return md:gsub("`#!luau%s+(.-)`", "`%1`")
end

--[[
functions to be cautious of (due to unique doc format) when parsing:
WebSocket library
Connection object under Signals lib
request() function
filtergc()

uhh more i forgor
]]

local bot = {}
for libname, library in pairs(tree) do
    bot[libname] = {}

    for func, doc in pairs(library) do
        if func == "README" then
            local description = extractIndex(doc)
            bot[libname]._description = description
            bot[libname]._link = "https://docs.sunc.su/" .. libname
        elseif func == "WebSocket" then
            -- do nothing, we will parse this separately later
        elseif libname == "Signals" and func == "Connection" then
            -- also do nothing, will parse this later
        else
            local a = extractDoc(doc)

            a.description = normaliseSnippets(a.description)

            -- normalise (local) paths into actual external doc links
            a.description = a.description:gsub("%.%.%/", "https://docs.sunc.su/")
            a.description = a.description:gsub("%.%/", "https://docs.sunc.su/" .. libname .. "/")

            --a.description = normaliseSnippets(extractIndex(doc))

            for param, desc in pairs(a.parameters) do
                a.parameters[param] = normaliseSnippets(desc)
            end

            a.link = string.format("https://docs.sunc.su/%s/%s", libname, func)

            bot[libname][func] = a
        end
    end
end

fs.mkdirp("../docs/built-info")

local bot_json = json.encode(bot, { indent = true })
fs.writeFile("../docs/built-info/bot.json", bot_json)

local viewer = {}

for libname, lib in pairs(bot) do
    for k, func in pairs(lib) do
        if k ~= "_description" and k ~= "_link" then
            viewer[func.title or ""] = clean(func.description or "")
        end
    end
end

viewer[""] = nil

local viewer_json = json.encode(viewer, { indent = true })
fs.writeFile("../docs/built-info/viewer.json", viewer_json)
