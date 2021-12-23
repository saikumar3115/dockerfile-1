FROM ubuntu:14.04
RUN touch abc1
RUN mkdir newdirectory
RUN apt-get  -y update
RUN apt-get install -y apache2
RUN apt-get install -y tree
LABEL Name="saikumar"
LABEL mobile="9620531019"
LABEL email="s.devon.nl"
MAINTAINER "saikumar c"
ENV Name=user1
ENV pass=user1
RUN useradd $Name && echo "$Name:$pass" | chpasswd
RUN apt-get install -y zip && apt-get install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page270/unika.zip /var/www/html
WORKDIR /var/www/html
RUN unzip unika.zip
RUN cp -rvf unika-html/* .
RUN cp -rvf unika-html/unika-html/* .
RUN rm -r unika-html
RUN rm -r unika.zip
EXPOSE 80
ENTRYPOINT service apache2 start && bash
