## Название проекта

Задание 2. Просмотр погоды и музеев для варианта 17.

## Описание

Приложение на Objective-C показывает температуру с цветовым индикатором и
известный музей для выбранного города из Грузии или Франции.

### Города

| Город | Страна | Температура | Музей |
|---|---|---|---|
| Tbilisi | Georgia | 25°C | National Museum of Georgia |
| Batumi | Georgia | 22°C | Batumi Archaeological Museum |
| Paris | France | 15°C | The Louvre |
| Lyon | France | 18°C | Musée des Confluences |

Правило цвета:

- красный, если температура выше `20°C`;
- синий, если температура `20°C` и ниже.

## Установка

1. Создать новый проект Xcode типа `App`, язык `Objective-C`, интерфейс `Storyboard`.
2. Скопировать `ViewController.h` и `ViewController.m` в проект.
3. Скопировать файлы `*.lproj/Localizable.strings` и включить три локали в
   настройках проекта.
4. В `Main.storyboard` добавить `UISegmentedControl`, два `UILabel`,
   `UIImageView` и `UIButton`.
5. Связать `IBOutlet` и `IBAction` с `ViewController`.
6. Добавить изображения музеев в `Assets.xcassets` с именами
   `museum_tbilisi`, `museum_batumi`, `museum_paris`, `museum_lyon`.

## Использование

Выбрать город через `UISegmentedControl` или нажать кнопку обновления, чтобы
переключиться к следующему городу и обновить температуру, название музея и
изображение.

## Авторы

Ivan Nasennik — Group 12b

## Ссылки и дополнительные сведения

- Поддерживаемые языки: английский, русский, белорусский
- Основная логика находится в `task2/ViewController.m`
