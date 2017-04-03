# Apache Catalog

Using this catalog, you can serve your PHP apps from the mounted volume.

### Local Driver QuickStart

  1. Use default values
  2. Launch catalog
  3. Add PHP app to volume mountpoint.
  	 
       * Locate your host IP from Rancher UI (Infrastructure -> Hosts) 
       * Download host's machine config 
       * Locate the host `id_rsa` file 
       * ssh into host: `ssh -i {HOST_ID_RSA_PATH} root@{HOST_IP}`
       * Locate local volume 
       
         `docker volume ls`
         
         it should look something like this `apache1_content_041e7`
         
       
       * `docker volume inspect {APACHE_LOCAL_VOLUME}` 
       * copy string under Mountpoint 
       * `cd {MOUNTPOINT_PATH}`
       * Clone the PHP app into `{MOUNTPOINT_PATH}`
       * Voila! Your app is served