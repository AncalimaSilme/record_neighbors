# RecordNeighbors

Это простой плагин для Ruby/Ruby on Rails, расширяющий возможность ActiveRecord

### Предупреждение

На _данный момент_ нормальная работа плагина не гарантируется, если вы используете default_scope

### Установка

##### Для Ruby c ActiveRecord

```
gem install 'record_neighbors'
```

```
# my_app.rb
require 'active_record'
require 'record_neighbors'
```

##### Для Ruby on Rails

    # Gemfile
    gem 'record_neighbors'

### Список методов

* first?
* last?
* next
* previous
* all_after
* all_before
* all_without

В качестве параметра методам можно передать название столбца. Выборка будет отсортирована по переданному атрибуту.

#### Подробнее о методах  "first?" и last?

Методы **first?** и **last?** возращают TRUE если элемент является первым/последним в выборке.
Пример использования:

    Post.find(1).first?                          #=> true
    Post.find_by(position: 1).first?(:position)  #=> true

    Post.find(10).last?                          #=> true
    Post.find_by(position: 1).first?(:position)  #=> true

#### Подробнее о методах  "next" и "previous"

Как следует из названия, методы **next** и **previous** возращают следующий/предыдущий объект в выборке.
Пример использования:

    Post.find(1).next      #=> #<Post id: 2, position: 3>
    Post.find(5).previous  #=> #<Post id: 4, position: 10>

    post.find_by(position: 1).next(:position)       #=> #<Post id: 1, position: 2>
    post.find_by(position: 5).previous(:position)   #=> #<Post id: 10, position: 4>

#### Подробнее о методах  "all_before и "all_after"

Методы **all_before** и **all_after** возвращают коллекцию объектов до/после текущего. Текущий элемент не включается.

    Post.find(5).all_before
    Post.find(5).all_after

    Post.find_by(position: 5).all_before(:position)
    Post.find_by(position: 5).all_after(:position)

#### Подробнее о методах  "all_without"

Методы **all_without** возвращают коллекцию объектов без текущего элемента.

    Post.find(5).all_without.pluck(:id)   #=> [1, 2, 3, 4, 6, 7, 8, 9, 10]
