class aptrepo {
  apt::pin { 'oracle-java6-installer':
    ensure   => present,
    packages => 'oracle-java6-installer',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'oracle-java7-installer':
    ensure   => present,
    packages => 'oracle-java7-installer',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'oracle-java9-installer':
    ensure   => present,
    packages => 'oracle-java9-installer',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-6-jre':
    ensure   => present,
    packages => 'openjdk-6-jre',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-6-jdk':
    ensure   => present,
    packages => 'openjdk-6-jdk',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-6-jre-headless':
    ensure   => present,
    packages => 'openjdk-6-jre-headless',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-7-jre':
    ensure   => present,
    packages => 'openjdk-7-jre',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-7-jdk':
    ensure   => present,
    packages => 'openjdk-7-jdk',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-7-jre-headless':
    ensure   => present,
    packages => 'openjdk-7-jre-headless',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-8-jre':
    ensure   => present,
    packages => 'openjdk-8-jre',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-8-jdk':
    ensure   => present,
    packages => 'openjdk-8-jdk',
    priority => -1,
    version  => '*',
  }

  apt::pin { 'openjdk-8-jre-headless':
    ensure   => present,
    packages => 'openjdk-8-jre-headless',
    priority => -1,
    version  => '*',
  }
}