pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/Ghemarc-star/devops-lab.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: env.REPO_URL,
                    credentialsId: 'github-credentials'
                echo "✅ Code checked out"
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
                echo "✅ Terraform init"
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
                echo "✅ Terraform validate passed"
            }
        }

        stage('Check Node Count') {
            steps {
                script {
                    def nodeCount = sh(script: "echo 'var.node_count' | terraform console", returnStdout: true).trim()
                    if (nodeCount != "3") {
                        error("❌ Node count is ${nodeCount}, expected 3")
                    }
                    echo "✅ Node count is 3"
                }
            }
        }

        stage('Check Security') {
            steps {
                script {
                    def hasFirewall = sh(script: "grep -q 'source_ranges = \\[\"0.0.0.0/0\"\\]' main.tf", returnStatus: true) == 0
                    if (!hasFirewall) {
                        error("❌ Missing or insecure firewall rule")
                    }
                    echo "✅ Basic security check passed"
                }
            }
        }

        stage('Push Status to GitHub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'github-credentials', variable: 'GITHUB_TOKEN')]) {
                        sh """
                            echo "Terraform validation passed at \$(date)" > tf-status.txt
                            git config user.email "jenkins@localhost"
                            git config user.name "Jenkins CI"
                            git add tf-status.txt
                            git commit -m "Terraform validation success #${env.BUILD_NUMBER}" || echo "No changes"
                            git push https://${GITHUB_TOKEN}@github.com/Ghemarc-star/devops-lab.git main
                        """
                    }
                }
                echo "✅ Status pushed to GitHub"
            }
        }
    }

    post {
        success {
            echo "🎉 Terraform validation pipeline SUCCESS!"
        }
        failure {
            echo "❌ Pipeline FAILED!"
        }
    }
}
