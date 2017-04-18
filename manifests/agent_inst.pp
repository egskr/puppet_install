class puppet_install::agent_inst {
     notify { 'Agent': }


  package { 'puppet-agent':
    ensure  => present,
    require => Yumrepo['puppet_repo'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => "http://yum.puppetlabs.com/el/7/PC1/x86_64/",
    gpgkey   => "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
    enabled  => '1',
    gpgcheck => '1'
  }

   service { 'puppet':
    ensure  => 'running',
    enable  => true,
    require => Package['puppet-agent'],
   }

  
}


