#pragma once

#ifdef RY_PLATFORM_WINDOWS
	#ifdef	RY_BUILD_DLL
		#define RAYER_API _declspec(dllexport)
	#else
		#define RAYER_API _declspec(dllimport)
	#endif // RY_BUILD_DLL
#else 
	#error Rayer only supports windows!
#endif // RY_PLATFORM_WINDOWS
