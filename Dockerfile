FROM codeception/codeception

# Install ssh-client.
RUN apt-get update && apt-get install ssh-client -y

# Install Drush: http://docs.drush.org/en/8.x/install-alternative/
RUN composer global require consolidation/cgr:2.0.* \
  && export PATH="$HOME/.composer/vendor/bin:$PATH" \
  && echo "export PATH=\"$HOME/.composer/vendor/bin:$PATH\"" >> ~/.bashrc \
  && cgr drush/drush:8.x

# Install Terminus: https://pantheon.io/docs/terminus/install/
RUN mkdir ~/terminus \
  && cd ~/terminus \
  && curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar \
  && php installer.phar install
