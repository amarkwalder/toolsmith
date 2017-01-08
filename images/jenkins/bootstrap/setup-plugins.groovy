import jenkins.model.*

File tmpFile = new File("/var/jenkins_home/init.groovy.d/setup-plugins.groovy.done")
if ( ! tmpFile.exists()) {

  def installed = false

  def instance = Jenkins.getInstance()
  def uc = instance.getUpdateCenter()
  def pm = instance.getPluginManager()

  def pluginsToInstall = "credentials display-url-api git-client git gitlab-oauth "
  pluginsToInstall    += "junit mailer matrix-project scm-api script-security "
  pluginsToInstall    += "ssh-credentials structs workflow-scm-step workflow-step-api"

  def plugins = pluginsToInstall.split()
  println(" ---> Install plugins " + plugins)

  println(" ---> Initialize and update all sites from Update Center")
  uc.updateAllSites()

  plugins.each {
    println(" ---> Check Plugin '" + it + "'")
    if (pm.getPlugin(it)) {

        println(" ---> Plugin '" + it + "' already installed")

    }
    else {

      println(" ---> Plugin '" + it + "' not installed")

      println(" ---> Lookup plugin '" + it + "' in Update Center")
      def plugin = uc.getPlugin(it)
      if (plugin) {

        println(" ---> Install plugin '" + it + "'")
      	plugin.deploy()
        installed = true

      }
      else {

        println(" ---> Plugin '" + it + "' not found in Update Center")

      }

    }

  }

  if (installed) {

    println(" ---> Plugins installed, requires a restart!")
    instance.save()
    instance.doSafeRestart()

  }
  else {

    println(" ---> Stop Switch for 'setup-plugins.groovy'")
    File donefile = new File("/var/jenkins_home/init.groovy.d/setup-plugins.groovy.done")
    donefile.text = "true"

    println(" ---> Delete stop switch for 'setup-gitlab-oauth.groovy'")
    File donefile2 = new File("/var/jenkins_home/init.groovy.d/setup-gitlab-oauth.groovy.done")
    if (donefile2.exists()) {
      donefile2.delete()
    }

    println(" ---> Configuration of 'gitlab-oauth' requires a restart!")
    instance.doSafeRestart()

  }

}
