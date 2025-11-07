# Shell Tutor - Interactive Unix Shell Tutorials


## Quick Start

*In these code examples a dollar sign `$` represents the shell's prompt.  It is shown to distinguish commands that you type from the output they produce. Do not type the `$` when you run these commands yourself.*

0.  Install Git on your computer.
    *   Instructions for [macOS users](#instructions-for-macos-users)
    *   Instructions for [Windows users](#instructions-for-windows-users)
1.  Clone this repository.  Your output may be slightly different than this:
    ```
    $ git clone https://github.com/SmallSatGasTeam/BashTutorial

    Cloning into 'shell-tutor'...
    warning: redirecting to https://github.com/SmallSatGasTeam/BashTutorial
    remote: Enumerating objects: 40, done.
    remote: Counting objects: 100% (40/40), done.
    remote: Compressing objects: 100% (39/39), done.
    remote: Total 40 (delta 2), reused 0 (delta 0), pack-reused 0
    Receiving objects: 100% (40/40), 136.65 KiB | 1.59 MiB/s, done.
    Resolving deltas: 100% (2/2), done.
    ```
2.  Enter the `shell-tutor` directory and run `./tutorial.sh`:
    ```
    $ cd shell-tutor

    $ ./tutorial.sh

    Tutor: Shell Lesson #0: Unix Shell Basics
    Tutor:
    Tutor: In this lesson you will learn about
    Tutor:
    Tutor: * Using the Unix command line interface (CLI)
    Tutor: * Commands and arguments
    Tutor: * Hidden files
    Tutor: * The difference between the 'shell' and the 'terminal'
    Tutor: * How to clear and reset the terminal
    Tutor: * Cancelling a runaway command
    Tutor: * Understanding messages and recovering from errors
    Tutor:
    Tutor: This lesson takes around 20 minutes.
    Tutor:
    Tutor: [Press ENTER]
    ```
3.  As you reach the end of the lesson **do not close the terminal** until you see the message `Run ./tutorial.sh to start the next lesson`.



## Features

*   This is not a fake, pretend "shell" as seen on the internet.  You are running *real* commands in a *real* shell on your own computer and get *real* feedback on the results.
*   The tutor adjusts its plan as you go.  If you skip ahead in the sequence, so does the tutor.
*   Compatible with Bash versions >= 4.2 and Zsh versions >=5.2.


## Command Logging

The Shell Tutor makes **session logs** of your activity during lessons.  Session logs contain commands you ran, the Shell Tutor's state, and other details about your environment. *Session logs are not used for grading*.  They're used to improve the tutor, identify tough lessons, and guide enhancements.  The logs are confidential, and are seen only by the developers unless you consent to share further.

If you have any questions about command logging, please contact Joshua Hessing (email: jhessing@gas.usu.edu).


## Hints

*   Interact with the tutor through the `tutor` command.
    *   When you get lost or forget what to do next, run `tutor hint`.
*   You can leave the tutorial early by exiting the shell.  There are many ways to do this:
    *   The `exit` command
    *   The `tutor quit` command
    *   Type the End-Of-Transmission character (EOT) `Ctrl-D`
*   The typical duration of each lesson is displayed at startup.  If you are stuck longer than this seek help from the TAs, the CS Coaching Center, or your instructor.



## Reporting Problems

When you encounter a problem with a lesson, please file a bug-report so I can fix it.

*   First, check the list of [known bugs](./BUGS.md) to make sure your bug hasn't already been reported.
*   Run one of the following commands to produce a listing of technical info:
    *   From within the lesson run `tutor bug`.
    *   If the problem kicked you out of the lesson, run `./bug-report.sh` instead.
*   Scroll up in your terminal before the problem began and, using your mouse, select text from that point all the way to the end of the command's output.
*   Copy and paste that text into an email message.  Include these details:
    -   Which lesson you are/were running
    -   Which step of the lesson you were on
    -   The instructions for that step
    -   The command you ran
    -   The erroneous output
    -   The output of the bug report command
*   Send this email to `jhessing@gas.usu.edu`.
    *   It is best to not send screenshots; plain text is much easier for me to work with.


## Instructions For **macOS** Users

### How to open the Terminal app

0.  Press `Command + Space` to open Spotlight Search
1.  Type `terminal` into the search window and click the entry with black square icon


### Default interactive shell message

The first time you open the Terminal app you may see this message:

```
The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
```

If this happens to you, run the command as instructed.  You will be prompted to enter your password:

```bash
$ chsh -s /bin/zsh
Changing shell for fadein.
Password for fadein:
```

Finally, close and re-open the Terminal app.


### Installing `git` and `python3`

If you haven't yet installed the command line developer tools, you will be greeted by a pop up asking you to install them the first time you try to run `git` or `python3`.  Just click `Install`, accept the license, and you're off to the races.


### Keyboard shortcuts

Keyboard shortcuts are introduced in the lesson **4-projects.sh** which use both the `Control` and `Option` keys.  By default, `Option` does not do what is needed.  Follow these steps to set it up:

*   Launch the Terminal app
*   Open the `Terminal` menu and select `Preferences`
*   Select the `Profiles` page
*   Select the `Keyboard` tab
*   Check 'Use Option as Meta Key'

You do not need to restart the Terminal app for this setting to take effect.


## Instructions For **Windows** Users

*Note: The F' framework used by the FSW team requires linux so GAS team members are encouraged to install Windows Subsystem Linux (WSL) instead of Git for windows.*

### Installing Git for Windows

1. Visit [Microsoft Install WSL Instructions](https://learn.microsoft.com/en-us/windows/wsl/install)
2. Complete the instructions in the **Install WSL Command** section
   *    *Note: The other sections can be valuable but the "Install WSL Command" section is the only one required to get started.*
3. Restart your computer
4. Search for the Ubuntu application in the windows search bar
5. Open Ubuntu
6. Follow instructions to finish setup. **You will need the password you set so don't forget it!**
7. Once the terminal is open, run the command `sudo apt install git`



## Lesson Contents

*   **0-basics.sh** (20 minutes)
    *   Introduce the Unix command line interface (CLI)
    *   Commands and arguments
    *   Hidden files
    *   The difference between the *shell* and the *terminal*
    *   How to clear and reset the terminal
    *   Cancelling a runaway command
    *   Understanding messages and recovering from errors
*   **1-commands.sh** (20 minutes)
    *   Write and run even more complicated commands
    *   Use the `less` pager to read large documents in the terminal
    *   Learn the difference between **arguments** and **options**
    *   Find out how to get help in the shell
*   **2-files.sh** (20 minutes)
    *   Make copies of files
    *   Move and rename files
    *   Take advantage of tab completion
    *   Remove files
    *   Refer to multiple files with wild cards
*   **3-directories.sh** (15 minutes)
    *   Navigate directories
    *   Create new directories
    *   Remove empty directories
    *   Forcibly remove directories without regard for their contents
*   **4-projects.sh** (30 minutes)
    *   Create and edit text files with the Nano editor
    *   Organize files into directories
    *   Follow the DuckieCorp standard project structure
    *   Run unit tests and interpret their results
    *   Write project documentation
*   **5-ssh-key.sh** (10 minutes)
    *   Create an SSH key with `ssh-keygen`
    *   Learn what an SSH key is and how to put it on GitLab
    *   Test that your SSH key is correctly set up with `ssh`
*   **6-git.sh** (25 minutes)
    *   Prepare Git on your computer
    *   Ask Git for help about its commands
    *   Clone a Git repository onto your computer
    *   Check the status of your repository
    *   Change a file and commit it to the repository
    *   View the Git log
    *   Submit your homework to GitLab
*   **7-workflow.sh** (40 minutes)
    *   Review skills learned in other lessons
