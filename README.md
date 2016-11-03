Einbinden in die Vagrant Testumgebung
-------------------------------------

Damit mit diesem Repository in der Vagrant umgebung getestet werden kann wie die Puppetscripts funktionieren ist folgender Ansatz empfehlenswert:

1. Das Projekt per git in puppet.v.bbvsws.de auschecken
1. Einen Symlink auf das Projekt setzen und zwar folgendermaßen


> sudo su <br>
> cd /etc/puppetlabs/code/environments <br>
> rm -rf production <br>
> ln -s /home/vagrant/puppet_bbv production <br>

Danach ist dieses Repository zur konfiguration in den Puppetmaster eingebunden.
 
Durch das Script "puppet-modules-upgrade.sh" können dann die entsprechenden Module aktualisiert werden.
Damit das klappt muss das Skript entsprechend aktualisiert werden.
Damit in intelliJ die Codecompletion funktioniert müssen die entsprechenden Module commited werden.
