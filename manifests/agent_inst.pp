class puppet_install::agent_inst {
     notify { 'Agent': }


 # exec { 'repo_install':
 #   command => "rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm",
 #   path => ['/usr/bin', '/usr/sbin',],    
 # }

  package { 'puppet-agent':
    ensure  => installed,
    require => Yumrepo['puppet_repo'],
  #  require => Exec['repo_install'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => "http://yum.puppetlabs.com/el/7/PC1/$basearch",
    gpgkey   => "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
    enabled  => '1',
    gpgcheck => '1'
  }

   service { 'puppet':
    ensure  => 'running',
    enable  => true,
    require => Package['puppetserver'],
   }

  
}


