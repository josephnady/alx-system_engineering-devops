


<h1 class="gap">0x06. Regular expression</h1>
<div data-react-class="tags/Tags" data-react-props="{&quot;tags&quot;:[{&quot;id&quot;:5,&quot;value&quot;:&quot;Regex&quot;,&quot;author_id&quot;:null,&quot;created_at&quot;:&quot;2022-06-16T01:59:38.000Z&quot;,&quot;updated_at&quot;:&quot;2022-06-16T01:59:38.000Z&quot;},{&quot;id&quot;:6,&quot;value&quot;:&quot;DevOps&quot;,&quot;author_id&quot;:null,&quot;created_at&quot;:&quot;2022-06-16T01:59:38.000Z&quot;,&quot;updated_at&quot;:&quot;2022-06-16T01:59:38.000Z&quot;}]}" data-react-cache-id="tags/Tags-0"><div class="align-items-center d-flex flex-wrap gap-3 my-2"><span class="label label-primary" style="font-size: 14px;">Regex</span><span class="label label-primary" style="font-size: 14px;">DevOps</span></div></div>
<div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Concepts</h3>
    </div>
    <div class="panel-body">
      <p>
        <em>For this project, we expect you to look at this concept:</em>
      </p>

      <ul>
          <li>
            <a href="/concepts/29">Regular Expression</a>
          </li>
      </ul>
    </div>
  </div>
<div class="panel panel-default" id="project-description">
  <div class="panel-body">
    <h2>Background Context</h2>

<p>For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.</p>

<p>Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the <code>//</code>:</p>

<pre><code>sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
</code></pre>

<h2>Resources</h2>

<p><strong>Read or watch</strong>:</p>

<ul>
<li><a href="/rltoken/6VeaVMaugIxcFAwA27TBdQ" title="Regular expressions - basics" target="_blank">Regular expressions - basics</a> </li>
<li><a href="/rltoken/rntjh3-3S86zt0Qy28L10w" title="Regular expressions - advanced" target="_blank">Regular expressions - advanced</a> </li>
<li><a href="/rltoken/RGkVuw1lZ_hoCCbLsiOAhg" title="Rubular is your best friend" target="_blank">Rubular is your best friend</a> </li>
<li><a href="/rltoken/Vwm8lpMUGa4x_FBtlyUQ8g" title="Use a regular expression against a problem: now you have 2 problems" target="_blank">Use a regular expression against a problem: now you have 2 problems</a> </li>
<li><a href="/rltoken/XsQ6rzS1uy-E6bnswUqIKg" title="Learn Regular Expressions with simple, interactive exercises" target="_blank">Learn Regular Expressions with simple, interactive exercises</a> </li>
</ul>

<h2>Requirements</h2>

<h3>General</h3>

<ul>
<li>Allowed editors: <code>vi</code>, <code>vim</code>, <code>emacs</code></li>
<li>All your files will be interpreted on Ubuntu 20.04 LTS</li>
<li>All your files should end with a new line</li>
<li>A <code>README.md</code> file, at the root of the folder of the project, is mandatory</li>
<li>All your Bash script files must be executable</li>
<li>The first line of all your Bash scripts should be exactly <code>#!/usr/bin/env ruby</code></li>
<li>All your regex must be built for the Oniguruma library</li>
</ul>

  </div>
</div>
