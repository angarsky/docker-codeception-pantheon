A Docker image with the Codeception and a toolkit to integrate with the Pantheon hosting.

# Usage

Navigate to a directory with a ```codeception.yml``` file and run:

```
docker run -it -d -v $(pwd):/project --name angarsky-codeception-pantheon angarsky/codeception-pantheon
```

Run your tests:

```
docker exec -it angarsky-codeception-pantheon ./vendor/bin/codecept run functional -d
```

Install Composer dependencies (if it's necessary):

```
docker exec -it angarsky-codeception-pantheon composer install
```

# Bitbucket Pipelines

This image can be used for the Bitbucket Pipelines to run test with the Selenium driver:

```
pipelines:
  branches:
    master:
      - step:
          image: angarsky/codeception-pantheon
          services:
            - selenium
          artifacts:
            - codeception_tests/tests/_output/**
          script:
            - echo "127.0.0.1 selenium" >> /etc/hosts
            - cd codeception_tests
            - composer install
            - ./vendor/bin/codecept run functional -d --html functionalReport_$(date +%Y-%m-%d_%H-%M).html
            - ./vendor/bin/codecept run acceptance -d --html acceptanceReport_$(date +%Y-%m-%d_%H-%M).html
definitions:
  services:
    selenium:
      image: selenium/standalone-chrome:3.9.1
```
