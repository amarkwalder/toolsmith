import jenkins.model.*
import org.jenkinsci.plugins.*

File tmpFile = new File("/var/jenkins_home/init.groovy.d/setup-gitlab-oauth.groovy.done")
if ( ! tmpFile.exists()) {

  def installed = false

  def instance = Jenkins.getInstance()
  def uc = instance.getUpdateCenter()
  def pm = instance.getPluginManager()
  def env = System.getenv()


  println(" ---> Check if plugin 'gitlab-oauth' is installed")
  if (pm.getPlugin("gitlab-oauth")) {

    println(" ---> Setting security realm")
    def gitlabSecurityRealm = Class.forName("org.jenkinsci.plugins.GitLabSecurityRealm").newInstance(
      "https://${GITLAB_HOSTNAME}",
      "https://${GITLAB_HOSTNAME}",
      env['GITLAB_OAUTH_APP_JENKINS_ID'],
      env['GITLAB_OAUTH_APP_JENKINS_SECRET']
    )
    instance.setSecurityRealm(gitlabSecurityRealm)


    println(" ---> Setting authorization strategy")
    def strategy = Class.forName("org.jenkinsci.plugins.GitLabAuthorizationStrategy").newInstance(
      "root",
      true,
      true,
      true,
      "",
      false,
      false,
      false,
      false
    )
    instance.setAuthorizationStrategy(strategy)


    println(" ---> Stop Switch for 'setup-gitlab-oauth.groovy'")
    File donefile = new File("/var/jenkins_home/init.groovy.d/setup-gitlab-oauth.groovy.done")
    donefile.text = "true"


    println(" ---> Security settings changed, requires a restart!")
    instance.save()
    instance.doSafeRestart()

  }
  else {

    println(" ---> Plugin 'gitlab-oauth' is not installed")

  }

}
