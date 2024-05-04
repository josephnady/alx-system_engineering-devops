# Define package resource to install Flask
package { 'flask':  
  provider        => 'pip3',
  install-options => '2.1.0'
}
