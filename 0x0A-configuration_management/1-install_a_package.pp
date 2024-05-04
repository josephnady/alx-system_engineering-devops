# Define package resource to install Flask
package { 'flask':
  ensure   => [installed, '2.1.0'],
  provider => 'pip3',
}
