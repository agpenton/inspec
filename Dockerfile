FROM ubuntu

RUN apt update \
    && apt upgrade -y \
    && apt install ruby2.7 ruby2.7-dev vim wget make gcc g++ git -y \
    && echo 'export PATH="/root/.gem/ruby/2.7.0/bin:PATH"' >> ~/.bashrc
# ADD https://packages.chef.io/files/stable/inspec/4.52.9/ubuntu/20.04/inspec_4.52.9-1_arm64.deb /code/
# RUN dpkg -i /code/inspec_4.52.9-1_arm64.deb \
RUN gem install inspec-bin inspec \
# RUN dpkg -i /code/inspec_4.52.9-1_arm64.deb 
    && gem install train-kubernetes \
    && inspec plugin install train-kubernetes --chef-license accept \
    && rm -Rf /code/*.*

RUN useradd inspec -m -s /bin/bash \
    && usermod -aG inspec root

# RUN chown -R inspec:inspec /code/

# USER inspec

WORKDIR /code/

# RUN gem install --user-install train-kubernetes \
#     && inspec plugin install train-kubernetes --chef-license accept 
