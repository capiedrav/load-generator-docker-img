FROM alpine:latest

RUN apk add --update curl

# create user app_user
RUN addgroup -S app_user && \
    adduser -D -g "" -h /home/app_user -S app_user -G app_user 

# copy script 
WORKDIR /home/app_user
COPY load_generator.sh .

# change ownership and permissions
RUN chown app_user:app_user load_generator.sh && chmod 755 load_generator.sh

# define default values for env variables
ENV END_POINT=www.google.com
ENV SLEEP_INTERVAL=0.5

# set app_user as default user
USER app_user

# start the app
CMD [ "./load_generator.sh" ]
ENTRYPOINT [ "/bin/sh" ]
