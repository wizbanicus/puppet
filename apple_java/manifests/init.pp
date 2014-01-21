# Class apple_java
# forces use of apples java 6 over the newer java 7
#
class apple_java {
  file { javaplugin:
    target => '/System/Library/Java/Support/Deploy.bundle/Contents/Resources/JavaPlugin2_NPAPI.plugin',
    ensure => link,
    path   => '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin',
    force  => true,
  }
  file { javawebstart:
    path   => '/usr/bin/javaws',
    ensure => link,
    target => '/System/Library/Frameworks/JavaVM.framework/Commands/javaws',
    force  => true,
  }
}
