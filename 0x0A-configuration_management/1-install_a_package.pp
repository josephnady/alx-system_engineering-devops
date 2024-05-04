# Define package resource to install Flask
package { 'python3-flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
