# Apache Catalog

This is a catalog to bring up the stack for an Apache server. 

If SSL termination for Apache is enabled and you do not enter both a key and certificate, a self-signed certificate will be generated for you and populated under `/etc/apache2/ssl` for you.

Possible Apache configurations:

- Apache Webserver
- Apache Reverse Proxy

## Examples

#### Apache Webserver + Loadbalancer
1. Start with default values
2. `Loadbalancer Protocol: http`
3. `Apache Role: webserver`
4. `Server Admin: <admin@email.com>`
5. `Server Name: <your_domain.com>`
6. `Server Alias: <alias.your_domain.com>`
7. Populate `/var/www/html` path on Apache server with `index.html` or `index.php`

#### Apache Webserver
1. Start with default values
2. `Loadbalancer Protocol: none`
3. `Apache Role: webserver`
4. `Server Admin: <admin@email.com>`
5. `Server Name: <your_domain.com>`
6. `Server Alias: <alias.your_domain.com>`
7. Populate `/var/www/html` path on Apache server with `index.html` or `index.php`

#### Apache Webserver + SSL Termination
1. Start with default values
2. `Loadbalancer Protocol: none`
3. `Apache Role: webserver`
4. `Server Admin: <admin@email.com>`
5. `Server Name: <your_domain.com>`
6. `Server Alias: <alias.your_domain.com>`
7. `Apache SSL Termination: true`
8. `Apache SSL Key: <your SSL key>`
9. `Apache SSL Certificate: <your SSL certificate>`
10. Populate `/var/www/html` path on Apache server with `index.html` or `index.php`

#### Apache Reverse Proxy
1. Outside of catalog, add new stack. Name it tomcat:
   ```
   # docker-compose.yml
   version: '2'
   services:
     tomcat:
       image: tomcat:8.0
       scale: 1
   ```
2. Start catalog with default values. Name the service `apache`.
3. `Apache Role: reverse-proxy`
4. `Server Admin: <admin@email.com>`
5. `Server Name: <your_domain.com>`
6. `Server Alias: <alias.your_domain.com>`
7. `External Service Link: <proxied_stack_and_service>`
8. `Proxied Service: <proxied_service>`
9. `Proxy Port: <port_exposed_on_proxied_service>`

#### Apache Reverse Proxy + SSL Termination
1. Outside of catalog, add new stack. Name it tomcat:
   ```
   # docker-compose.yml
   version: '2'
   services:
     tomcat:
       image: tomcat:8.0
       scale: 1
   ```
2. Start catalog with default values. Name the service `apache`.
3. `Apache Role: reverse-proxy`
4. `Server Admin: <admin@email.com>`
5. `Server Name: <your_domain.com>`
6. `Server Alias: <alias.your_domain.com>`
7. `External Service Link: <proxied_stack_and_service>`
8. `Proxied Service: <proxied_service>`
9. `Proxy Port: <port_exposed_on_proxied_service>`
10. `Apache SSL Termination: true`
11. `Apache SSL Key: <your SSL key>`
12. `Apache SSL Certificate: <your SSL certificate>`