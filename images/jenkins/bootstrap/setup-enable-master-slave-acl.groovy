import jenkins.model.*

File tmpFile = new File("/var/jenkins_home/init.groovy.d/setup-enable-master-slave-acl.groovy.done")
if ( ! tmpFile.exists()) {

  println(" ---> Create Master / Slave Kill Switch")
  File file = new File("/var/jenkins_home/secrets/slave-to-master-security-kill-switch")
  file.text = "false"

  println(" ---> Stop Switch for 'setup-enable-master-slave-acl.groovy'")
  File donefile = new File("/var/jenkins_home/init.groovy.d/setup-enable-master-slave-acl.groovy.done")
  donefile.text = "true"

  println(" ---> Settings changed, requires a restart!")
  def instance = Jenkins.getInstance()
  instance.doSafeRestart()

}
