workspace "Rayer"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Rayer"
    location "Rayer"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/"..outputdir.."/%{prj.name}")
    objdir ("bin-int/"..outputdir.."/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"

    defines
    {
        "RY_PLATFORM_WINDOWS",
        "RY_BUILD_DLL"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
    }

    filter "configurations:Debug"
        defines "RY_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "RY_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "RY_DIST"
        optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/".. outputdir .."/%{prj.name}")
	objdir ("bin-int/".. outputdir .."/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Rayer/src"
	}

	links
	{
		"Rayer"
	}

    filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"RY_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "RY_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "RY_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "RY_DIST"
		optimize "On"

