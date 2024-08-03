FROM centos:latest

LABEL maintainer="kanimerakasatish29@gmail.com"

RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip

# Use the local file instead of remote URL
ADD photogenic.zip /var/www/html/

WORKDIR /var/www/html/
RUN sh -c 'unzip -q "*.zip"'
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# Continue with other instructions
EXPOSE 80
