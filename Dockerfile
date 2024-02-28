FROM httpd:2.4

EXPOSE 8081

COPY . /usr/local/apache2/htdocs/

