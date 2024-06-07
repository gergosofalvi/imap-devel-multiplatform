# Dockerized IMAP server#

### IMAP Server for Debugging
<br>
<span class="colour" style="color:rgb(236, 236, 236)">**IMPORTANT:** This image is ONLY for development/debugging purposes.</span>

<span class="colour" style="color:rgb(236, 236, 236)">This is a forked repository created to enable running on ARM64 architecture and to facilitate multi-platform Docker builds. The Docker image is available as a multi-platform build on Docker Hub.</span>

<span class="colour" style="color:rgb(236, 236, 236)">Forked from: [antespi/docker-imap-devel](https://github.com/antespi/docker-imap-devel) Thanks to antespi for the original work which made this possible.</span>

<span class="colour" style="color:rgb(236, 236, 236)">The latest built version is 1.2: [Docker Hub Image - Version 1.2](https://hub.docker.com/layers/geriapp/imap-devel/1.2/images/sha256-418f6fd653a770e33bf7b9bbbc08bfd7a03f15ba7d1e29b7459a19bb36db32c4?context=repo)</span>

<br>
<br>
## Added Rainloop Webmailer:

URL: [http://localhost:8888/](http://localhost:8888/)
login name: debug
Login password: debug

<br>
Admin:
URL: [http://localhost:8888/?admin](http://localhost:8888/?admin)
admin name: admin
admin password: 12345

##
This docker image is based on https://github.com/tomav/docker-mailserver
If you look for a docker image for production environment, then go here:
https://hub.docker.com/r/tvial/docker-mailserver/

This image is even simpler than `tvial` docker image. Includes only
Postfix (SMTP) and Dovecot (IMAP) servers with one catchall mailbox
`debug@example.org` for all emails. So, it's very useful for debugging. Optionally, you can define another normal mailbox.

Every email received via SMTP will be delivered locally to `debug@example.org`, so it's safe for testing a web application sending emails with a production list of emails.

Using your favorite email client you can connect via IMAP protocol to see emails like original recipient would received them

## Run container with docker compose
<br>
```
cp docker-compose.yml.dist docker-compose.yml
```

Edit ```docker-compose.yml``` for set these environment variables:

* MAILNAME: Mail domain (by default, `localdomain.test`)
* MAIL\_ADDRESS: Normal user mailbox email address (optional)
* MAIL\_PASS: Normal user mailbox password

```
docker-compose up
```

Configure your email client with these parameters and test it sending
any email to any email address

### Catch all debug mailbox

* **IMAP server:** `imap`
* **IMAP encryption:** `SSL`
* **IMAP port:** `993`
* **IMAP username:** `debug@example.org` (change `example.org` by your `MAILNAME`)
* **IMAP password:** `debug`
* **SMTP server:** `imap`
* **SMTP encryption:** `No`
* **SMTP port:** `25`
* **SMTP authentication:** `none`

### Normal user mailbox (Optional)

* **IMAP server:** `imap`
* **IMAP encryption:** `SSL`
* **IMAP port:** `993`
* **IMAP username:** `address@example.org` (change `address@example.org` by your `MAIL_ADDRESS`)
* **IMAP password:** `pass` (change `pass` by your `MAIL_PASS`)
* **SMTP server:** `imap`
* **SMTP encryption:** `No`
* **SMTP port:** `25`
* **SMTP authentication:** `none`