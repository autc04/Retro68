#include "LaunchMethod.h"

LaunchMethod::LaunchMethod()
{

}

LaunchMethod::~LaunchMethod()
{

}

void LaunchMethod::GetOptions(boost::program_options::options_description &desc)
{
}

bool LaunchMethod::CheckPlatform()
{
    return true;
}

bool LaunchMethod::CheckOptions(boost::program_options::variables_map &options)
{
    return true;
}
