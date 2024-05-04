# File: install_python_flask_werkzeug.pp

# Define package resource to install Python3
package { 'python3':
  ensure => installed,
}

# Define package resource to install python3-pip
package { 'python3-pip':
  ensure  => installed,
  require => Package['python3'], # Ensure Python3 is installed before installing python3-pip
}

# Define package resource to install Flask
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'], # Ensure python3-pip is installed before installing Flask
}

# Define package resource to install Werkzeug
package { 'werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  require  => Package['python3-pip'], # Ensure python3-pip is installed before installing Werkzeug
}
