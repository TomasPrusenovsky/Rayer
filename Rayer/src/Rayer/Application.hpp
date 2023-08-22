#pragma once

#include "Core.hpp"

namespace Rayer
{
	class RAYER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// Defined in the Client
	Application* CreateApplication();
}


