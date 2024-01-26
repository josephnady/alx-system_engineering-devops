# 0x04-loops_conditions_and_parsing

# Make `Linux/Unix` Script Portable With #!/usr/bin/env As a Shebang
# #!/usr/bin/env As a Shebang
* The `#!` is called a **shebang**. 
* It consists of a number sign and an exclamation point character `(#!)`, followed by the full path to the interpreter such as `/bin/bash`. All scripts under Linux, *BSD, macOS, and Unix-like system execute using the interpreter specified on a first line. However, there is a small problem. BASH or Perl is not always in the same location (PATH) such as /bin/bash or /usr/bin/perl. If you want to make sure that script is portable across different UNIX like operating systems you need to use /usr/bin/env command as shebang.

* The advantage of `#!/usr/bin/env` bash is that it will use whatever bash executable appears first in the running user’s $PATH variable. If you have two version of bash installed as follows and PATH set to `/home/vivek/bin:/usr/local/bin:/usr/bin:/bin:/usr/games/bin:/bin:/usr/bin`, than bash4 will execute the script:

* /bin/bash # <-- bash3
* /usr/local/bin/bash # <-- bash4
<blockquote style="border: 1px solid black; padding: 10px;">
	<h1>Background Context</h1>


	<h2>Resources</h2>
	<p><strong>Read or watch:</strong></p>
<p>
Loops sample
Variable assignment and arithmetic
Comparison operators
File test operators
Make your scripts portable
man or help:

env
cut
for
while
until
if
Learning Objectives
At the end of this project, you are expected to be able to explain to anyone, without the help of Google:

General
How to create SSH keys
What is the advantage of using #!/usr/bin/env bash over #!/bin/bash
How to use while, until and for loops
How to use if, else, elif and case condition statements
How to use the cut command
What are files and other comparison operators, and how to use them
Requirements
General
Allowed editors: vi, vim, emacs
All your files will be interpreted on Ubuntu 20.04 LTS
All your files should end with a new line
A README.md file, at the root of the folder of the project, is mandatory
All your Bash script files must be executable
You are not allowed to use awk
Your Bash script must pass Shellcheck (version 0.7.0) without any error
The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
The second line of all your Bash scripts should be a comment explaining what is the script doing
Copyright - Plagiarism
You are tasked to come up with solutions for the tasks below yourself to meet with the above learning objectives.
You will not be able to meet the objectives of this or any following project by copying and pasting someone else’s work.
You are not allowed to publish any content of this project.
Any form of plagiarism is strictly forbidden and will result in removal from the program.
More Info
Shellcheck
Shellcheck is a tool that will help you write proper Bash scripts. It will make recommendations on your syntax and semantics and provide advice on edge cases that you might not have thought about. Shellcheck is your friend! All your Bash scripts must pass Shellcheck without any error or you will not get any points on the task.

Shellcheck is available on the school’s computers. If you want to use it on your own computer, here is how to install it.

Examples:

Not passing Shellcheck:



Passing Shellcheck:


For every feedback, Shellcheck will provide a code that you can use to get more information about the issue, for example for code SC2034, you can browse https://github.com/koalaman/shellcheck/wiki/SC2034.
</p>
</blockquote>


