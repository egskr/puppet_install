class puppet_install::agent_inst {
     notify { 'Agent': }


  package { 'puppet-agent':
    ensure  => present,
    require => Yumrepo['puppet_repo'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => "https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm",
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


