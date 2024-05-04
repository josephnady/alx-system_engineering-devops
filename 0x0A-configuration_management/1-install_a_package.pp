# Define package resource to install Flask
package { 'flask':  
  ensure   => installed,
  ensure   => '2.1.0',
  provider => 'pip3'
}
