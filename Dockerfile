FROM thyrlian/android-sdk

ENV APP_HOME=/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update \
&& apt-get install -y curl make git \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update \
&& apt-get install -y yarn

RUN yarn global add react-native-cli
