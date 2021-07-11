pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh """
                            #!/bin/bash

                            echo "Build..."

                            # 1. Update dependencies in Jenkins workspace
                            python3 -m venv venv
                            . venv/bin/activate
                            pip install -r requirements.txt

                            # 2. Copy project from jenkins workspace to project directory on server
                            mkdir -p "${PROJECT_DIR}"
                            cp -R $WORKSPACE/* "${PROJECT_DIR}"

                            """
          }
        }

        stage('') {
          steps {
            echo 'Build test message'
          }
        }

      }
    }

    stage('Lint') {
      steps {
        sh '''
                #!/bin/bash

                echo "Lint..."

                . venv/bin/activate
                pip install flake8
                flake8 . --extend-exclude=dist,build,venv --show-source --statistics

                '''
      }
    }

    stage('Test') {
      steps {
        sh """
                        #!/bin/bash

                        echo "Unit Test..."

                        . venv/bin/activate
                        pip install pytest
                        pytest -v ./tests/* --junitxml=${TEST_REPORT}

                        """
      }
    }

  }
  environment {
    PROJECT_DIR = '/apps/farmbackend/'
    TEST_REPORT = 'test-reports/farmbackend_report.xml'
  }
}