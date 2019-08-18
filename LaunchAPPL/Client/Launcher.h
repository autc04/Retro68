#ifndef LAUNCHER_H
#define LAUNCHER_H

#include <boost/program_options/variables_map.hpp>
#include "ResourceFile.h"
#include <boost/filesystem.hpp>

/**
 * @brief The Launcher class
 *
 * Subclasses are instantiated by the corresponding LaunchMethod subclasses.
 */

class Launcher
{
protected:
    boost::program_options::variables_map& options;

    ResourceFile app;
    boost::filesystem::path tempDir, appPath, outPath;
    bool keepTempFiles;
public:
    /**
     * @brief Launcher
     * @param options
     *
     * Create a Launcher object and set up a temporary directory to play in.
     * Reads the Applicatio specified on the command line into the `app` member variable.
     * Also create an empty file named 'out' in the temporary directory, for test suite programs.
     */
    Launcher(boost::program_options::variables_map& options);

    /**
     * @brief Launcher
     * @param options
     * @param f
     *
     * Create a Launcher object, set up a temporary directory
     * and store the application to be executed at `appPath` in the temporary directory,
     * using format `f`.
     */
    Launcher(boost::program_options::variables_map& options, ResourceFile::Format f);


    /**
     * @brief ~Launcher
     * Delete our temporary directory.
     */
    virtual ~Launcher();

    /**
     * @brief Go
     * @param timeout
     * @return true for success
     *
     * Launch the application, return true on success and false on error or timeout.
     */
    virtual bool Go(int timeout = 0) = 0;

    /**
     * @brief DumpOutput
     *
     * After the application has been run, copy the contents of the 'out' file to stdout.
     */
    virtual void DumpOutput();

    /**
     * @brief KeepTempFiles
     * Inhibit deletion of the temporary directory.
     */
    void KeepTempFiles() { keepTempFiles = true; }
};

#endif // LAUNCHER_H
