A Docker image with the Codeception and toolkit to integrate with the Pantheon hosting.

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

This image can be used for the Bitbucket Pipelines:

```
Will be added soon...
```
