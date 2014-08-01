# Class sendmail::server
#
# This class copies over server specific
# config files

class sendmail::server inherits sendmail {
  file { 'virtusertable':
    ensure  => $sendmail::manage_file,
    path    => $sendmail::virtualusers_file,
    mode    => $sendmail::config_file_mode,
    owner   => $sendmail::config_file_owner,
    group   => $sendmail::config_file_group,
    require => Package[$sendmail::package],
    notify  => $sendmail::manage_service_autorestart,
    source  => $sendmail::manage_virtualusers_source,
    content => $sendmail::manage_virtualusers_content,
    replace => $sendmail::manage_file_replace,
    audit   => $sendmail::manage_audit,
  }
  file { 'mailertable':
    ensure  => $sendmail::manage_file,
    path    => $sendmail::mailertable_file,
    mode    => $sendmail::config_file_mode,
    owner   => $sendmail::config_file_owner,
    group   => $sendmail::config_file_group,
    require => Package[$sendmail::package],
    notify  => $sendmail::manage_service_autorestart,
    source  => $sendmail::manage_mailertable_source,
    content => $sendmail::manage_mailertable_content,
    replace => $sendmail::manage_file_replace,
    audit   => $sendmail::manage_audit,
  }
}
