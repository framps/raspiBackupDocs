# Maintainer, repository owner and webserver admin

The details of the format of the markdown pages see [EDIT.md](EDIT.md)

## Workflo to generate *GitHub Pages*

  1. Edit of markdown files locally or in a browser
  1. commit + push
  1. Wait for about 30 seconds until the new documantation was generated and deployed

The deployed documentaion is available via following links on github pages:

  - https://framps.github.io/raspiBackupDocs/ (English pages)
  - https://framps.github.io/raspiBackupDocs/de/ (German pages)

The generation workflow is controlled via following file:
`.github/workflows/mdbook.yml` initiiert und gesteuert.

In order to get the workflow to start when a new commit was pushed following settings in the repository have to be enabled:
Open "Build and deployment" and select "GitHub Actions":

![github-pages-settings](readme-images/m1-github-pages-settings.png)


## Steps to publish the documentation on a webserver


> [!IMPORTANT]
> Prerequisite to generate the pages locally:
> Installed Rust environment with compiler `rustc`, `mdbook` and preprocessorsfor `mdbook` 
> See [INSTALL.md](INSTALL.md).

  1. Editieren hte markdown files locally
  1. generate the websites localla 
     (Target directory is `book` in the language subdirectories)

     "en/de" is required because the documentation is generated in multiple languages
     and their source code is located in the different language subdirectories

         mdbook build en     # "en" is default and fallback
         mdbook build de     # "de" is the documentation in German. Other languages can be added 

     Test the generated webpages with the local development webservice http://localhost:3000  
     `mdbook serve` internally calls 'build' agains one language and therefore 
     **every language has to be tested in a separate step** with

         mdbook serve en

     and 

         mdbook serve de

  1. Upload of the generated documentation to a webserver

     `lftp` is supported 

     **Note**: First "en", the default is uploaded and then the other languages.

         lftp sftp://${WEBSERVER} -e "cd ${WEBSERVER_ROOTDIR} ; rm -r raspiBackupDocs; mirror -R en/book raspiBackupDocs; cd raspiBackupDocs ; mirror -R de/book de ; put htaccess -o .htaccess ; dir ; quit"

     Details for the configuration of a webserver with *Apache* see [README-apache.md](README-apache.md)

  1. commit + push


> [!TIP]
> There exists a simple `Makefile` in the repository fth following targets:
>
> Es bietet die Kommandos
>
>   - make build
>   - make upload
>   - make all   # (execute build and upload in sequence)


> [!TIP]
> It's possible to generate the websites without a local build. Just download and extract from 
> *GitGub Actions Workflow* the generated artifacts. Don't forget to update the makefile 
> because the website then already exists in it's final directoy layout.


**TODO**: URL der generierten Dokumentation besprechen und hier nachtragen.

