pipeline{
    agent {label 'slave1'}
    tools{
        jdk 'java_home'
        maven 'maven_home'
    }
    parameters{
        gitParameter(branch: '', branchFilter: '.*', defaultValue: 'master', description: 'enter the branch name', name: 'branch', quickFilterEnabled: false, selectedValue: 'NONE', sortMode: 'NONE', tagFilter: '*', type: 'PT_BRANCH')
        string(defaultValue: '', description: '', name: 'git_url', trim: false)
    }
    stages{
        stage(checkout){
            steps{
                echo "checking out svn"
                checkout([$class: 'GitSCM', 
                          branches: [[name: "${params.branch}"]], 
                          doGenerateSubmoduleConfigurations: false, 
                          extensions: [], 
                          gitTool: 'Default', 
                          submoduleCfg: [], 
                          userRemoteConfigs: [[url: "${git_url}"]]
                        ])
            }
        }
        stage(test){
            steps{
                echo "performing test on code"
            }
        }
        stage(codequality){
            steps{
                echo "performing code quaity"
            }
        }
        stage(building){
            steps{
                echo "building a war or jar file"
                sh 'mvn clean install'
            }
        }
        stage(deploy){
            steps{
                echo "deployig the war file"
                sh 'cp /var/workspace/practice/practice1/test1/target/java-tomcat-maven-example.war /var/lib/tomcat/webapps'
            }
        }
    }
}
