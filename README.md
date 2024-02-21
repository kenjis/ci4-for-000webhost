# CodeIgniter 4 for 000webhost.com

## Restrictions

The `putenv()` function cannot be used on 000webhost.com. So DotEnv (`.env`)
does not work on the 000webhost.com servers.

If you want to set environment variables, use `public_html/.htaccess`:

```
SetEnv CI_ENVIRONMENT development
```

### Disabled Functions

The following functions are disabled on 000webhost.com.

mail, putenv, system, show_source, exec, shell_exec, proc_open, passthru,
set_time_limit, ini_restore, mysql_list_dbs, ini_alter, dl, pfsockopen, openlog,
syslog, symlink, link, chgrp, leak, popen, escapeshellcmd, apache_child_terminate,
apache_getenv, apache_note, apache_setenv, virtual, mb_send_mail

## Folder Structure

Upload your project files to the `foo.000webhostapp.com` folder.

Upload the contents of the project's `public` folder to `pubic_html`.

On the 000webhost:
```
    ├── foo.000webhostapp.com/ (for the application)
    │       ├── app/
    │       ├── vendor/
    │       └── writable/
    └── public_html/           (for the public folder)
            ├── .htaccess
            ├── favicon.ico
            ├── index.php
            └── robots.txt
```

## Uploading

### Installing Composer packages

The following command installs Composer packages for the production environment:

```
$ composer install --no-dev
```

### Uploading the project

Create a folder on the server with the hostname (e.g., `foo.000webhostapp.com`)
and upload the files in the project folder.

The following folders are required to run the application.

```
app/
vendor/
writable/
```

The following command creates a Zip file in the directory where the project 
folder (`ci4-for-000webhost`) is located:

```console
$ bin/make-zip.sh
```

Upload the Zip file with your File Manager.

I used `Unzipper` because the Zip file I uploaded to the server could not be 
extracted by the File Manager.

Unzipper
- https://youtu.be/NBvg6JJtzDo?si=7YHtZtc4mIAO52y0
- https://github.com/ndeet/unzipper

### Uploading public folder

Upload the all files except `.htaccess` in `ci4-for-000webhost/public` to
the server's `public_html` folder.

Open `.htaccess` on the File Manager, and add the contents in `public/.htaccess`.
