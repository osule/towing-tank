FROM python:3.6
RUN apt-get update --fix-missing \
    && apt-get install -y unzip
COPY . .
RUN pip3 install pyyaml && python rig.py

FROM java:8
COPY --from=0 /usr/bin /usr/bin
COPY config.json .
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb
RUN curl -o selenium-server-standalone-3.10.0.jar https://selenium-release.storage.googleapis.com/3.10/selenium-server-standalone-3.10.0.jar

EXPOSE 4000
CMD java -jar selenium-server-standalone-3.10.0.jar -p 4000 -role standalone -config config.json
