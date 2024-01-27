<div class="headline_area">
					<h1 class="headline" itemprop="headline">Linux Processes – Environment extern, environ, getenv, setenv</h1>
					<div class="byline small">
						<span class="post_author_intro">by</span> <span class="post_author" itemprop="author">Himanshu Arora</span>
						<meta itemprop="datePublished" content="2012-03-12">
						<meta itemprop="dateModified" content="2012-03-29">
						<span class="post_date_intro">on</span> <span class="post_date" title="2012-03-12">March 12, 2012</span>
					</div>
				</div>
<div class="post_content" itemprop="articleBody">
<p>This is the 1st article of a new series on the processes in Linux.</p>
<p>The focus of this series would be on the practical aspects of process environment, process control, process relationships etc.</p>
<p>In this article, we will discuss how to get and set environment variables inside a C program.<br>
<span id="more-9879"></span><br>
Linux Processes Series: part 1 (this article), <a href="https://www.thegeekstuff.com/2012/03/linux-processes-memory-layout/ ">part 2</a>, <a href="https://www.thegeekstuff.com/2012/03/c-process-control-functions/">part 3</a></p>
<h3>What is a Process?</h3>
<p>A process can be thought of as an instance of a program in execution. We called this an ‘instance of a program’, because if the same program is run lets say 10 times then there will be 10 corresponding processes.</p>
<p>Moving ahead, each process has its own unique process ID through which it is identified in the system. Besides it own ID, a parent’s process ID is also associated with a process.</p>
<h3>The main() Function</h3>
<p>A ‘C’ program always starts with a call to main() function. This is the first function that gets called when a program is run.</p>
<p>The prototype of a main() function is :</p>


<pre>int main(int argc, char *argv[]);</pre>
<p>In the above prototype :</p>
<ul>
<li>The return type of the main() function is ‘int’. This is because,, when the main() function exits, the program finishes. And a return type from main() would signify whether the program got executed properly or not. In strict sense we say that if main() returns ‘0’, then the program got executed successfully. Any other return value indicates a failure.</li>
<li>The main() function accepts two arguments. One is the number of command line arguments and the other is the list of all the command line arguments.</li>
</ul>
<p>Lets take a small example code that explains the points mentioned above.</p>
<pre>#include&lt;stdio.h&gt;

int main(int argc, char *argv[])
{
  int count = argc;
  printf("\n The number of arguments passed is [%d] \n", count);

  int c = 0;
  while(c &lt; count)
  {
    printf("\n The argument [%d] is : [%s]\n", c+1, argv[c]);
    c++;
  }
  return 0;
}</pre>
<p>The above C code prints the number of command line arguments passed to it, and also prints the value of each argument.</p>
<p>When the program is executed, it displays the following output:</p>
<pre>$ ./main abc 1 3

The number of arguments passed is [4]

The argument [1] is : [./main]

The argument [2] is : [abc]

The argument [3] is : [1]

The argument [4] is : [3]</pre>
<p>We passed 3 arguments to the program ‘main’, but the log notifies that it received 4 arguments. This is because the name of the program (that we use to execute it) is also treated as a command line argument.</p>
<p>Also, since the above program was run on the terminal, the return value from the main() function is also sent to it. You can use <a href="https://www.thegeekstuff.com/2010/05/bash-shell-special-parameters/">bash shell special parameter</a> $? as shown below to check the return value (0 indicates success).</p>
<pre>$ echo $?
0</pre>
<ul>
<li>Coming back to the main function, when a C program is executed by the kernel, an ‘exec’ function is used to trigger the program.</li>
<li>Then in the next step, a typical startup routine is called just before the main() function of the program.</li>
<li>Similarly when a program ends execution then also a typical end routine is called.</li>
<li>If we look at any executable file, we will find that it specifies the start routine and ens routine addresses as the first routine and the last routine to be called.</li>
<li>The startup routine takes the command line arguments, environment etc from the kernel and passes these on to the main() function.</li>
<li>This whole setup comprising of the startup and end routine is done by the linker in the linking stage of the compilation process.</li>
</ul>
<h3>Environment List</h3>
<p>Type the command ‘env’ on your Linux prompt and you will get a list of name=value pairs. This represents your shell environment. Similarly, a process also has its environment. There are two ways in which we can access a process environment:</p>
<ol>
<li>Through the global variable ‘<strong>extern char **extern</strong>‘</li>
<li>Through the third argument to the main() function ‘char *envp[]’</li>
</ol>
<p>Regarding envp[] (the 3rd argument), you might ask from where a third argument to the main() function came from as we discussed earlier that main() function has only two arguments.</p>
<p>Well, historically a third argument (the environment array) to the main() function was present. But ISO C specifies that the main() function to be written with only two arguments. Hence we do not use this third argument when we specify main function. But, we could access this envp[] inside the program.</p>
<p>Anyways, coming back to the environment list, the following code snippet specifies how to access the environment from within a process :</p>
<pre>#include&lt;stdio.h&gt;
#include&lt;stdlib.h&gt;
#include&lt;unistd.h&gt;

extern char **environ;

int main(int argc, char *argv[])
{
  int count = 0;

  printf("\n");
  while(environ[count] != NULL)
  {
    printf("[%s] :: ", environ[count]);
    count++;
  }

  char *val = getenv("USER");
  printf("\n\nCurrent value of environment variable USER is [%s]\n",val);

  if(setenv("USER","Arora",1))
  {
    printf("\n setenv() failed\n");
    return 1;
  }

  printf("\n Successfully Added a new value to existing environment variable USER\n");

  val = getenv("USER");
  printf("\nNew value of environment variable USER is [%s]\n",val);

  while(1)
  {
    sleep(2);
  }
  return 0;
}</pre>
<p>In the above code, we have used the global variable ‘environ’ to access all the environment variables. Also we have used two functions :</p>
<ul>
<li>getenv – Get value of a particular environment variable</li>
<li>setenv – Set a new value to an environment variable</li>
</ul>
<p>The output of the above program comes out to be :</p>
<pre>$ ./environ

[ORBIT_SOCKETDIR=/tmp/orbit-himanshu] :: [SSH_AGENT_PID=1627] :: [TERM=xterm] ::
[SHELL=/bin/bash] :: [WINDOWID=39846040] :: [GTK_MODULES=canberra-gtk-module] ::
[USER=himanshu] :: [SSH_AUTH_SOCK=/tmp/keyring-6kpqGc/ssh] ::
..
..

Current value of environment variable USER is [himanshu]

Successfully Added a new value to existing environment variable USER

New value of environment variable USER is [Arora]</pre>
<p>The above output prints the whole environment list to the stdout. The above code snippet also used getenv and setenv to get the USER environment variable and changed its value.</p>
				</div>
