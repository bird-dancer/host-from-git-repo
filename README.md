# host-from-git-repo
Push your code in a git repo and it will be deployed inside of a nginx server block
<br>
The relevant part of the folder structure loks like:

www<br>
    └── test<br>
        ├── content<br>
        │   └── [possible backend files]<br>
        │   └── html<br>
        │       └── index.html<br>
        └── test.git<br>
            ├── hooks<br>
            │   ├── post-receive

The nginx file inside of `sites-available` has `/var/www/test/content/html` as the root paramenter.

test is a varaible.
