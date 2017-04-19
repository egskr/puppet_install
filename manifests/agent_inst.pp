class puppet_install::agent_inst  (
  ) inherits puppet_install::params

  {
  notify { 'Agent': }

  package { 'puppet-agent':
    ensure  => $::puppet_install::puppet_agent_ver,
    require => Yumrepo['puppet_repo'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => $::puppet_install::baseurl,
    gpgkey   => $::puppet_install::gpgkey,
    enabled  => '1',
    gpgcheck => '1',
  }

  service { 'puppet':
    ensure  => 'running',
    enable  => true,
    require => Package['puppet-agent'],

 include puppet_install::lighttpd
  }
 
  
}


