set_project("stfc-community-patch")

set_languages("c++20")

add_requires("eastl")
add_requires("spdlog")
add_requires("protobuf-cpp 3.19.4")
add_requires("toml++")
add_requires("nlohmann_json")
add_requires("inifile-cpp")
add_requires("7z")
add_requires("lzma")
add_requires("librsync")
add_requires("libcurl", { configs = { zlib = true } })

if is_plat("windows") then
    includes("win-proxy-dll")
    add_links('rpcrt4')
end

if is_plat("macosx") then
    includes("macos-dylib")
    includes("macos-loader")
    includes("macos-launcher")
end

add_rules("mode.debug")
add_rules("mode.release")
add_rules("mode.releasedbg")

package("libil2cpp")
on_fetch(function(package, opt)
    return { includedirs = path.join(os.scriptdir(), "third_party/libil2cpp") }
end)
package_end()

add_requires("spud v0.2.0.alpha.5")
add_requires("libil2cpp")
add_requires("simdutf")

-- includes("launcher")
includes("mods")


add_repositories("stfc-community-patch-repo xmake-packages")
