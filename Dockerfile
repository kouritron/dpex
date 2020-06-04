
# Example Dockerfile that can run the code from this project.
# docker system prune -af
# docker image prune -af
# docker build --pull -t dpex ./ 
# docker run --rm -it -p 2082:2080 dpex                # port is host:container
# umask 0

FROM ubuntu:18.04

RUN apt update -y && \
apt install -y python3 python3-pip build-essential git curl nano jq htop wget pigz

# net-tools openjdk-8-jdk p7zip-full vim-common

# ! is a reserved word in bash, 
# put it in single quotes so its not interpreted
# printf format arg1 arg2 arg3 ...
RUN printf "%s\n%s\n\n" '#!/bin/bash' "jupyter lab / --allow-root --no-browser --port 2080 --ip 0.0.0.0" > /bin/rjl && chmod a+rwx /bin/rjl && \
printf "%s\n%s\n\n" '#!/bin/bash' "jupyter notebook / --allow-root --no-browser --port 2080 --ip 0.0.0.0" > /bin/rjn && chmod a+rwx /bin/rjn


# boto3 awscli psycopg2-binary pymysql cheroot flask
RUN pip3 install requests jupyter jupyterlab pillow numpy matplotlib

# TODO, matplotlib, octave, spark had some plot stuff as well. 

# ENV PATH="$PATH:/usr/local/go/bin"

CMD ["/bin/bash"]
