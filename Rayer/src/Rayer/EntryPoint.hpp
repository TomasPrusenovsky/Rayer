#pragma once

#ifdef RY_PLATFORM_WINDOWS

extern Rayer::Application* Rayer::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Rayer::CreateApplication();
	app->Run();
	delete app;
}

#endif // RY_PLATFORM_WINDOWS
