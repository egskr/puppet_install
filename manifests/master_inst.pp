class puppet_install::master_inst {
     notify { 'Master': }


  package { 'puppetserver':
    ensure  => installed,
    require => Yumrepo['puppet_repo'],
  }

  yumrepo { 'puppet_repo':
    ensure   => 'present',
    baseurl  => "http://yum.puppetlabs.com/el/7/PC1/x86_64/",
    gpgkey   => "https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs",
    enabled  => '1',
    gpgcheck => '1'
  }

  file { 'autosign':
    path    => "/etc/puppetlabs/puppet/autosign.conf",
    content => template('puppet_install/autosign.erb'),
    require => Package['puppetserver'],
 }

   service { 'puppetserver':
    ensure  => 'running',
    enable  => true,
    require => Package['puppetserver'],
}

  

}
