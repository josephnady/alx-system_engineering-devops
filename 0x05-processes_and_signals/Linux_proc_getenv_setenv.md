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
    <center>
      <div style="margin-left:2px; margin-top:10px; margin-bottom:10px; ">

        <!-- AD BLOCK -->
		
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- TGS Inside Content -->
<ins class="adsbygoogle" style="display:inline-block;width:300px;height:250px" data-ad-client="ca-pub-8090601437064582" data-ad-slot="8643685131" data-adsbygoogle-status="done" data-ad-status="filled"><div id="aswift_1_host" style="border: none; height: 250px; width: 300px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-block;" tabindex="0" title="Advertisement" aria-label="Advertisement"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:300px;height:250px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="300" height="250" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8090601437064582&amp;output=html&amp;h=250&amp;slotname=8643685131&amp;adk=1526837709&amp;adf=890187083&amp;pi=t.ma~as.8643685131&amp;w=300&amp;lmt=1706366103&amp;format=300x250&amp;url=https%3A%2F%2Fwww.thegeekstuff.com%2F2012%2F03%2Flinux-processes-environment%2F&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTIwLjAuMjIxMC4xNDQiLG51bGwsMCxudWxsLCI2NCIsW1siTm90X0EgQnJhbmQiLCI4LjAuMC4wIl0sWyJDaHJvbWl1bSIsIjEyMC4wLjYwOTkuMjM0Il0sWyJNaWNyb3NvZnQgRWRnZSIsIjEyMC4wLjIyMTAuMTQ0Il1dLDBd&amp;dt=1706371951517&amp;bpp=1&amp;bdt=151&amp;idt=91&amp;shv=r20240122&amp;mjsv=m202401230101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D34d764283740c07e%3AT%3D1706369472%3ART%3D1706369472%3AS%3DALNI_MZZOBqLK_mRNkQQ1od1AoEuac4YKw&amp;prev_fmts=728x90&amp;correlator=6586331608690&amp;frm=20&amp;pv=1&amp;ga_vid=1677505336.1706369337&amp;ga_sid=1706371952&amp;ga_hid=858014207&amp;ga_fc=1&amp;u_tz=120&amp;u_his=1&amp;u_h=768&amp;u_w=1366&amp;u_ah=738&amp;u_aw=1366&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=351&amp;ady=1078&amp;biw=1343&amp;bih=630&amp;scr_x=0&amp;scr_y=0&amp;eid=44759876%2C44759927%2C31080588%2C95320869%2C95320888%2C95321626%2C95322165%2C95323004%2C21065725&amp;oid=2&amp;pvsid=4311087497216501&amp;tmod=732528457&amp;wsm=1&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fintranet.alxswe.com%2F&amp;fc=896&amp;brdim=0%2C0%2C0%2C0%2C1366%2C0%2C1366%2C738%2C1358%2C630&amp;vis=1&amp;rsz=%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=0&amp;bc=31&amp;bz=1.01&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;dtd=97" data-google-container-id="a!2" data-google-query-id="CLfz7rD7_YMDFcBuFQgdBOkLAA" data-load-complete="true"></iframe></div></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

        <!-- END AD BLOCK -->

	  </div>
    </center>


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
