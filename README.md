Дотфайлы для удалённых серверов.

### Установка и обновление
    
    sh -c "`curl -L bit.ly/dotserver`"
    
Склонит репу в домашнюю папку и создаст ссылки для конфигов, потом можно просто спулиться для&nbsp;обновления, либо ещё раз запустить oneliner.

### Содержимое

* Нормальный `PS1` (`\u@\h \w` и branch)
* Правильный `.inputrc` с русскими буквами
* Автозаполнение хостов из `~/.ssh/config`
* Базовые `.aliases`, в том числе для `git`, `bundler` и `rails`
* Настройки для `git`
* `.irbrc` с историей
* Нормальный `.vimrc`

### Собрано из:

* https://github.com/mathiasbynens/dotfiles
* https://github.com/thoughtbot/dotfiles
* http://mislav.uniqpath.com/2011/12/vim-revisited/
* и моих штук.
