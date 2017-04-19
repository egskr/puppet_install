class puppet_install::lighttpd 

{ 

  package { 'lighttpd':
    ensure  => installed,   
  }

  file { '/var/www/lighttpd/index.html':
   ensure  => file,
   content => template('puppet_install/index.erb'),
   notify  => Service[lighttpd]
 }


  service { 'lighttpd':
    ensure  => 'running',
    enable  => true,
    require => Package['lighttpd'],
  }

}
