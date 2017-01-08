import jenkins.model.*
import hudson.model.*
import hudson.security.*
import java.util.logging.Logger

File tmpFile = new File("/var/jenkins_home/init.groovy.d/setup-admin.groovy.done")
if ( ! tmpFile.exists()) {

  def env = System.getenv()
  def user = "${JENKINS_ADMIN_USER}"
  def pwd = env['JENKINS_ADMIN_PASSWORD']

  def admin = User.get(user,false,null)
  if (admin != null) {

    println(" ---> User '" + user + "' already exist")

  }
  else {

    println(" ---> Creating local user '" + user + "'")

    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount(user,pwd)

    println(" ---> Resetting security realm and authorization strategy")

    def instance = Jenkins.getInstance()
    instance.setSecurityRealm(hudsonRealm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)

    println(" ---> Stop Switch for 'setup-admin.groovy'")
    File donefile = new File("/var/jenkins_home/init.groovy.d/setup-admin.groovy.done")
    donefile.text = "true"

    println(" ---> Save instance")
    instance.save()

    println(" ---> Security settings changed, requires a restart!")
    instance.doSafeRestart()

  }

}
