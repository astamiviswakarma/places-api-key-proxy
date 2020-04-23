FROM google/dart:1.24

ENV PORT 8088
ENV API_KEY AIza_googleDemoKeyShouldBeReplaced
ENV CROSS_ORIGIN '*'

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline

CMD /usr/bin/dart /app/bin/main.dart -k "${API_KEY}" -p "${PORT}" -o "${CROSS_ORIGIN}"