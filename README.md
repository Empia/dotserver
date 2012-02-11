Конфиги для удалённых серверов.

### Установка
    
    cd
    git clone git://github.com/macovsky/dotserver.git
    ./dotserver/install.sh
    
Чтобы избежать вопросов:

    ./dotserver/install.sh --force
    
`install.sh` создаст ссылки для конфигов в домашней папке, потом можно просто спулиться для апдейта.

### Содержимое

* Нормальный `PS1`
* Правильный `.inputrc` с русскими буквами
* Автозаполнение хостов из `~/.ssh/config`
* Базовые алиасы, в том числе для `bundler`, `git`, `rails`
* Настройки для `git`
* `.irbrc` с историей
* Минимальный `.vimrc`

### Собрано из:

* https://github.com/mathiasbynens/dotfiles
* https://github.com/thoughtbot/dotfiles
* http://mislav.uniqpath.com/2011/12/vim-revisited/
* и моих штук.
