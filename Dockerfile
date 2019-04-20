FROM openjdk:8u181-jdk-alpine3.8

RUN apk -U add bash haveged supervisor git curl

RUN git clone https://github.com/n-y-z-o/nyzoVerifier.git

WORKDIR /nyzoVerifier

RUN ./gradlew build
RUN mkdir -p /var/lib/nyzo/production
RUN cp trusted_entry_points /var/lib/nyzo/production/trusted_entry_points

RUN bash -c 'echo "$HOSTNAME" > /var/lib/nyzo/production/nickname'
#RUN bash -c 'echo "$PRIVATE_SEED" > /var/lib/nyzo/production/verifier_private_seed'

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /etc/supervisor/conf.d
RUN cp nyzoVerifier.conf /etc/supervisor/conf.d/
RUN sed -i 's/home\/ubuntu//g' /etc/supervisor/conf.d/nyzoVerifier.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
