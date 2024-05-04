# Define package resource to install Flask
package { 'flask':
  provider => 'pip3',
  command  => '/usr/bin/pip3 install flask==2.1.0',
}
