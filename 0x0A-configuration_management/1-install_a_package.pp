# Define package resource to install Flask
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  command  => '/usr/bin/python3.8 -m pip',
}
