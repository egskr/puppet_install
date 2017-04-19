class puppet_install
  (
    $baseurl = 'http://yum.puppetlabs.com/el/7/PC1/x86_64/'
    $gpgkey = 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
    $autosign_path = '/etc/puppetlabs/puppet/autosign.conf'
  )

 {

  if $::definition == 'true' {
    include puppet_install::master_inst
  }
  else {
    include puppet_install::agent_inst
  }

}
