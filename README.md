# host-from-git-repo
Push your code in a git repo and it will be deployed inside of a nginx server block


## how to use it:
>- create a new user if required
- execute shell script as super user or owner of the `/var/www` directory
- answer the questions
- add the remote repository `host-address:/var/www/reponame/reponame.git` on your machine


## how it works:
The pushed code will be put inside the `/var/www/.../content` because of the hook-file `post-receive`

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
            
(The repository name in this case is test)

The nginx file inside of `sites-available` has `/var/www/test/content/html` as the root paramenter.
