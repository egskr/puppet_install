class puppet_install::test 

{
exec { 'install_repo':
    command     => "rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm",
    path        => '/bin/',
}



package { 'puppetserver':
    ensure  => installed,
    require => Exec['install_repo'],
}

  notify { "###### MISSION COMPLETE ######" :}          
}

