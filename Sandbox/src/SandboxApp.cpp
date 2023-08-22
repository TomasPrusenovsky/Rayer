#include <Rayer.hpp>

class Sandbox : public Rayer::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

Rayer::Application* Rayer::CreateApplication()
{
	return new Sandbox();
}