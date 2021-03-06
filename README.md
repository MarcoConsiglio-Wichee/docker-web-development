# Ambiente di sviluppo PHP
Tutto quello di cui hai bisogno per cominciare a sviluppare in PHP.

## Requisiti

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/get-docker/)

## Installazione

1. Soddisfa i requisiti.
2. `cd cartella/che/vuoi.`
3. `git clone https://github.com/MarcoConsiglio-Wichee/docker-web-development.git .`
3. `docker-compose up`
4. Visita <http://127.0.0.1> per PHPINFO o <http://127.0.0.1/db_test.php>.
5. Crea i tuoi script PHP in `app/public`.

## Debug
Per utilizzare xDebug configura il file `config/xdebug.ini` inserendo il codice del tuo IDE.
- Visual Studio Code: `xdebug.idekey=VSCODE`
- Netbeans: `xdebug.idekey=netbeans-xdebug`
- Notepad++: `xdebug.idekey=xdebug`
- PHP Storm: `xdebug.idekey=PHPSTORM`
- Sublime Text 3: `xdebug.idekey=sublime.xdebug`

La porta su cui sarà in ascolto il client è la `9001` anziché quella standard `9000`, per evitare
che vada in conflitto con php-fpm. Pertanto bisogna istruire l'IDE di mettersi in ascolto sulla `9001`

