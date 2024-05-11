# Package

**Установка**

`pip install ptaster`

**Использование**

```python
# Подключаем модуль
from ptaster import Protocol
from ptaster import ProxyDict
from ptaster import ProxiesTaster
from ptaster.events_data import Events

# Список прокси
proxies = [
     # Простая передачи списка прокси
     '184.178.172.28:15294',
     '142.54.226.214:4145',
     '174.77.111.196:4145',
     '72.195.114.169:4145',

     # Установить проверяемый прокси
     # прямо в строке с самим прокси
     'socks5://184.95.235.194:1080',

     # Или за счет использования объекта
     # ptaster.ProxyDict
     ProxyDict(
         protocol = Protocol.SOCKS4,
         proxy = '125.141.139.112:5566'
     )
]

# Иницилизируем класс
taster = ProxiesTaster(proxies)

# Установка настроек
taster.set_workers(300)
taster.set_protocols(
    [
        Protocol.SOCKS4,
        Protocol.SOCKS5,
        Protocol.HTTP
    ]
)

# Также доступны установки
# обработчиков на разные события
taster.on(Events.error, lambda event: print(event))
taster.on(Events.check_error, lambda event: print(event))

taster.on(
    Events.check_success, lambda event: print(
        f"Proxy is working {event.proxy.proxy}"
    )
)

# Запускаем проверку
# и получаем результат
proxies = await taster.run()
```

# Contents:

* [ProxiesTaster](package/ProxiesTaster.md)
  * [`ProxiesTaster`](package/ProxiesTaster.md#ptaster.ProxiesTaster)
* [Types](package/types.md)
  * [`Protocol`](package/types.md#ptaster.types.Protocol)
  * [`Proxies`](package/types.md#ptaster.types.Proxies)
  * [`ProxyDict`](package/types.md#ptaster.types.ProxyDict)
  * [`WorkedProxy`](package/types.md#ptaster.types.WorkedProxy)
* [Events](package/events_data.md)
  * [`End`](package/events_data.md#ptaster.events_data.End)
  * [`Error`](package/events_data.md#ptaster.events_data.Error)
  * [`Event`](package/events_data.md#ptaster.events_data.Event)
  * [`Events`](package/events_data.md#ptaster.events_data.Events)
  * [`Proxy`](package/events_data.md#ptaster.events_data.Proxy)
  * [`ProxyError`](package/events_data.md#ptaster.events_data.ProxyError)
  * [`ProxySuccess`](package/events_data.md#ptaster.events_data.ProxySuccess)
  * [`RunEnd`](package/events_data.md#ptaster.events_data.RunEnd)
  * [`RunStart`](package/events_data.md#ptaster.events_data.RunStart)
  * [`Start`](package/events_data.md#ptaster.events_data.Start)
  * [`Success`](package/events_data.md#ptaster.events_data.Success)
