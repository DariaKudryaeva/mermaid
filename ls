mermaid
sequenceDiagram
    participant Клиент
    participant Система
    participant ПлатежнаяСистема
    participant Кухня

    Клиент->>Система: Просматривает меню пицц
    Клиент->>Система: Выбирает пиццу
    Клиент->>Система: Указывает размер и топпинги
    Клиент->>Система: Добавляет пиццу в корзину
    Клиент->>Система: Переходит к оформлению заказа
    Клиент->>Система: Вводит адрес доставки и контактную информацию
    Клиент->>Система: Выбирает желаемое время доставки
    Система->>Система: Сохраняет данные о заказе

    alt Клиент передумал
        Клиент->>Система: Удаляет пиццу из корзины
        Клиент->>Система: Выбирает другую пиццу
    else Клиент хочет добавить несколько пицц
        loop Для каждой дополнительной пиццы
            Клиент->>Система: Выбирает пиццу
            Клиент->>Система: Указывает размер и топпинги
            Клиент->>Система: Добавляет пиццу в корзину
        end
    end

    Система->>Клиент: Отображает сводку заказа
    Клиент->>Система: Выбирает способ оплаты
    Система->>ПлатежнаяСистема: Перенаправляет клиента на страницу оплаты
    Клиент->>ПлатежнаяСистема: Вводит данные для оплаты
    Клиент->>ПлатежнаяСистема: Подтверждает платеж

    alt Платеж не прошел
        ПлатежнаяСистема->>Система: Отправляет уведомление об ошибке
        Система->>Клиент: Отображает сообщение об ошибке
    else Платеж успешен
        ПлатежнаяСистема->>Система: Отправляет подтверждение платежа
        Система->>Система: Сохраняет информацию об оплате
        Система->>Кухня: Отправляет квитанцию о заказе
        Кухня->>Кухня: Готовит заказанные пиццы
        Кухня->>Система: Отмечает заказ как готовый к доставке
        Система->>Клиент: Отправляет уведомление о статусе заказа
    end

    alt Возникли вопросы по заказу
        Кухня->>Клиент: Связывается для уточнения деталей
    end