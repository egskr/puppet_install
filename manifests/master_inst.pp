class puppet_install::master_inst {
     notify { 'Master': }


 file { 'autosign':
    path    => "/etc/puppetlabs/puppet/autosign.conf",
    content => template('puppet_install/autosign.erb'),
 }

  exec { 'repo_install':
    command => "rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm",
    path => ['/usr/bin', '/usr/sbin',],    
  }

  package { 'puppetserver':
    ensure  => installed,
    require => Yumrepo['puppet_repo'],
    require => Exec['puppet_repo'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => "http://yum.puppetlabs.com/el/7/PC1/$basearch",
    gpgkey   => "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
    enabled  => '1',
    gpgcheck => '1'
  }

   service { 'puppetserver':
    ensure  => 'running',
    enable  => true,
    require => Package['puppetserver'],
}

  

}
