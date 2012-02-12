Дотфайлы для удалённых серверов.

### Установка
    
    cd
    git clone git://github.com/macovsky/dotserver.git
    ./dotserver/install.sh
    
Чтобы избежать вопросов:

    ./dotserver/install.sh --force
    
`install.sh` создаст ссылки для конфигов в домашней папке, потом можно просто спулиться для&nbsp;обновления.

### Содержимое

* Нормальный `PS1` (`\u@\h \w` и branch)
* Правильный `.inputrc` с русскими буквами
* Автозаполнение хостов из `~/.ssh/config`
* Базовые `.aliases`, в том числе для `git`, `bundler` и `rails`
* Настройки для `git`
* `.irbrc` с историей
* Минимальный `.vimrc`

### Собрано из:

* https://github.com/mathiasbynens/dotfiles
* https://github.com/thoughtbot/dotfiles
* http://mislav.uniqpath.com/2011/12/vim-revisited/
* и моих штук.
