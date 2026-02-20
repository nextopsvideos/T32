FROM alpine
WORKDIR /tmp
RUN mkdir ./new_directory
ENV INIT_USERNAME=admin
ENV INIT_PASS=password
COPY /home/charan/env_vars.txt .
CMD [ "/bin/sh" ]